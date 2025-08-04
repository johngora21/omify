import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import { useState } from 'react';
import type { User } from './types';
import TopBar from './components/TopBar';
import Sidebar from './components/Sidebar';
import BottomNav from './components/BottomNav';
import Home from './pages/Home';
import Erotic from './pages/Erotic';
import Reels from './pages/Reels';
import Entertainment from './pages/Entertainment';
import MovieDetails from './pages/MovieDetails';
import Movies from './pages/Movies';
import Sports from './pages/Sports';
import Login from './pages/Login';
import Register from './pages/Register';
import ServiceProviderProfile from './pages/ServiceProviderProfile';
import Profile from './pages/Profile';
import Premium from './pages/Premium';
import Professional from './pages/Professional';
import Bookmarks from './pages/Bookmarks';
import Settings from './pages/Settings';
import CreatePost from './pages/CreatePost';
import Messages from './pages/Messages';
import Notifications from './pages/Notifications';

function AppContent() {
  const [user, setUser] = useState<User | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const location = useLocation();

  const toggleSidebar = () => {
    setSidebarOpen(!sidebarOpen);
  };

  // Pages where we want to hide the top bar and bottom navigation
  const fullScreenPages = [
    '/profile',
    '/premium', 
    '/professional',
    '/bookmarks',
    '/settings',
    '/messages',
    '/notifications',
    '/movie'
  ];

  // Pages where we only want to hide the top bar but keep bottom navigation
  const hideTopBarPages = [
    '/erotic',
    '/entertainment',
    '/reels'
  ];

  const isFullScreenPage = fullScreenPages.some(page => location.pathname.startsWith(page));
  const shouldHideTopBar = isFullScreenPage || hideTopBarPages.some(page => location.pathname.startsWith(page));

  return (
    <div style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      background: '#fafafa'
    }}>
      {/* Top Bar - Hidden on full screen pages and pages where we only hide top bar */}
      {!shouldHideTopBar && (
        <TopBar user={user} setUser={setUser} onMenuClick={toggleSidebar} />
      )}

      {/* Sidebar */}
      <Sidebar
        isOpen={sidebarOpen}
        onClose={() => setSidebarOpen(false)}
        user={user}
        setUser={setUser}
      />

      {/* Main Content Area */}
      <main style={{
        flex: 1,
        paddingBottom: isFullScreenPage ? '0px' : '70px', // No padding on full screen pages
        paddingTop: shouldHideTopBar ? '0px' : '60px', // No top padding when top bar is hidden
        overflowY: 'auto',
        background: '#fafafa',
        maxWidth: '100vw',
        overflowX: 'hidden'
      }}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/erotic" element={<Erotic />} />
          <Route path="/reels" element={<Reels />} />
          <Route path="/entertainment" element={<Entertainment />} />
          <Route path="/movie/:id" element={<MovieDetails />} />
          <Route path="/movies" element={<Movies />} />
          <Route path="/sports" element={<Sports />} />
          <Route path="/login" element={<Login setUser={setUser} />} />
          <Route path="/register" element={<Register setUser={setUser} />} />
          <Route path="/provider/:id" element={<ServiceProviderProfile />} />
          <Route path="/profile" element={<Profile user={user} />} />
          <Route path="/premium" element={<Premium />} />
          <Route path="/professional" element={<Professional />} />
          <Route path="/bookmarks" element={<Bookmarks />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="/create" element={<CreatePost />} />
          <Route path="/messages" element={<Messages />} />
          <Route path="/notifications" element={<Notifications />} />
        </Routes>
      </main>

      {/* Bottom Navigation - Hidden on full screen pages */}
      {!isFullScreenPage && <BottomNav />}
    </div>
  );
}

function App() {
  return (
    <Router>
      <AppContent />
    </Router>
  );
}

export default App;
