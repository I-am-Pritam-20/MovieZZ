import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/bottom_navbar.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];
  bool _isLoading = false;

// Codes are intentionally removed.  If you want the complete code files and more help connect with me through LinkedIn
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
            );
          },
        ),
        title: TextField(
          controller: _searchController,
          onChanged: _searchMovies,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _searchResults.isEmpty
          ? Center(child: Text('No results found'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final movie = _searchResults[index];
          return MovieCard(movie: movie);
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
