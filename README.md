# Flutter Movie App
(Not a Netflix Clone)

## Overview
This Flutter application showcases movies using the [TVMaze API](https://api.tvmaze.com). The app includes the following features:
- A **Splash Screen**.
- A **Home Screen** displaying all movies.
- A **Search Screen** to search for specific movies.
- A **Details Screen** showing detailed information about a selected movie.

The user interface is designed to resemble Netflix, and a bottom navigation bar allows seamless navigation between the Home and Search screens.

---

## Features

### 1. Splash Screen
- Displays an appropriate themed image during app launch.

### 2. Home Screen
- Fetches and displays movies from the API endpoint: `https://api.tvmaze.com/search/shows?q=all`.
- Each movie card shows:
  - **Thumbnail** (Movie image).
  - **Title**.
  - **Summary**.
- Clicking on a movie navigates to the **Details Screen**.

### 3. Search Screen
- Provides a search bar to look up movies.
- Queries the API using the endpoint: `https://api.tvmaze.com/search/shows?q=${search_term}`.
- Displays search results similarly to the Home Screen.

### 4. Details Screen
- Displays comprehensive details of the selected movie:
  - **Thumbnail** (Movie image).
  - **Title**.
  - **Summary**.
  - Additional movie details if available.

### 5. Bottom Navigation
- Allows easy navigation between the **Home Screen** , **Search Screen** , **Downloads Screen** , **Account Screen**.

---

## Installation and Setup

1. **Clone the Repository**
   ```bash
   git clone <repository_url>
   cd <repository_folder>
2. **Install Dependencies Make sure you have Flutter installed. Then run:**
   ```bash
   flutter pub get
3. **Run the Application Use the following command to start the app:**
   ```bash
   flutter run
## API Usage
This app utilizes the TVMaze API to fetch movie data:

All Movies: https://api.tvmaze.com/search/shows?q=all
Search Movies: https://api.tvmaze.com/search/shows?q=${search_term}

## Screenshots
To be uploaded soon! 

## Technologies Used:
Flutter: For building the app.
Dart: The programming language.
TVMaze API: For fetching movie data.


## License:
This project is licensed under the MIT License - see the LICENSE file for details.
