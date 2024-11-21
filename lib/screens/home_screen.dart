import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> newReleases;
  late Future<List<Movie>> topTVShows;
  late Future<List<Movie>> documentaries;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Codes are intentionally removed.  If you want the complete code files and more help connect with me through LinkedIn

  void _updateFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieZZ',
          style: TextStyle(
            fontFamily: 'RacingSansOne',
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Colors.redAccent,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('All'),
                  _buildFilterButton('Movies'),
                  _buildFilterButton('Shows'),
                  _buildFilterButton('Documentaries'),
                  _buildFilterButton('Action'),
                  _buildFilterButton('Comedy'),
                  _buildFilterButton('Drama'),
                  _buildFilterButton('Horror'),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _fetchSectionData(),
              builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView(children: snapshot.data!);
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildFilterButton(String filter) {
    bool isActive = filter == selectedFilter;
    return GestureDetector(
      onTap: () => _updateFilter(filter),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isActive ? Colors.transparent : Colors.orange,
            width: 1.5,
          ),
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Codes are intentionally removed.  If you want the complete code files and more help connect with me through LinkedIn

  Widget _buildHorizontalSection(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MovieCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
