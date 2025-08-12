import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String _activeTab = 'saved';

  final List<Map<String, dynamic>> _savedMovies = [
    {
      'id': '1',
      'title': 'Inception',
      'poster': 'https://images.unsplash.com/photo-1489599839927-2df91e0c6d4b?w=300&h=450&fit=crop',
      'rating': 8.8,
      'year': 2010,
      'duration': '2h 28m',
      'genre': 'Sci-Fi',
      'director': 'Christopher Nolan',
      'cast': ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
      'description': 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      'isTrending': true
    },
    {
      'id': '2',
      'title': 'The Dark Knight',
      'poster': 'https://images.unsplash.com/photo-1531259683001-31fb755c6c07?w=300&h=450&fit=crop',
      'rating': 9.0,
      'year': 2008,
      'duration': '2h 32m',
      'genre': 'Action',
      'director': 'Christopher Nolan',
      'cast': ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      'description': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      'isTrending': true
    },
    {
      'id': '3',
      'title': 'Interstellar',
      'poster': 'https://images.unsplash.com/photo-1446776877081-d282a0f896e2?w=300&h=450&fit=crop',
      'rating': 8.6,
      'year': 2014,
      'duration': '2h 49m',
      'genre': 'Sci-Fi',
      'director': 'Christopher Nolan',
      'cast': ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      'description': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      'isTrending': false
    }
  ];

  final List<Map<String, dynamic>> _downloadedMovies = [
    {
      'id': '4',
      'title': 'Avatar',
      'poster': 'https://images.unsplash.com/photo-1506905925346-21bda4d6df45?w=300&h=450&fit=crop',
      'rating': 7.8,
      'year': 2009,
      'duration': '2h 42m',
      'genre': 'Sci-Fi',
      'director': 'James Cameron',
      'cast': ['Sam Worthington', 'Zoe Saldana', 'Sigourney Weaver'],
      'description': 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.',
      'downloadDate': '2024-01-15',
      'isTrending': false
    },
    {
      'id': '5',
      'title': 'The Matrix',
      'poster': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      'rating': 8.7,
      'year': 1999,
      'duration': '2h 16m',
      'genre': 'Sci-Fi',
      'director': 'Lana Wachowski',
      'cast': ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
      'description': 'A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free.',
      'downloadDate': '2024-01-10',
      'isTrending': true
    }
  ];

  void _handleMovieClick(String movieId) {
    context.go('/movie/$movieId');
  }

  void _handlePlay(String movieId) {
    print('Play movie: $movieId');
  }

  void _handleDownload(String movieId) {
    print('Download movie: $movieId');
    // Handle download logic here
  }

  void _toggleSave(String movieId) {
    print('Toggle save for movie: $movieId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTab('saved', 'Saved'),
                _buildTab('downloaded', 'Downloaded'),
              ],
            ),
          ),

          // Content
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _activeTab == 'saved' ? _savedMovies.length : _downloadedMovies.length,
              itemBuilder: (context, index) {
                final movies = _activeTab == 'saved' ? _savedMovies : _downloadedMovies;
                final movie = movies[index];
                return _buildMovieCard(movie);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String tab, String label) {
    final isActive = _activeTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeTab = tab;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF667EEA) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF6B7280),
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Map<String, dynamic> movie) {
    return GestureDetector(
      onTap: () => _handleMovieClick(movie['id']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster and Actions
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  movie['poster'],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Trending Badge
              if (movie['isTrending'] == true)
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'TRENDING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              // Action Buttons
              Positioned(
                top: 16,
                right: 16,
                child: Row(
                  children: [
                    // Download button for saved movies
                    if (_activeTab == 'saved')
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.download, color: Colors.white),
                          onPressed: () => _handleDownload(movie['id']),
                        ),
                      ),
                    if (_activeTab == 'saved') const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border, color: Colors.white),
                        onPressed: () => _toggleSave(movie['id']),
                      ),
                    ),
                  ],
                ),
              ),
              // Watch Button (centered on image)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _handlePlay(movie['id']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 28,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'WATCH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Movie Info
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Rating Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        movie['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFF59E0B),
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${movie['rating']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF92400E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Movie Details Row
                Row(
                  children: [
                    _buildDetailChip('${movie['year']}', Icons.calendar_today),
                    const SizedBox(width: 12),
                    _buildDetailChip(movie['duration'], Icons.access_time),
                    const SizedBox(width: 12),
                    _buildDetailChip(movie['genre'], Icons.movie),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Director and Cast Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color(0xFF6B7280),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Director',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              movie['director'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.group,
                            color: Color(0xFF6B7280),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Cast',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              (movie['cast'] as List<String>).take(3).join(', '),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Description
                Text(
                  'Synopsis',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie['description'],
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                if (_activeTab == 'downloaded' && movie['downloadDate'] != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Downloaded: ${movie['downloadDate']}',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ));
  
  }
}
