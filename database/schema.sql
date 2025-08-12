-- Omify Database Schema
-- Drop database if exists (for clean setup)
-- DROP DATABASE IF EXISTS omify_db;
-- CREATE DATABASE omify_db;
USE omify_db;

-- =====================================================
-- CORE USER TABLES
-- =====================================================

-- 1. users table
CREATE TABLE IF NOT EXISTS users (
  id VARCHAR(36) PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  profile_picture VARCHAR(255),
  bio TEXT,
  location VARCHAR(100),
  phone_number VARCHAR(20),
  date_of_birth DATE,
  gender VARCHAR(20),
  is_verified BOOLEAN DEFAULT FALSE,
  is_premium BOOLEAN DEFAULT FALSE,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. user_interests
CREATE TABLE IF NOT EXISTS user_interests (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  interest VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- PROFESSIONAL SERVICE TABLES
-- =====================================================

-- 3. service_providers
CREATE TABLE IF NOT EXISTS service_providers (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36) UNIQUE,
  service_type ENUM('Erotic', 'Accommodation', 'Adventure', 'Car Rental') NOT NULL,
  business_name VARCHAR(100),
  business_description TEXT,
  hourly_rate DECIMAL(10,2),
  is_available BOOLEAN DEFAULT TRUE,
  business_address TEXT,
  latitude DECIMAL(10,8),
  longitude DECIMAL(11,8),
  rating DECIMAL(3,2) DEFAULT 0.00,
  review_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. service_categories
CREATE TABLE IF NOT EXISTS service_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_provider_id VARCHAR(36),
  category VARCHAR(100),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 5. service_photos
CREATE TABLE IF NOT EXISTS service_photos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_provider_id VARCHAR(36),
  photo_url VARCHAR(255),
  photo_type ENUM('profile', 'gallery', 'verification'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 6. service_availability
CREATE TABLE IF NOT EXISTS service_availability (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_provider_id VARCHAR(36),
  day_of_week ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'),
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 7. service_languages
CREATE TABLE IF NOT EXISTS service_languages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_provider_id VARCHAR(36),
  language VARCHAR(50),
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 8. service_certifications
CREATE TABLE IF NOT EXISTS service_certifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_provider_id VARCHAR(36),
  certification_name VARCHAR(100),
  certification_url VARCHAR(255),
  issued_date DATE,
  expiry_date DATE,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- =====================================================
-- POSTS & CONTENT TABLES
-- =====================================================

-- 9. posts
CREATE TABLE IF NOT EXISTS posts (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  post_type ENUM('Normal Post', 'Service') NOT NULL,
  caption TEXT,
  location VARCHAR(100),
  hashtags JSON,
  media_urls JSON,
  is_published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 10. service_posts
CREATE TABLE IF NOT EXISTS service_posts (
  id VARCHAR(36) PRIMARY KEY,
  post_id VARCHAR(36),
  service_type ENUM('Erotic', 'Accommodation', 'Adventure', 'Car Rental'),
  service_category VARCHAR(100),
  currency VARCHAR(10),
  rate_type VARCHAR(50),
  rate_amount DECIMAL(10,2),
  highlights_features TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- 11. hashtags
CREATE TABLE IF NOT EXISTS hashtags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE,
  post_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 12. post_hashtags
CREATE TABLE IF NOT EXISTS post_hashtags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  post_id VARCHAR(36),
  hashtag_id INT,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (hashtag_id) REFERENCES hashtags(id) ON DELETE CASCADE
);

-- =====================================================
-- MESSAGING TABLES
-- =====================================================

-- 13. conversations
CREATE TABLE IF NOT EXISTS conversations (
  id VARCHAR(36) PRIMARY KEY,
  conversation_type ENUM('individual', 'group') DEFAULT 'individual',
  name VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 14. conversation_participants
CREATE TABLE IF NOT EXISTS conversation_participants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  conversation_id VARCHAR(36),
  user_id VARCHAR(36),
  role ENUM('admin', 'member') DEFAULT 'member',
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 15. messages
CREATE TABLE IF NOT EXISTS messages (
  id VARCHAR(36) PRIMARY KEY,
  conversation_id VARCHAR(36),
  sender_id VARCHAR(36),
  message_type ENUM('text', 'image', 'voice', 'sticker') DEFAULT 'text',
  content TEXT,
  media_url VARCHAR(255),
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- ENTERTAINMENT TABLES
-- =====================================================

-- 16. movies
CREATE TABLE IF NOT EXISTS movies (
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INT,
  duration VARCHAR(20),
  genre VARCHAR(100),
  rating DECIMAL(3,1),
  description TEXT,
  poster_url VARCHAR(255),
  trailer_url VARCHAR(255),
  is_trending BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 17. sports_events
CREATE TABLE IF NOT EXISTS sports_events (
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255),
  sport VARCHAR(100),
  league VARCHAR(100),
  home_team VARCHAR(100),
  away_team VARCHAR(100),
  start_time TIMESTAMP,
  status ENUM('scheduled', 'live', 'finished') DEFAULT 'scheduled',
  score_home INT DEFAULT 0,
  score_away INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- BOOKMARKS & INTERACTIONS
-- =====================================================

-- 18. bookmarks
CREATE TABLE IF NOT EXISTS bookmarks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  content_type ENUM('post', 'movie', 'service_provider', 'sport_event'),
  content_id VARCHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 19. likes
CREATE TABLE IF NOT EXISTS likes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  content_type ENUM('post', 'movie', 'service_provider'),
  content_id VARCHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- REVIEWS & RATINGS
-- =====================================================

-- 20. reviews
CREATE TABLE IF NOT EXISTS reviews (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  service_provider_id VARCHAR(36),
  rating INT CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- =====================================================
-- BOOKING & PAYMENTS
-- =====================================================

-- 21. bookings
CREATE TABLE IF NOT EXISTS bookings (
  id VARCHAR(36) PRIMARY KEY,
  client_id VARCHAR(36),
  service_provider_id VARCHAR(36),
  service_type VARCHAR(100),
  booking_date DATE,
  start_time TIME,
  end_time TIME,
  total_amount DECIMAL(10,2),
  status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (client_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 22. payments
CREATE TABLE IF NOT EXISTS payments (
  id VARCHAR(36) PRIMARY KEY,
  booking_id VARCHAR(36),
  amount DECIMAL(10,2),
  currency VARCHAR(10),
  payment_method VARCHAR(50),
  status ENUM('pending', 'completed', 'failed', 'refunded') DEFAULT 'pending',
  transaction_id VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE
);

-- =====================================================
-- NOTIFICATIONS
-- =====================================================

-- 23. notifications
CREATE TABLE IF NOT EXISTS notifications (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  type VARCHAR(100),
  title VARCHAR(255),
  message TEXT,
  is_read BOOLEAN DEFAULT FALSE,
  data JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- PREMIUM & SUBSCRIPTIONS
-- =====================================================

-- 24. subscriptions
CREATE TABLE IF NOT EXISTS subscriptions (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  plan_type ENUM('basic', 'premium', 'vip') NOT NULL,
  billing_cycle ENUM('monthly', 'yearly') NOT NULL,
  amount DECIMAL(10,2),
  status ENUM('active', 'cancelled', 'expired') DEFAULT 'active',
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 25. subscription_features
CREATE TABLE IF NOT EXISTS subscription_features (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_id VARCHAR(36),
  feature_name VARCHAR(100),
  feature_value TEXT,
  FOREIGN KEY (subscription_id) REFERENCES subscriptions(id) ON DELETE CASCADE
);

-- =====================================================
-- SEARCH & FILTERS
-- =====================================================

-- 26. search_history
CREATE TABLE IF NOT EXISTS search_history (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  search_query VARCHAR(255),
  search_type VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 27. user_preferences
CREATE TABLE IF NOT EXISTS user_preferences (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  preference_key VARCHAR(100),
  preference_value TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- LOCATION & MAPPING
-- =====================================================

-- 28. locations
CREATE TABLE IF NOT EXISTS locations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  country VARCHAR(100),
  city VARCHAR(100),
  latitude DECIMAL(10,8),
  longitude DECIMAL(11,8),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- SECURITY & VERIFICATION
-- =====================================================

-- 29. verification_documents
CREATE TABLE IF NOT EXISTS verification_documents (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  document_type VARCHAR(100),
  document_url VARCHAR(255),
  status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
  verified_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 30. user_sessions
CREATE TABLE IF NOT EXISTS user_sessions (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  token VARCHAR(255),
  device_info JSON,
  ip_address VARCHAR(45),
  expires_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- REELS & STORIES
-- =====================================================

-- 31. reels
CREATE TABLE IF NOT EXISTS reels (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  video_url VARCHAR(255),
  thumbnail_url VARCHAR(255),
  description TEXT,
  music_title VARCHAR(255),
  music_artist VARCHAR(255),
  duration INT,
  view_count INT DEFAULT 0,
  like_count INT DEFAULT 0,
  comment_count INT DEFAULT 0,
  share_count INT DEFAULT 0,
  is_trending BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 32. stories
CREATE TABLE IF NOT EXISTS stories (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  media_url VARCHAR(255),
  media_type ENUM('image', 'video'),
  caption TEXT,
  duration INT DEFAULT 24,
  view_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 33. story_views
CREATE TABLE IF NOT EXISTS story_views (
  id INT AUTO_INCREMENT PRIMARY KEY,
  story_id VARCHAR(36),
  viewer_id VARCHAR(36),
  viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (story_id) REFERENCES stories(id) ON DELETE CASCADE,
  FOREIGN KEY (viewer_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- ACCOMMODATION & TRAVEL
-- =====================================================

-- 34. accommodation_properties
CREATE TABLE IF NOT EXISTS accommodation_properties (
  id VARCHAR(36) PRIMARY KEY,
  service_provider_id VARCHAR(36),
  property_name VARCHAR(255),
  property_type ENUM('Hotel', 'Bed & Breakfast', 'Vacation Rental', 'Guest House', 'Resort', 'Hostel'),
  star_rating INT,
  amenities JSON,
  room_count INT,
  max_guests INT,
  check_in_time TIME,
  check_out_time TIME,
  cancellation_policy TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 35. car_rental_vehicles
CREATE TABLE IF NOT EXISTS car_rental_vehicles (
  id VARCHAR(36) PRIMARY KEY,
  service_provider_id VARCHAR(36),
  vehicle_name VARCHAR(255),
  vehicle_type ENUM('SUV', 'Sedan', 'Luxury', 'Sports Car', 'Van', 'Truck', 'Motorcycle', 'Electric'),
  brand VARCHAR(100),
  model VARCHAR(100),
  year INT,
  transmission ENUM('Manual', 'Automatic'),
  fuel_type ENUM('Petrol', 'Diesel', 'Electric', 'Hybrid'),
  seats INT,
  features JSON,
  insurance_included BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- 36. adventure_packages
CREATE TABLE IF NOT EXISTS adventure_packages (
  id VARCHAR(36) PRIMARY KEY,
  service_provider_id VARCHAR(36),
  package_name VARCHAR(255),
  adventure_type ENUM('Safari', 'Hiking', 'Rock Climbing', 'Water Sports', 'Cultural Tours', 'Adventure Racing'),
  duration VARCHAR(100),
  group_size_min INT,
  group_size_max INT,
  difficulty_level ENUM('Easy', 'Moderate', 'Hard', 'Expert'),
  included_services JSON,
  requirements TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_provider_id) REFERENCES service_providers(id) ON DELETE CASCADE
);

-- =====================================================
-- ENTERTAINMENT & SPORTS
-- =====================================================

-- 37. tv_shows
CREATE TABLE IF NOT EXISTS tv_shows (
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  genre VARCHAR(100),
  network VARCHAR(100),
  seasons_count INT,
  episodes_count INT,
  rating DECIMAL(3,1),
  poster_url VARCHAR(255),
  trailer_url VARCHAR(255),
  is_trending BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 38. music_tracks
CREATE TABLE IF NOT EXISTS music_tracks (
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255),
  album VARCHAR(255),
  genre VARCHAR(100),
  duration INT,
  audio_url VARCHAR(255),
  cover_art_url VARCHAR(255),
  play_count INT DEFAULT 0,
  is_trending BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 39. live_streams
CREATE TABLE IF NOT EXISTS live_streams (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  title VARCHAR(255),
  description TEXT,
  stream_url VARCHAR(255),
  thumbnail_url VARCHAR(255),
  viewer_count INT DEFAULT 0,
  like_count INT DEFAULT 0,
  is_live BOOLEAN DEFAULT FALSE,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- SOCIAL FEATURES
-- =====================================================

-- 40. user_followers
CREATE TABLE IF NOT EXISTS user_followers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  follower_id VARCHAR(36),
  following_id VARCHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (following_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_follow (follower_id, following_id)
);

-- 41. user_blocks
CREATE TABLE IF NOT EXISTS user_blocks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  blocker_id VARCHAR(36),
  blocked_id VARCHAR(36),
  reason TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (blocker_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (blocked_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 42. user_reports
CREATE TABLE IF NOT EXISTS user_reports (
  id VARCHAR(36) PRIMARY KEY,
  reporter_id VARCHAR(36),
  reported_id VARCHAR(36),
  content_type ENUM('user', 'post', 'service', 'message'),
  content_id VARCHAR(36),
  reason VARCHAR(100),
  description TEXT,
  status ENUM('pending', 'investigating', 'resolved', 'dismissed') DEFAULT 'pending',
  admin_notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  resolved_at TIMESTAMP,
  FOREIGN KEY (reporter_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (reported_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- COMMENTS & INTERACTIONS
-- =====================================================

-- 43. comments
CREATE TABLE IF NOT EXISTS comments (
  id VARCHAR(36) PRIMARY KEY,
  user_id VARCHAR(36),
  content_type ENUM('post', 'reel', 'story', 'movie'),
  content_id VARCHAR(36),
  parent_comment_id VARCHAR(36) NULL,
  comment_text TEXT,
  like_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE
);

-- 44. comment_likes
CREATE TABLE IF NOT EXISTS comment_likes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_id VARCHAR(36),
  user_id VARCHAR(36),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- ANALYTICS & METRICS
-- =====================================================

-- 45. user_analytics
CREATE TABLE IF NOT EXISTS user_analytics (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  metric_type VARCHAR(100),
  metric_value DECIMAL(10,2),
  date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 46. content_analytics
CREATE TABLE IF NOT EXISTS content_analytics (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content_type VARCHAR(50),
  content_id VARCHAR(36),
  metric_type VARCHAR(100),
  metric_value INT,
  date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- SEARCH & DISCOVERY
-- =====================================================

-- 47. trending_topics
CREATE TABLE IF NOT EXISTS trending_topics (
  id INT AUTO_INCREMENT PRIMARY KEY,
  topic VARCHAR(255),
  category VARCHAR(100),
  view_count INT DEFAULT 0,
  search_count INT DEFAULT 0,
  is_trending BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 48. content_recommendations
CREATE TABLE IF NOT EXISTS content_recommendations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(36),
  content_type VARCHAR(50),
  content_id VARCHAR(36),
  score DECIMAL(5,4),
  reason VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- Add indexes for better performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_created_at ON posts(created_at);
CREATE INDEX idx_messages_conversation_id ON messages(conversation_id);
CREATE INDEX idx_bookings_client_id ON bookings(client_id);
CREATE INDEX idx_bookings_service_provider_id ON bookings(service_provider_id);
CREATE INDEX idx_reviews_service_provider_id ON reviews(service_provider_id);

-- =====================================================
-- SAMPLE DATA (Optional)
-- =====================================================

-- Insert a test user
INSERT IGNORE INTO users (id, username, email, password_hash, is_verified, is_premium) 
VALUES ('test-user-001', 'testuser', 'test@omify.com', 'hashed_password_here', true, false);

-- Insert a test service provider
INSERT IGNORE INTO service_providers (id, user_id, service_type, business_name, is_available, rating) 
VALUES ('test-provider-001', 'test-user-001', 'Erotic', 'Test Wellness Center', true, 4.5);

-- Schema creation completed successfully!
-- Total tables created: 48
-- Database: omify_db
-- User: omify_user
-- Password: omify123


