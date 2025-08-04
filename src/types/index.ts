export interface User {
  id: string;
  name: string;
  email: string;
  userType: 'client' | 'provider';
  orientation: 'straight' | 'lesbian' | 'bisexual';
  isVerified: boolean;
  age: number;
  location: string;
  bio?: string;
  photos: string[];
}

export interface ServiceProvider extends User {
  userType: 'provider';
  serviceType: 'escort' | 'masseur';
  
  // Services offered
  services: {
    threesome: boolean;
    traditionalIntimate: boolean;
    oralServices: boolean;
    peggingServices: boolean;
    massageWithHappyEnding: boolean;
    nuruMassage: boolean;
    videoCalls: boolean;
    rimjob: boolean;
  };
  
  // Equipment available
  equipment: {
    vibrators: boolean;
    dildos: boolean;
    analToys: boolean;
    nippleClamps: boolean;
    bondageEquipment: boolean;
    massageTable: boolean;
    hotStones: boolean;
    massageOils: boolean;
    costumes: boolean;
    roleplayProps: boolean;
    safetyEquipment: boolean;
  };
  
  // Pricing
  pricing: {
    hourly: number;
    overnight?: number;
    videoCall?: number;
  };
  
  // Location & availability
  incall: boolean;
  outcall: boolean;
  travelRadius: number;
  availability: string[];
  
  // Serves which orientations
  servesOrientations: {
    straight: boolean;
    lesbian: boolean;
    bisexual: boolean;
  };
  
  // Reviews
  rating: number;
  reviewCount: number;
  reviews: Review[];
}

export interface Review {
  id: string;
  clientId: string;
  clientName: string;
  rating: number;
  comment: string;
  date: string;
  serviceType: string;
}

export interface Client extends User {
  userType: 'client';
  preferences: {
    serviceType: 'escort' | 'masseur' | 'both';
    maxPrice: number;
    maxDistance: number;
    orientation: 'straight' | 'lesbian' | 'bisexual';
  };
  favorites: string[];
  bookingHistory: Booking[];
}

export interface Booking {
  id: string;
  providerId: string;
  clientId: string;
  serviceType: string;
  date: string;
  time: string;
  duration: number;
  totalPrice: number;
  status: 'pending' | 'confirmed' | 'completed' | 'cancelled';
  location: string;
  specialRequests?: string;
}

export interface FilterOptions {
  serviceType: 'escort' | 'masseur' | 'both';
  orientation: 'straight' | 'lesbian' | 'bisexual' | 'all';
  maxPrice: number;
  maxDistance: number;
  rating: number;
  availability: string[];
} 