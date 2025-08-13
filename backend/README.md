# Omify Backend API

A RESTful Node.js/Express API backend for the Omify mobile application.

## 🚀 Features

- **Authentication**: JWT-based user authentication
- **User Management**: Registration, login, profile management
- **Post Management**: Create, read, update, delete posts
- **Database**: MySQL integration with connection pooling
- **Security**: Password hashing, CORS, Helmet security headers
- **Validation**: Input validation and error handling
- **Pagination**: Built-in pagination for all list endpoints

## 📋 Prerequisites

- Node.js (v14 or higher)
- MySQL database
- npm or yarn

## 🛠️ Installation

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Create environment file:**
   Create a `.env` file in the root directory:
   ```env
   # Database Configuration
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=omify_user
   DB_PASSWORD=omify123
   DB_NAME=omify_db

   # JWT Configuration
   JWT_SECRET=your-super-secret-key-here

   # Server Configuration
   PORT=3000
   NODE_ENV=development
   ```

3. **Start the server:**
   ```bash
   # Development mode (with auto-reload)
   npm run dev

   # Production mode
   npm start
   ```

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user profile
- `PUT /api/auth/profile` - Update user profile
- `POST /api/auth/change-password` - Change password
- `POST /api/auth/logout` - User logout

### Users
- `GET /api/users` - Get all users (with pagination)
- `GET /api/users/:id` - Get user by ID
- `GET /api/users/username/:username` - Get user by username
- `PUT /api/users/:id` - Update user profile
- `DELETE /api/users/:id` - Delete user account
- `GET /api/users/:id/stats` - Get user statistics

### Posts
- `POST /api/posts` - Create new post
- `GET /api/posts` - Get all posts (with filtering)
- `GET /api/posts/:id` - Get post by ID
- `PUT /api/posts/:id` - Update post
- `DELETE /api/posts/:id` - Delete post
- `POST /api/posts/:id/like` - Like a post
- `DELETE /api/posts/:id/like` - Unlike a post
- `GET /api/posts/search/:query` - Search posts

## 🔐 Authentication

The API uses JWT (JSON Web Tokens) for authentication. Include the token in the Authorization header:

```
Authorization: Bearer <your-jwt-token>
```

## 📊 Database Schema

The API expects the following main tables:
- `users` - User accounts and profiles
- `posts` - User posts and content
- `followers` - User following relationships

## 🚀 Deployment

### Local Development
```bash
npm run dev
```

### Production
```bash
npm start
```

### Environment Variables for Production
- Set `NODE_ENV=production`
- Use a strong `JWT_SECRET`
- Configure production database credentials
- Set appropriate CORS origins

## 📱 Flutter Integration

This API is designed to work seamlessly with the Omify Flutter mobile app. The endpoints match exactly what the Flutter app expects.

## 🔒 Security Features

- Password hashing with bcrypt
- JWT token authentication
- CORS protection
- Helmet security headers
- Input validation
- SQL injection protection

## 📝 Error Handling

All endpoints return consistent error responses:
```json
{
  "success": false,
  "message": "Error description"
}
```

## 🎯 Health Check

- `GET /health` - Server health status

## 📄 License

This project is part of the Omify application suite.
