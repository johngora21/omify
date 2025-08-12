import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:go_router/go_router.dart'; // Added for context.go

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String _activeTab = 'video';
  bool _isRecording = false;
  // State for effects panel and filtering
  bool _showEffectsPanel = false;
  String? _selectedEffect;
  String _selectedCategory = 'all'; // Track selected category
  ScrollController _scrollController = ScrollController();
  bool _isScrollingUp = false;

  final List<Map<String, dynamic>> _tabs = [
    {'id': 'video', 'label': 'Video', 'icon': Icons.videocam},
    {'id': 'photo', 'label': 'Photo', 'icon': Icons.camera_alt},
    {'id': 'live', 'label': 'Live', 'icon': Icons.radio},
    {'id': 'effects', 'label': 'Effects', 'icon': Icons.auto_awesome},
  ];

  // Comprehensive effects library
  final List<Map<String, dynamic>> _effects = [
    // Face Filters
    {'id': 'dog_ears', 'name': 'Dog Ears', 'category': 'face', 'icon': Icons.pets, 'color': Colors.orange},
    {'id': 'cat_ears', 'name': 'Cat Ears', 'category': 'face', 'icon': Icons.pets, 'color': Colors.pink},
    {'id': 'bunny_ears', 'name': 'Bunny Ears', 'category': 'face', 'icon': Icons.pets, 'color': Colors.pink},
    {'id': 'crown', 'name': 'Crown', 'category': 'face', 'icon': Icons.auto_awesome, 'color': Colors.yellow},
    {'id': 'glasses', 'name': 'Cool Glasses', 'category': 'face', 'icon': Icons.visibility, 'color': Colors.blue},
    {'id': 'sunglasses', 'name': 'Sunglasses', 'category': 'face', 'icon': Icons.visibility, 'color': Colors.black},
    {'id': 'mustache', 'name': 'Mustache', 'category': 'face', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'beard', 'name': 'Beard', 'category': 'face', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'lipstick', 'name': 'Lipstick', 'category': 'face', 'icon': Icons.face, 'color': Colors.red},
    {'id': 'blush', 'name': 'Blush', 'category': 'face', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'freckles', 'name': 'Freckles', 'category': 'face', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'mole', 'name': 'Beauty Mole', 'category': 'face', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'dimples', 'name': 'Dimples', 'category': 'face', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'cheekbones', 'name': 'Cheekbones', 'category': 'face', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'jawline', 'name': 'Jawline', 'category': 'face', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'nose', 'name': 'Nose Shape', 'category': 'face', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'eyes', 'name': 'Eye Shape', 'category': 'face', 'icon': Icons.visibility, 'color': Colors.blue},
    {'id': 'eyebrows', 'name': 'Eyebrows', 'category': 'face', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'eyelashes', 'name': 'Eyelashes', 'category': 'face', 'icon': Icons.visibility, 'color': Colors.black},
    {'id': 'teeth', 'name': 'Teeth', 'category': 'face', 'icon': Icons.face, 'color': Colors.white},
    
    // AR Effects
    {'id': 'rainbow', 'name': 'Rainbow', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'sparkles', 'name': 'Sparkles', 'category': 'ar', 'icon': Icons.star, 'color': Colors.yellow},
    {'id': 'fire', 'name': 'Fire', 'category': 'ar', 'icon': Icons.local_fire_department, 'color': Colors.red},
    {'id': 'snow', 'name': 'Snow', 'category': 'ar', 'icon': Icons.ac_unit, 'color': Colors.blue},
    {'id': 'bubbles', 'name': 'Bubbles', 'category': 'ar', 'icon': Icons.bubble_chart, 'color': Colors.cyan},
    {'id': 'hearts', 'name': 'Hearts', 'category': 'ar', 'icon': Icons.favorite, 'color': Colors.pink},
    {'id': 'stars', 'name': 'Stars', 'category': 'ar', 'icon': Icons.star, 'color': Colors.yellow},
    {'id': 'flowers', 'name': 'Flowers', 'category': 'ar', 'icon': Icons.local_florist, 'color': Colors.pink},
    {'id': 'butterflies', 'name': 'Butterflies', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'confetti', 'name': 'Confetti', 'category': 'ar', 'icon': Icons.celebration, 'color': Colors.orange},
    {'id': 'balloons', 'name': 'Balloons', 'category': 'ar', 'icon': Icons.celebration, 'color': Colors.red},
    {'id': 'crown_ar', 'name': 'Crown AR', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.yellow},
    {'id': 'wings', 'name': 'Angel Wings', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.white},
    {'id': 'halo', 'name': 'Halo', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.yellow},
    {'id': 'lightning', 'name': 'Lightning', 'category': 'ar', 'icon': Icons.flash_on, 'color': Colors.yellow},
    {'id': 'smoke', 'name': 'Smoke', 'category': 'ar', 'icon': Icons.cloud, 'color': Colors.grey},
    {'id': 'fog', 'name': 'Fog', 'category': 'ar', 'icon': Icons.cloud, 'color': Colors.grey},
    {'id': 'rain', 'name': 'Rain', 'category': 'ar', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'id': 'wind', 'name': 'Wind', 'category': 'ar', 'icon': Icons.air, 'color': Colors.blue},
    {'id': 'sunset', 'name': 'Sunset', 'category': 'ar', 'icon': Icons.wb_sunny, 'color': Colors.orange},
    {'id': 'aurora', 'name': 'Aurora', 'category': 'ar', 'icon': Icons.auto_awesome, 'color': Colors.green},
    
    // Background Effects
    {'id': 'blur', 'name': 'Blur', 'category': 'background', 'icon': Icons.blur_on, 'color': Colors.grey},
    {'id': 'vintage', 'name': 'Vintage', 'category': 'background', 'icon': Icons.filter_vintage, 'color': Colors.amber},
    {'id': 'neon', 'name': 'Neon', 'category': 'background', 'icon': Icons.lightbulb, 'color': Colors.purple},
    {'id': 'mirror', 'name': 'Mirror', 'category': 'background', 'icon': Icons.crop_square, 'color': Colors.grey.shade300},
    {'id': 'duotone', 'name': 'Duotone', 'category': 'background', 'icon': Icons.gradient, 'color': Colors.purple},
    {'id': 'split', 'name': 'Split Screen', 'category': 'background', 'icon': Icons.crop_square, 'color': Colors.blue},
    {'id': 'grid', 'name': 'Grid', 'category': 'background', 'icon': Icons.grid_on, 'color': Colors.grey},
    {'id': 'dots', 'name': 'Polka Dots', 'category': 'background', 'icon': Icons.grain, 'color': Colors.pink},
    {'id': 'stripes', 'name': 'Stripes', 'category': 'background', 'icon': Icons.view_column, 'color': Colors.blue},
    {'id': 'checker', 'name': 'Checker', 'category': 'background', 'icon': Icons.grid_4x4, 'color': Colors.black},
    {'id': 'zigzag', 'name': 'Zigzag', 'category': 'background', 'icon': Icons.trending_up, 'color': Colors.orange},
    {'id': 'spiral', 'name': 'Spiral', 'category': 'background', 'icon': Icons.rotate_right, 'color': Colors.purple},
    {'id': 'maze', 'name': 'Maze', 'category': 'background', 'icon': Icons.account_tree, 'color': Colors.green},
    {'id': 'labyrinth', 'name': 'Labyrinth', 'category': 'background', 'icon': Icons.account_tree, 'color': Colors.brown},
    {'id': 'galaxy', 'name': 'Galaxy', 'category': 'background', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'space', 'name': 'Space', 'category': 'background', 'icon': Icons.rocket, 'color': Colors.black},
    {'id': 'ocean', 'name': 'Ocean', 'category': 'background', 'icon': Icons.water, 'color': Colors.blue},
    {'id': 'forest', 'name': 'Forest', 'category': 'background', 'icon': Icons.forest, 'color': Colors.green},
    {'id': 'desert', 'name': 'Desert', 'category': 'background', 'icon': Icons.landscape, 'color': Colors.orange},
    {'id': 'mountain', 'name': 'Mountain', 'category': 'background', 'icon': Icons.landscape, 'color': Colors.brown},
    {'id': 'city', 'name': 'City', 'category': 'background', 'icon': Icons.location_city, 'color': Colors.grey},
    {'id': 'beach', 'name': 'Beach', 'category': 'background', 'icon': Icons.beach_access, 'color': Colors.blue},
    {'id': 'sunset_bg', 'name': 'Sunset BG', 'category': 'background', 'icon': Icons.wb_sunny, 'color': Colors.orange},
    {'id': 'night', 'name': 'Night', 'category': 'background', 'icon': Icons.nightlight, 'color': Colors.indigo},
    {'id': 'day', 'name': 'Day', 'category': 'background', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
    
    // Fun Effects
    {'id': 'slow_mo', 'name': 'Slow Motion', 'category': 'fun', 'icon': Icons.slow_motion_video, 'color': Colors.blue},
    {'id': 'fast_mo', 'name': 'Fast Motion', 'category': 'fun', 'icon': Icons.fast_forward, 'color': Colors.green},
    {'id': 'reverse', 'name': 'Reverse', 'category': 'fun', 'icon': Icons.replay, 'color': Colors.orange},
    {'id': 'duo', 'name': 'Duo', 'category': 'fun', 'icon': Icons.copy, 'color': Colors.purple},
    {'id': 'triple', 'name': 'Triple', 'category': 'fun', 'icon': Icons.copy, 'color': Colors.purple},
    {'id': 'quad', 'name': 'Quad', 'category': 'fun', 'icon': Icons.copy, 'color': Colors.purple},
    {'id': 'kaleidoscope', 'name': 'Kaleidoscope', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.pink},
    {'id': 'fisheye', 'name': 'Fisheye', 'category': 'fun', 'icon': Icons.crop_square, 'color': Colors.blue},
    {'id': 'tunnel', 'name': 'Tunnel', 'category': 'fun', 'icon': Icons.crop_square, 'color': Colors.purple},
    {'id': 'zoom', 'name': 'Zoom', 'category': 'fun', 'icon': Icons.zoom_in, 'color': Colors.blue},
    {'id': 'pan', 'name': 'Pan', 'category': 'fun', 'icon': Icons.pan_tool, 'color': Colors.green},
    {'id': 'tilt', 'name': 'Tilt', 'category': 'fun', 'icon': Icons.rotate_right, 'color': Colors.orange},
    {'id': 'shake', 'name': 'Shake', 'category': 'fun', 'icon': Icons.vibration, 'color': Colors.red},
    {'id': 'bounce', 'name': 'Bounce', 'category': 'fun', 'icon': Icons.trending_up, 'color': Colors.green},
    {'id': 'wave', 'name': 'Wave', 'category': 'fun', 'icon': Icons.waves, 'color': Colors.blue},
    {'id': 'pulse', 'name': 'Pulse', 'category': 'fun', 'icon': Icons.favorite, 'color': Colors.pink},
    {'id': 'glitch', 'name': 'Glitch', 'category': 'fun', 'icon': Icons.bug_report, 'color': Colors.green},
    {'id': 'vhs', 'name': 'VHS', 'category': 'fun', 'icon': Icons.video_library, 'color': Colors.purple},
    {'id': 'retro', 'name': 'Retro', 'category': 'fun', 'icon': Icons.history, 'color': Colors.amber},
    {'id': 'futuristic', 'name': 'Futuristic', 'category': 'fun', 'icon': Icons.rocket, 'color': Colors.cyan},
    {'id': 'cyberpunk', 'name': 'Cyberpunk', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'steampunk', 'name': 'Steampunk', 'category': 'fun', 'icon': Icons.engineering, 'color': Colors.brown},
    {'id': 'gothic', 'name': 'Gothic', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.black},
    {'id': 'cartoon', 'name': 'Cartoon', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.orange},
    {'id': 'anime', 'name': 'Anime', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.pink},
    {'id': 'comic', 'name': 'Comic', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.blue},
    {'id': 'sketch', 'name': 'Sketch', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.grey},
    {'id': 'painting', 'name': 'Painting', 'category': 'fun', 'icon': Icons.palette, 'color': Colors.orange},
    {'id': 'watercolor', 'name': 'Watercolor', 'category': 'fun', 'icon': Icons.palette, 'color': Colors.blue},
    {'id': 'oil_paint', 'name': 'Oil Paint', 'category': 'fun', 'icon': Icons.palette, 'color': Colors.amber},
    {'id': 'charcoal', 'name': 'Charcoal', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.black},
    {'id': 'pencil', 'name': 'Pencil', 'category': 'fun', 'icon': Icons.edit, 'color': Colors.grey},
    {'id': 'crayon', 'name': 'Crayon', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.orange},
    {'id': 'marker', 'name': 'Marker', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.green},
    {'id': 'chalk', 'name': 'Chalk', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.white},
    {'id': 'spray_paint', 'name': 'Spray Paint', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.red},
    {'id': 'graffiti', 'name': 'Graffiti', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.purple},
    {'id': 'street_art', 'name': 'Street Art', 'category': 'fun', 'icon': Icons.brush, 'color': Colors.orange},
    {'id': 'pop_art', 'name': 'Pop Art', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.pink},
    {'id': 'abstract', 'name': 'Abstract', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'cubism', 'name': 'Cubism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.blue},
    {'id': 'impressionism', 'name': 'Impressionism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.green},
    {'id': 'expressionism', 'name': 'Expressionism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.red},
    {'id': 'surrealism', 'name': 'Surrealism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'minimalism', 'name': 'Minimalism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.grey},
    {'id': 'maximalism', 'name': 'Maximalism', 'category': 'fun', 'icon': Icons.auto_awesome, 'color': Colors.orange},
    
    // Beauty Filters
    {'id': 'smooth', 'name': 'Smooth', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'brighten', 'name': 'Brighten', 'category': 'beauty', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
    {'id': 'contour', 'name': 'Contour', 'category': 'beauty', 'icon': Icons.brush, 'color': Colors.brown},
    {'id': 'highlight', 'name': 'Highlight', 'category': 'beauty', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
    {'id': 'bronzer', 'name': 'Bronzer', 'category': 'beauty', 'icon': Icons.brush, 'color': Colors.orange},
    {'id': 'foundation', 'name': 'Foundation', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown.shade200},
    {'id': 'concealer', 'name': 'Concealer', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown.shade200},
    {'id': 'powder', 'name': 'Powder', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown.shade200},
    {'id': 'blush', 'name': 'Blush', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'eyeshadow', 'name': 'Eyeshadow', 'category': 'beauty', 'icon': Icons.visibility, 'color': Colors.purple},
    {'id': 'eyeliner', 'name': 'Eyeliner', 'category': 'beauty', 'icon': Icons.visibility, 'color': Colors.black},
    {'id': 'mascara', 'name': 'Mascara', 'category': 'beauty', 'icon': Icons.visibility, 'color': Colors.black},
    {'id': 'false_lashes', 'name': 'False Lashes', 'category': 'beauty', 'icon': Icons.visibility, 'color': Colors.black},
    {'id': 'eyebrow_pencil', 'name': 'Eyebrow Pencil', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'eyebrow_gel', 'name': 'Eyebrow Gel', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'lip_liner', 'name': 'Lip Liner', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.red},
    {'id': 'lipstick', 'name': 'Lipstick', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.red},
    {'id': 'lip_gloss', 'name': 'Lip Gloss', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'lip_balm', 'name': 'Lip Balm', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'nail_polish', 'name': 'Nail Polish', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.red},
    {'id': 'perfume', 'name': 'Perfume', 'category': 'beauty', 'icon': Icons.auto_awesome, 'color': Colors.purple},
    {'id': 'hair_spray', 'name': 'Hair Spray', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'hair_gel', 'name': 'Hair Gel', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'hair_wax', 'name': 'Hair Wax', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'hair_oil', 'name': 'Hair Oil', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'hair_mask', 'name': 'Hair Mask', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'face_mask', 'name': 'Face Mask', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'serum', 'name': 'Serum', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'moisturizer', 'name': 'Moisturizer', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'sunscreen', 'name': 'Sunscreen', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.yellow},
    {'id': 'toner', 'name': 'Toner', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'cleanser', 'name': 'Cleanser', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'exfoliator', 'name': 'Exfoliator', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'retinol', 'name': 'Retinol', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.yellow},
    {'id': 'vitamin_c', 'name': 'Vitamin C', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'hyaluronic', 'name': 'Hyaluronic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'peptide', 'name': 'Peptide', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.purple},
    {'id': 'ceramide', 'name': 'Ceramide', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'niacinamide', 'name': 'Niacinamide', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'salicylic', 'name': 'Salicylic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'glycolic', 'name': 'Glycolic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'lactic', 'name': 'Lactic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'mandelic', 'name': 'Mandelic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'azelaic', 'name': 'Azelaic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'kojic', 'name': 'Kojic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.yellow},
    {'id': 'tranexamic', 'name': 'Tranexamic', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'arbutin', 'name': 'Arbutin', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'licorice', 'name': 'Licorice', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'aloe', 'name': 'Aloe', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'tea_tree', 'name': 'Tea Tree', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'witch_hazel', 'name': 'Witch Hazel', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'rose_water', 'name': 'Rose Water', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'cucumber', 'name': 'Cucumber', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'avocado', 'name': 'Avocado', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.green},
    {'id': 'honey', 'name': 'Honey', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'coconut', 'name': 'Coconut', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.white},
    {'id': 'jojoba', 'name': 'Jojoba', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'argan', 'name': 'Argan', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'rosehip', 'name': 'Rosehip', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'marula', 'name': 'Marula', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.amber},
    {'id': 'squalane', 'name': 'Squalane', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.blue},
    {'id': 'biotin', 'name': 'Biotin', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.orange},
    {'id': 'collagen', 'name': 'Collagen', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'elastin', 'name': 'Elastin', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.pink},
    {'id': 'keratin', 'name': 'Keratin', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.brown},
    {'id': 'silk', 'name': 'Silk', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.white},
    {'id': 'cashmere', 'name': 'Cashmere', 'category': 'beauty', 'icon': Icons.face, 'color': Colors.white},
  ];

  final List<String> _effectCategories = ['all', 'face', 'ar', 'background', 'fun', 'beauty'];

  // Get filtered effects based on selected category
  List<Map<String, dynamic>> get _filteredEffects {
    if (_selectedCategory == 'all') {
      return _effects;
    }
    return _effects.where((effect) => effect['category'] == _selectedCategory).toList();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels < _scrollController.position.minScrollExtent + 50) {
      // Scrolled up slightly - show effects panel
      if (!_showEffectsPanel) {
        setState(() {
          _showEffectsPanel = true;
        });
      }
    } else if (_scrollController.position.pixels > _scrollController.position.minScrollExtent + 100) {
      // Scrolled down more - hide effects panel
      if (_showEffectsPanel) {
        setState(() {
          _showEffectsPanel = false;
        });
      }
    }
  }

  void _handleStartRecording() {
    setState(() {
      _isRecording = true;
    });
    
    // Simulate recording
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isRecording = false;
        });
      }
    });
  }

  void _handleClose() {
    Navigator.of(context).pop();
  }

  // Toggle effects panel
  void _toggleEffectsPanel() {
    setState(() {
      _showEffectsPanel = !_showEffectsPanel;
    });
  }

  // Select an effect
  void _selectEffect(String effectId) {
    setState(() {
      _selectedEffect = effectId;
    });
  }

  // Select a category
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                backgroundBlendMode: BlendMode.overlay,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close button
                  GestureDetector(
                    onTap: () {
                      context.go('/'); // Navigate back to homepage
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  
                  // Title
                  const Text(
                    'Create Content',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  // Post button
                  GestureDetector(
                    onTap: () {
                      // Navigate to post details page
                      context.go('/post-details');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF667EEA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: Column(
                children: [
                  // Camera/Video Preview
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            // Camera preview placeholder (transparent)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.transparent,
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 80,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                            ),
                            
                            // Recording indicator
                            if (_isRecording)
                              Positioned(
                                top: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'REC',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            // Camera Controls
                            Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: _handleStartRecording,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _isRecording ? const Color(0xFFEF4444) : const Color(0xFF667EEA),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 4),
                                    ),
                                    child: Center(
                                      child: _isRecording
                                          ? Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            )
                                          : const Icon(
                                              Icons.videocam,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Controls
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    child: Column(
                      children: [
                        // Tabs
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _tabs.map((tab) {
                            final isActive = _activeTab == tab['id'];
                            
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeTab = tab['id'];
                                  if (tab['id'] == 'effects') {
                                    _toggleEffectsPanel();
                                  }
                                });
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    tab['icon'],
                                    size: 24,
                                    color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF9CA3AF),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    tab['label'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                                      color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Effects Panel (slides up from bottom)
            if (_showEffectsPanel)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.95),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Handle bar
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      
                      // Category tabs
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _effectCategories.map((category) {
                            final isActive = category == _selectedCategory;
                            
                            return GestureDetector(
                              onTap: () {
                                _selectCategory(category);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isActive ? const Color(0xFF3B82F6) : Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isActive ? const Color(0xFF3B82F6) : Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  category.toUpperCase(),
                                  style: TextStyle(
                                    color: isActive ? Colors.white : Colors.white.withOpacity(0.8),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      
                      // Effects grid
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: _filteredEffects.length,
                          itemBuilder: (context, index) {
                            final effect = _filteredEffects[index];
                            final isSelected = _selectedEffect == effect['id'];
                            
                            return GestureDetector(
                              onTap: () => _selectEffect(effect['id']),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? effect['color'] : Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected ? effect['color'] : Colors.white.withOpacity(0.2),
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      effect['icon'],
                                      color: isSelected ? Colors.white : effect['color'],
                                      size: 20,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      effect['name'],
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.8),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
