import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieWatchPage extends StatefulWidget {
  final String movieId;
  
  const MovieWatchPage({super.key, required this.movieId});

  @override
  State<MovieWatchPage> createState() => _MovieWatchPageState();
}

class _MovieWatchPageState extends State<MovieWatchPage> {
  String _selectedQuality = '1080p';
  bool _isSaved = false;
  Map<String, dynamic>? _movie;

  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  void _loadMovie() {
    // Mock movie data - in real app this would come from API
    _movie = {
      'id': widget.movieId,
      'title': 'The Dark Knight',
      'originalTitle': 'The Dark Knight',
      'year': 2008,
      'rating': 4.9,
      'duration': '2h 32m',
      'genre': 'Action',
      'genres': ['Action', 'Crime', 'Drama', 'Thriller'],
      'director': 'Christopher Nolan',
      'cast': ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart', 'Maggie Gyllenhaal', 'Gary Oldman'],
      'poster': 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=800&h=1200&fit=crop',
      'backdrop': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=1920&h=1080&fit=crop',
      'description': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      'longDescription': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. As Batman and Lieutenant Jim Gordon continue to work together to clean up the streets of Gotham, a new criminal mastermind known as the Joker emerges from the shadows, creating chaos and testing the limits of Batman\'s moral code.',
      'trailer': 'https://www.youtube.com/embed/EXeTwQWrcwY',
      'userRating': 4.8,
      'votes': 2500000,
      'awards': ['Academy Award for Best Supporting Actor', 'Academy Award for Best Sound Editing'],
      'budget': '\$185 million',
      'boxOffice': '\$1.005 billion',
      'country': 'United States',
      'language': 'English',
      'releaseDate': 'July 18, 2008',
      'production': 'Warner Bros. Pictures',
      'isNew': false,
      'isTrending': true,
      'isPopular': true,
      'ageRating': 'PG-13',
      'contentWarnings': ['Violence', 'Intense Action', 'Some Disturbing Images'],
      'availableQualities': ['480p', '720p', '1080p', '4K'],
      'downloadSizes': {
        '480p': '800MB',
        '720p': '1.5GB',
        '1080p': '3.2GB',
        '4K': '8.5GB'
      },
      'subtitles': ['English', 'Spanish', 'French', 'German', 'Italian'],
      'audioTracks': ['English (Dolby Digital 5.1)', 'Spanish (Dolby Digital 5.1)', 'French (Dolby Digital 5.1)'],
      'relatedMovies': [
        {
          'id': '2',
          'title': 'Inception',
          'poster': 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
          'rating': 4.8
        },
        {
          'id': '3',
          'title': 'The Matrix',
          'poster': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
          'rating': 4.7
        },
        {
          'id': '4',
          'title': 'The Shawshank Redemption',
          'poster': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
          'rating': 4.9
        }
      ]
    };
    setState(() {});
  }

  void _handlePlay() {
    print('Playing movie: ${_movie?['title']}');
    // Navigate to player or open video player
  }

  void _handleDownload() {
    print('Downloading movie: ${_movie?['title']}, Quality: $_selectedQuality');
    // Handle download logic
  }

  void _handleShare() {
    print('Sharing movie: ${_movie?['title']}');
    // Handle share logic
  }

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
    print('Toggle save for movie: ${_movie?['title']}');
  }

  @override
  Widget build(BuildContext context) {
    if (_movie == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          // Hero Section with Movie Poster
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Movie Poster Image (Full Screen)
                  Image.network(
                    _movie!['poster'],
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.5),
                          Colors.black.withValues(alpha: 0.8),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => context.go('/'),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  // Movie Content Overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            _movie!['title'],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Basic Info
                          Row(
                            children: [
                              Text(
                                '${_movie!['year']}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              const Text(' • ', style: TextStyle(color: Colors.white70)),
                              Text(
                                _movie!['duration'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              const Text(' • ', style: TextStyle(color: Colors.white70)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${_movie!['rating']}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // Genres
                          Wrap(
                            spacing: 8,
                            children: (_movie!['genres'] as List<String>).map((genre) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  genre,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Movie Details Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Description
                  Text(
                    _movie!['description'],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _handlePlay,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF667EEA), Color(0xFF5B21B6)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_arrow, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Watch Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _handleDownload,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _handleShare,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _toggleSave,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: _isSaved ? Colors.blue : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Cast and Crew
                  _buildSection(
                    'Cast & Crew',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Director: ${_movie!['director']}',
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cast: ${(_movie!['cast'] as List<String>).take(5).join(', ')}',
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  
                  // Additional Info
                  _buildSection(
                    'Additional Information',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Release Date', _movie!['releaseDate']),
                        _buildInfoRow('Country', _movie!['country']),
                        _buildInfoRow('Language', _movie!['language']),
                        _buildInfoRow('Production', _movie!['production']),
                        _buildInfoRow('Budget', _movie!['budget']),
                        _buildInfoRow('Box Office', _movie!['boxOffice']),
                      ],
                    ),
                  ),
                  
                  // Related Movies
                  _buildSection(
                    'Related Movies',
                    SizedBox(
                      height: 240,
                      child: Row(
                        children: [
                          for (int i = 0; i < (_movie!['relatedMovies'] as List).length && i < 2; i++)
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: i == 0 ? 8.0 : 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        (_movie!['relatedMovies'] as List)[i]['poster'],
                                        width: double.infinity,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      (_movie!['relatedMovies'] as List)[i]['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 12,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${(_movie!['relatedMovies'] as List)[i]['rating']}',
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          content,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
