import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import { useState } from 'react';
import type { User } from './types';
import TopBar from './components/TopBar';
import Sidebar from './components/Sidebar';
import BottomNav from './components/BottomNav';
import Home from './pages/Home';
import Erotic from './pages/Erotic';
import EroticRegistration from './pages/EroticRegistration';
import DatingRegistration from './pages/DatingRegistration';
import MassageRegistration from './pages/MassageRegistration';
import EscortRegistration from './pages/EscortRegistration';
import Movies from './pages/Movies';
import Reels from './pages/Reels';
import Entertainment from './pages/Entertainment';
import MovieDetails from './pages/MovieDetails';
import Sports from './pages/Sports';
import Login from './pages/Login';
import Register from './pages/Register';
import ServiceProviderProfile from './pages/ServiceProviderProfile';
import Profile from './pages/Profile';
import Premium from './pages/Premium';
import Business from './pages/Professional';
import Bookmarks from './pages/Bookmarks';
import Settings from './pages/Settings';
import CreatePost from './pages/CreatePost';
import Messages from './pages/Messages';
import Notifications from './pages/Notifications';
import Saved from './pages/Saved';
import EditProfile from './pages/EditProfile';
import Explore from './pages/Explore';
import AccommodationRegistration from './pages/AccommodationRegistration';
import AdventureRegistration from './pages/AdventureRegistration';
import CarRentalRegistration from './pages/CarRentalRegistration';

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
    '/movie',
    '/saved',
    '/movies',
    '/explore',
    '/erotic-registration',
    '/dating-registration',
    '/massage-registration',
    '/escort-registration',
    '/accommodation-registration',
    '/adventure-registration',
    '/car-rental-registration',
    '/edit-profile'
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
          <Route path="/profile" element={<Profile user={user} onMenuClick={toggleSidebar} />} />
          <Route path="/edit-profile" element={<EditProfile onMenuClick={toggleSidebar} />} />
          <Route path="/premium" element={<Premium onMenuClick={toggleSidebar} />} />
                         <Route path="/professional" element={<Business onMenuClick={toggleSidebar} />} />
          <Route path="/bookmarks" element={<Bookmarks onMenuClick={toggleSidebar} />} />
          <Route path="/settings" element={<Settings onMenuClick={toggleSidebar} />} />
          <Route path="/create" element={<CreatePost />} />
          <Route path="/messages" element={<Messages />} />
          <Route path="/notifications" element={<Notifications onMenuClick={toggleSidebar} />} />
          <Route path="/saved" element={<Saved onMenuClick={toggleSidebar} />} />
          <Route path="/explore" element={<Explore />} />
                 <Route path="/erotic-registration" element={<EroticRegistration onMenuClick={toggleSidebar} />} />
       <Route path="/dating-registration" element={<DatingRegistration />} />
       <Route path="/massage-registration" element={<MassageRegistration />} />
       <Route path="/escort-registration" element={<EscortRegistration />} />
       <Route path="/accommodation-registration" element={<AccommodationRegistration onMenuClick={toggleSidebar} />} />
       <Route path="/adventure-registration" element={<AdventureRegistration onMenuClick={toggleSidebar} />} />
       <Route path="/car-rental-registration" element={<CarRentalRegistration onMenuClick={toggleSidebar} />} />
       <Route path="/movies" element={<Movies onMenuClick={toggleSidebar} />} />
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
