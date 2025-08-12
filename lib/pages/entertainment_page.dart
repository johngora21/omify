import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:go_router/go_router.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({super.key});

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  String _activeTab = 'popular';
  String _searchQuery = '';
  bool _showFilterModal = false;
  
  // Filter state
  Map<String, dynamic> _filters = {
    'genre': 'all',
    'minRating': null,
    'yearRange': null,
    'league': 'all',
    'status': 'all',
    'quality': 'all',
    'sport': 'all',
  };
  
  // Sample movie data
  final List<Map<String, dynamic>> _movies = [
    {
      'id': '1',
      'title': 'Inception',
      'year': 2010,
      'duration': '2h 28m',
      'genre': 'Sci-Fi',
      'rating': 8.8,
      'description': 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '2',
      'title': 'The Dark Knight',
      'year': 2008,
      'duration': '2h 32m',
      'genre': 'Action',
      'rating': 9.0,
      'description': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '3',
      'title': 'Interstellar',
      'year': 2014,
      'duration': '2h 49m',
      'genre': 'Adventure',
      'rating': 8.6,
      'description': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '4',
      'title': 'The Matrix',
      'year': 1999,
      'duration': '2h 16m',
      'genre': 'Sci-Fi',
      'rating': 8.7,
      'description': 'A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '5',
      'title': 'Pulp Fiction',
      'year': 1994,
      'duration': '2h 34m',
      'genre': 'Crime',
      'rating': 8.9,
      'description': 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '6',
      'title': 'Fight Club',
      'year': 1999,
      'duration': '2h 19m',
      'genre': 'Drama',
      'rating': 8.8,
      'description': 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '7',
      'title': 'The Shawshank Redemption',
      'year': 1994,
      'duration': '2h 22m',
      'genre': 'Drama',
      'rating': 9.3,
      'description': 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '8',
      'title': 'Forrest Gump',
      'year': 1994,
      'duration': '2h 22m',
      'genre': 'Drama',
      'rating': 8.8,
      'description': 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '9',
      'title': 'The Lion King',
      'year': 1994,
      'duration': '1h 28m',
      'genre': 'Animation',
      'rating': 8.5,
      'description': 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '10',
      'title': 'Spirited Away',
      'year': 2001,
      'duration': '2h 5m',
      'genre': 'Animation',
      'rating': 8.6,
      'description': 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '11',
      'title': 'The Princess Bride',
      'year': 1987,
      'duration': '1h 38m',
      'genre': 'Fantasy',
      'rating': 8.0,
      'description': 'While home sick in bed, a young boy\'s grandfather reads him the story of a farmboy-turned-pirate who encounters numerous obstacles.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '12',
      'title': 'The Lord of the Rings',
      'year': 2001,
      'duration': '2h 58m',
      'genre': 'Fantasy',
      'rating': 8.8,
      'description': 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '13',
      'title': 'The Silence of the Lambs',
      'year': 1991,
      'duration': '1h 58m',
      'genre': 'Thriller',
      'rating': 8.6,
      'description': 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '14',
      'title': 'Se7en',
      'year': 1995,
      'duration': '2h 7m',
      'genre': 'Thriller',
      'rating': 8.6,
      'description': 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '15',
      'title': 'The Grand Budapest Hotel',
      'year': 2014,
      'duration': '1h 39m',
      'genre': 'Comedy',
      'rating': 8.1,
      'description': 'A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '16',
      'title': 'Superbad',
      'year': 2007,
      'duration': '1h 53m',
      'genre': 'Comedy',
      'rating': 7.6,
      'description': 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '17',
      'title': 'The Notebook',
      'year': 2004,
      'duration': '2h 3m',
      'genre': 'Romance',
      'rating': 7.8,
      'description': 'A poor yet passionate young man falls in love with a rich young woman, giving her a sense of freedom.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '18',
      'title': 'La La Land',
      'year': 2016,
      'duration': '2h 8m',
      'genre': 'Romance',
      'rating': 8.0,
      'description': 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '19',
      'title': 'The Exorcist',
      'year': 1973,
      'duration': '2h 2m',
      'genre': 'Horror',
      'rating': 8.0,
      'description': 'When a 12-year-old girl is possessed by a mysterious entity, her mother seeks the help of two priests to save her.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '20',
      'title': 'A Quiet Place',
      'year': 2018,
      'duration': '1h 30m',
      'genre': 'Horror',
      'rating': 7.5,
      'description': 'In a post-apocalyptic world, a family is forced to live in silence while hiding from monsters with ultra-sensitive hearing.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '21',
      'title': 'The Godfather',
      'year': 1972,
      'duration': '2h 55m',
      'genre': 'Crime',
      'rating': 9.2,
      'description': 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      'isTrending': true,
      'isBookmarked': false,
    },
    {
      'id': '22',
      'title': 'Goodfellas',
      'year': 1990,
      'duration': '2h 26m',
      'genre': 'Crime',
      'rating': 8.7,
      'description': 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '23',
      'title': 'Indiana Jones: Raiders',
      'year': 1981,
      'duration': '1h 55m',
      'genre': 'Adventure',
      'rating': 8.4,
      'description': 'In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant.',
      'isTrending': false,
      'isBookmarked': false,
    },
    {
      'id': '24',
      'title': 'Jurassic Park',
      'year': 1993,
      'duration': '2h 7m',
      'genre': 'Adventure',
      'rating': 8.5,
      'description': 'A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids.',
      'isTrending': true,
      'isBookmarked': false,
    },
  ];

  // Sports data for sports tab
  final List<Map<String, dynamic>> _sports = [
    // Football/Soccer
    {
      'id': 's1',
      'teamA': 'Manchester United',
      'teamB': 'Liverpool',
      'score': '2 - 1',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=MU+vs+LIV',
      'quality': ['HD', '4K'],
      'time': '75\'',
      'league': 'Premier League',
      'sport': 'Football',
    },
    {
      'id': 's2',
      'teamA': 'Barcelona',
      'teamB': 'Real Madrid',
      'score': '0 - 0',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=BAR+vs+RMA',
      'quality': ['HD', '4K'],
      'time': '23\'',
      'league': 'La Liga',
      'sport': 'Football',
    },
    {
      'id': 's3',
      'teamA': 'Bayern Munich',
      'teamB': 'Borussia Dortmund',
      'score': '3 - 2',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=BAY+vs+BVB',
      'quality': ['HD', '4K'],
      'time': 'FT',
      'league': 'Bundesliga',
      'sport': 'Football',
    },
    
    // Basketball
    {
      'id': 's4',
      'teamA': 'Lakers',
      'teamB': 'Warriors',
      'score': '108 - 105',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=LAL+vs+GSW',
      'quality': ['HD', '4K'],
      'time': 'Q4 2:30',
      'league': 'NBA',
      'sport': 'Basketball',
    },
    {
      'id': 's5',
      'teamA': 'Celtics',
      'teamB': 'Heat',
      'score': '95 - 98',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=BOS+vs+MIA',
      'quality': ['HD'],
      'time': 'FT',
      'league': 'NBA',
      'sport': 'Basketball',
    },
    
    // Cricket
    {
      'id': 's6',
      'teamA': 'India',
      'teamB': 'Australia',
      'score': '285/6',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=IND+vs+AUS',
      'quality': ['HD', '4K'],
      'time': '45.2 overs',
      'league': 'T20 World Cup',
      'sport': 'Cricket',
    },
    {
      'id': 's7',
      'teamA': 'England',
      'teamB': 'Pakistan',
      'score': '320/8',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=ENG+vs+PAK',
      'quality': ['HD'],
      'time': 'FT',
      'league': 'Test Series',
      'sport': 'Cricket',
    },
    
    // Tennis
    {
      'id': 's8',
      'teamA': 'Djokovic',
      'teamB': 'Nadal',
      'score': '6-4, 7-6',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=DJO+vs+NAD',
      'quality': ['HD', '4K'],
      'time': 'Set 3',
      'league': 'Wimbledon',
      'sport': 'Tennis',
    },
    {
      'id': 's9',
      'teamA': 'Williams',
      'teamB': 'Osaka',
      'score': '6-3, 6-4',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=WIL+vs+OSA',
      'quality': ['HD'],
      'time': 'FT',
      'league': 'US Open',
      'sport': 'Tennis',
    },
    
    // American Football
    {
      'id': 's10',
      'teamA': 'Chiefs',
      'teamB': 'Bills',
      'score': '24 - 21',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=KC+vs+BUF',
      'quality': ['HD', '4K'],
      'time': 'Q4 1:45',
      'league': 'NFL',
      'sport': 'American Football',
    },
    
    // Baseball
    {
      'id': 's11',
      'teamA': 'Yankees',
      'teamB': 'Red Sox',
      'score': '5 - 3',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=NYY+vs+BOS',
      'quality': ['HD'],
      'time': 'FT',
      'league': 'MLB',
      'sport': 'Baseball',
    },
    
    // Rugby
    {
      'id': 's12',
      'teamA': 'England',
      'teamB': 'France',
      'score': '18 - 15',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=ENG+vs+FRA',
      'quality': ['HD', '4K'],
      'time': '75\'',
      'league': 'Six Nations',
      'sport': 'Rugby',
    },
    
    // Formula 1
    {
      'id': 's13',
      'teamA': 'Hamilton',
      'teamB': 'Verstappen',
      'score': 'P1 - P2',
      'isLive': false,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=HAM+vs+VER',
      'quality': ['HD', '4K'],
      'time': 'FT',
      'league': 'F1 Grand Prix',
      'sport': 'Formula 1',
    },
    
    // Golf
    {
      'id': 's14',
      'teamA': 'Tiger Woods',
      'teamB': 'Rory McIlroy',
      'score': '-12 - -10',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=WOODS+vs+MCIL',
      'quality': ['HD'],
      'time': 'Hole 16',
      'league': 'PGA Tour',
      'sport': 'Golf',
    },
    
    // Boxing/MMA
    {
      'id': 's15',
      'teamA': 'Fury',
      'teamB': 'Usyk',
      'score': 'Round 8',
      'isLive': true,
      'poster': 'https://via.placeholder.com/300x200/1a1a1a/ffffff?text=FURY+vs+USYK',
      'quality': ['HD', '4K'],
      'time': 'R8',
      'league': 'Heavyweight Title',
      'sport': 'Boxing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF000000),
          body: SafeArea(
            child: Column(
              children: [
                // Netflix-style Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: const Row(
                      children: [
                      Spacer(),
                    ],
                  ),
                ),

                // Search Bar and Filter
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    children: [
                      // Search Bar
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF333333)),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF1A1A1A),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF9CA3AF),
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) => setState(() => _searchQuery = value),
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: _getSearchHint(),
                                    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                            ],
              ),
            ),
          ),
                      
                      // Filter Button
                        const SizedBox(width: 12),
                          Container(
                        padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                            color: const Color(0xFF667EEA),
                            borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: () => setState(() => _showFilterModal = true),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Netflix-style Tab Navigation
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildNetflixTab('popular', 'Popular'),
                        _buildNetflixTab('top-rated', 'Top Rated'),
                        _buildNetflixTab('now-playing', 'Now Playing'),
                        _buildNetflixTab('upcoming', 'Upcoming'),
                        _buildNetflixTab('sports', 'Sports'),
                      ],
                    ),
                  ),
                ),

                // Netflix-style Content Rows
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    children: [
                      // Featured Section
                      _buildNetflixRow('', _getFilteredContent().take(6).toList(), isFeatured: true),
                      const SizedBox(height: 30),
                      
                      // Popular Section
                      _buildNetflixRow('Popular Now', _getFilteredContent().take(6).toList()),
                      const SizedBox(height: 30),
                      
                      // Top Rated Section
                      _buildNetflixRow('Top Rated', _getFilteredContent().take(6).toList()),
                      const SizedBox(height: 30),
                      
                      // Sports Section
                      _buildNetflixRow('Live Sports', _getFilteredContent().where((item) => 
                        item.containsKey('teamA') && item.containsKey('teamB')).take(6).toList()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showFilterModal) _buildFilterModal(),
      ],
    );
  }

  Widget _buildNetflixTab(String id, String label) {
    final isActive = _activeTab == id;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = id),
                  child: Container(
        margin: const EdgeInsets.only(right: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF999999),
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildNetflixRow(String title, List<Map<String, dynamic>> items, {bool isFeatured = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Horizontal Scrolling Content
        SizedBox(
          height: isFeatured ? 400 : 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
                      itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: isFeatured ? 280 : 140,
                margin: const EdgeInsets.only(right: 12),
                child: _buildNetflixCard(item, isFeatured: isFeatured),
              );
                      },
              ),
            ),
      ],
    );
  }

  Widget _buildNetflixCard(Map<String, dynamic> item, {bool isFeatured = false}) {
    // Check if this is sports content
    if (item.containsKey('teamA') && item.containsKey('teamB')) {
      return _buildNetflixSportsCard(item, isFeatured: isFeatured);
    }
    
    // Regular movie content
    return _buildNetflixMovieCard(item, isFeatured: isFeatured);
  }

  Widget _buildNetflixMovieCard(Map<String, dynamic> movie, {bool isFeatured = false}) {
    return GestureDetector(
      onTap: () => _handleMovieClick(movie['id']),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Movie Image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
              ),
              child: Stack(
                children: [
                  // Placeholder for movie image
                  const Center(
                    child: Icon(
                      Icons.movie,
                      size: 40,
                      color: Color(0xFF666666),
                    ),
                  ),
                  
                  // Rating badge
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFBBF24),
                            size: 10,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            movie['rating'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Trending badge
                  if (movie['isTrending'])
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF667EEA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'TRENDING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            // Gradient overlay for text
            if (isFeatured)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                        Colors.black,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${movie['year']} • ${movie['duration']}',
                        style: const TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }

  void _handleMovieClick(String movieId) {
    // Navigate to movie details page
    context.go('/movie/$movieId');
  }

  Widget _buildNetflixSportsCard(Map<String, dynamic> match, {bool isFeatured = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
          ),
          child: Stack(
            children: [
              // Sport icon
              const Center(
                child: Icon(
                  Icons.sports_soccer,
                  size: 40,
                  color: Color(0xFF666666),
                ),
              ),
              
              // Live indicator
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE50914),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              // Teams info
              if (isFeatured)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                          Colors.black,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${match['teamA']} vs ${match['teamB']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          match['sport'] ?? 'Football',
                          style: const TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 12,
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
    );
  }

  Widget _buildTab(String id, String label) {
    final isActive = _activeTab == id;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = id),
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF333333),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFCCCCCC),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard(Map<String, dynamic> content) {
    // Check if this is sports content
    if (content.containsKey('teamA') && content.containsKey('teamB')) {
      return _buildSportsCard(content);
    }
    
    // Regular movie content
    return _buildMovieCard(content);
  }

  Widget _buildSportsCard(Map<String, dynamic> match) {
    // Get appropriate icon for each sport
    IconData getSportIcon(String sport) {
      switch (sport) {
        case 'Football':
          return Icons.sports_soccer;
        case 'Basketball':
          return Icons.sports_basketball;
        case 'Cricket':
          return Icons.sports_cricket;
        case 'Tennis':
          return Icons.sports_tennis;
        case 'American Football':
          return Icons.sports_football;
        case 'Baseball':
          return Icons.sports_baseball;
        case 'Rugby':
          return Icons.sports_rugby;
        case 'Formula 1':
          return Icons.sports_motorsports;
        case 'Golf':
          return Icons.sports_golf;
        case 'Boxing':
          return Icons.sports_martial_arts;
        default:
          return Icons.sports_soccer;
      }
    }

    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Match Image
            Expanded(
            flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                  // Placeholder for match image
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          getSportIcon(match['sport'] ?? 'Football'),
                          size: 32,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${match['teamA']} vs ${match['teamB']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  
                  // Sport type badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        match['sport'] ?? 'Football',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  // Live indicator
                  if (match['isLive'])
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.radio,
                              color: Colors.white,
                              size: 10,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'LIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                  // Quality options
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Row(
                      children: (match['quality'] as List).map((quality) => Container(
                        margin: const EdgeInsets.only(right: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          quality,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Content info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // League name
                  Text(
                    match['league'] ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B82F6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Teams
                  Text(
                    '${match['teamA']} vs ${match['teamB']}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Score and time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        match['score'] ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: match['isLive'] ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        match['time'] ?? '',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: match['isLive'] ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 6),
                  
                  // Watch button
                  GestureDetector(
                    onTap: () {
                      // Handle watch functionality
                      print('Watch button tapped for ${match['teamA']} vs ${match['teamB']}');
                      // You can add navigation or other functionality here
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF667EEA), Color(0xFF5B21B6)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Watch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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

  Widget _buildMovieCard(Map<String, dynamic> movie) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.movie,
                      size: 40,
                      color: Color(0xFF666666),
                    ),
                  ),
                  
                  // Rating badge
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFBBF24),
                            size: 10,
                            ),
                          const SizedBox(width: 2),
                            Text(
                            movie['rating'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                  // Trending badge
                  if (movie['isTrending'])
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF667EEA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          movie['isTrending'] ? 'Popular' : 'New',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Content info
            Expanded(
              flex: 2,
              child: Padding(
              padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    movie['title'],
                      style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                    '${movie['year']} • ${movie['duration']} • ${movie['genre']}',
                      style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFCCCCCC),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      movie['description'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFFCCCCCC),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                    Row(
                      children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF667EEA), Color(0xFF5B21B6)],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'Watch',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          // Handle bookmark functionality
                          setState(() {
                            // Toggle bookmark state
                            if (movie['isBookmarked'] == true) {
                              movie['isBookmarked'] = false;
                            } else {
                              movie['isBookmarked'] = true;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            movie['isBookmarked'] == true 
                                ? Icons.bookmark 
                                : Icons.bookmark_border,
                          size: 14,
                            color: movie['isBookmarked'] == true 
                                ? const Color(0xFF3B82F6) 
                                : const Color(0xFF6B7280),
                          ),
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
    );
  }

  // Filter helper methods
  List<String> _getGenres() {
    Set<String> genres = {};
    for (var movie in _movies) {
      genres.add(movie['genre']);
    }
    return ['all', ...genres.toList()];
  }

  // Get sports leagues for filtering
  List<String> _getSportsLeagues() {
    Set<String> leagues = {};
    for (var match in _sports) {
      if (match['league'] != null) {
        leagues.add(match['league']);
      }
    }
    return ['all', ...leagues.toList()];
  }

  // Get all sports types for filtering
  List<String> _getSportsTypes() {
    Set<String> sports = {};
    for (var match in _sports) {
      if (match['sport'] != null) {
        sports.add(match['sport']);
      }
    }
    return ['all', ...sports.toList()];
  }

  // Get filtered content based on active tab
  List<Map<String, dynamic>> _getFilteredContent() {
    List<Map<String, dynamic>> content = [];
    
    switch (_activeTab) {
      case 'popular':
        content = _movies.where((movie) => movie['isTrending'] == true).toList();
        break;
      case 'top-rated':
        content = _movies.where((movie) => movie['rating'] >= 8.5).toList();
        break;
      case 'now-playing':
        content = _movies.where((movie) => movie['year'] >= 2020).toList();
        break;
      case 'upcoming':
        content = _movies.where((movie) => movie['year'] >= 2023).toList();
        break;
      case 'sports':
        content = _sports;
        break;
      default:
        content = _movies;
    }
    
    // Apply filters if any are active
    if (_filters.isNotEmpty) {
      content = _applyFiltersToContent(content);
    }
    
    return content;
  }

  // Apply filters to content based on active tab
  List<Map<String, dynamic>> _applyFiltersToContent(List<Map<String, dynamic>> content) {
    if (_activeTab == 'sports') {
      var filteredContent = List<Map<String, dynamic>>.from(content);
      
      // Filter by league
      if (_filters['league'] != null && _filters['league'] != 'all') {
        filteredContent = filteredContent.where((match) {
          return match['league'] == _filters['league'];
        }).toList();
      }
      
      // Filter by sport
      if (_filters['sport'] != null && _filters['sport'] != 'all') {
        filteredContent = filteredContent.where((match) {
          return match['sport'] == _filters['sport'];
        }).toList();
      }
      
      // Filter by status
      if (_filters['status'] != null && _filters['status'] != 'all') {
        filteredContent = filteredContent.where((match) {
          if (_filters['status'] == 'live') {
            return match['isLive'] == true;
          } else if (_filters['status'] == 'finished') {
            return match['isLive'] == false;
          }
          return true;
        }).toList();
      }
      
      // Filter by quality
      if (_filters['quality'] != null && _filters['quality'] != 'all') {
        filteredContent = filteredContent.where((match) {
          if (match['quality'] != null) {
            return (match['quality'] as List).contains(_filters['quality']);
          }
          return false;
        }).toList();
      }
      
      return filteredContent;
    } else {
      // Movie-specific filters
      var filteredContent = List<Map<String, dynamic>>.from(content);
      
      // Filter by genre
      if (_filters['genre'] != null && _filters['genre'] != 'all') {
        filteredContent = filteredContent.where((movie) {
          return movie['genre'] == _filters['genre'];
        }).toList();
      }
      
      // Filter by year range
      if (_filters['yearRange'] != null && _filters['yearRange'].toString().isNotEmpty) {
        // This is a simplified year filter - you can enhance it
        // For now, it will show all movies if year range is set
      }
      
      // Filter by minimum rating
      if (_filters['minRating'] != null) {
        filteredContent = filteredContent.where((movie) {
          return movie['rating'] >= _filters['minRating'];
        }).toList();
      }
      
      return filteredContent;
    }
  }



  // Get search hint text based on active tab
  String _getSearchHint() {
    switch (_activeTab) {
      case 'popular':
        return 'Search popular movies...';
      case 'top-rated':
        return 'Search top rated movies...';
      case 'now-playing':
        return 'Search now playing movies...';
      case 'upcoming':
        return 'Search upcoming movies...';
      case 'sports':
        return 'Search sports matches...';
      default:
        return 'Search movies...';
    }
  }



  void _resetFilters() {
    setState(() {
      _filters = {
        'genre': 'all',
        'minRating': null,
        'yearRange': null,
        'league': 'all',
        'status': 'all',
        'quality': 'all',
        'sport': 'all',
      };
    });
  }

  void _applyFilters() {
    setState(() {
      _showFilterModal = false;
    });
  }

  Widget _buildFilterModal() {
    if (!_showFilterModal) return const SizedBox.shrink();
    
    return Container(
      color: Colors.black.withValues(alpha: 0.7),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF333333)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF333333)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _showFilterModal = false),
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Filter content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Show different filters based on active tab
                      if (_activeTab == 'sports') ...[
                        // Sports League Filter
                        _buildFilterSection(
                          'League',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _getSportsLeagues()
                                .map((league) => _buildFilterChip(
                                      league,
                                      _filters['league'] == league,
                                      () => setState(() => _filters['league'] = league),
                                    ))
                                .toList(),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Sport Filter
                        _buildFilterSection(
                          'Sport',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _getSportsTypes()
                                .where((sport) => sport != 'all')
                                .map((sport) => _buildFilterChip(
                                      sport,
                                      _filters['sport'] == sport,
                                      () => setState(() => _filters['sport'] = sport),
                                    ))
                                .toList(),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Match Status Filter
                        _buildFilterSection(
                          'Status',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildFilterChip(
                                'All',
                                _filters['status'] == 'all',
                                () => setState(() => _filters['status'] = 'all'),
                              ),
                              _buildFilterChip(
                                'Live',
                                _filters['status'] == 'live',
                                () => setState(() => _filters['status'] = 'live'),
                              ),
                              _buildFilterChip(
                                'Finished',
                                _filters['status'] == 'finished',
                                () => setState(() => _filters['status'] = 'finished'),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Quality Filter
                        _buildFilterSection(
                          'Quality',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildFilterChip(
                                'All',
                                _filters['quality'] == 'all',
                                () => setState(() => _filters['quality'] = 'all'),
                              ),
                              _buildFilterChip(
                                'HD',
                                _filters['quality'] == 'HD',
                                () => setState(() => _filters['quality'] = 'HD'),
                              ),
                              _buildFilterChip(
                                '4K',
                                _filters['quality'] == '4K',
                                () => setState(() => _filters['quality'] = '4K'),
                              ),
                              _buildFilterChip(
                                '1080p',
                                _filters['quality'] == '1080p',
                                () => setState(() => _filters['quality'] = '1080p'),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        // Movie filters
                        // Genres
                        _buildFilterSection(
                          'Genres',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _getGenres()
                                .where((genre) => genre != 'all')
                                .map((genre) => _buildFilterChip(
                                      genre,
                                      _filters['genre'] == genre,
                                      () => setState(() => _filters['genre'] = genre),
                                    ))
                                .toList(),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Year Range
                        _buildFilterSection(
                          'Year Range',
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'From',
                                    labelStyle: const TextStyle(color: Color(0xFFCCCCCC)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF555555)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF555555)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF667EEA)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      _filters['yearRange'] = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'To',
                                    labelStyle: const TextStyle(color: Color(0xFFCCCCCC)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF555555)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF555555)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(color: Color(0xFF667EEA)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      _filters['yearRange'] = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Rating
                        _buildFilterSection(
                          'Minimum Rating',
                          Row(
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () => setState(() => _filters['minRating'] = index + 1),
                                child: Icon(
                                  Icons.star,
                                  size: 30,
                                  color: _filters['minRating'] != null && _filters['minRating'] > index 
                                      ? const Color(0xFFFBBF24) 
                                      : const Color(0xFFE5E7EB),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              
              // Action buttons
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFF333333)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _resetFilters,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: const Color(0xFFCCCCCC),
                          side: const BorderSide(color: Color(0xFF555555)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _applyFilters,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF667EEA),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Filters',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF667EEA) : const Color(0xFF333333),
          border: Border.all(
            color: isSelected ? const Color(0xFF667EEA) : const Color(0xFF555555),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFCCCCCC),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
