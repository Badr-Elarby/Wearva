# Profile Feature

This feature handles user profile management in the Wearva shopping app.

## Structure

```
lib/features/profile/
├── business_logic/
│   └── profile_cubit.dart          # State management for profile
├── data/
│   ├── models/
│   │   ├── user_model.dart         # User data model
│   │   └── index.dart
│   ├── repo/
│   │   └── profile_repository.dart # Repository interface and implementation
│   └── web_services/
│       └── profile_web_service.dart # API service for profile operations
└── presentation/
    ├── screens/
    │   ├── profile_screen.dart     # Main profile screen
    │   └── index.dart
    └── widgets/
        ├── profile_option_tile.dart # Reusable option tile widget
        ├── user_stats_card.dart    # User statistics card widget
        └── index.dart
```

## Features

- **User Profile Display**: Shows user information, avatar, and verification status
- **Profile Options**: List of profile-related actions with modern UI
  - Dark Mode toggle switch
  - Account Information
  - Password management
  - Order history
  - Payment cards
  - Wishlist
  - Settings
- **Orders Button**: Quick access to user's order count
- **Verified Profile**: Shows verification status with green checkmark
- **Logout**: Secure logout functionality with confirmation dialog
- **Responsive Design**: Uses flutter_screenutil for responsive layouts
- **Consistent Styling**: Follows app's design system with AppColors and AppTextStyles

## Usage

```dart
// Navigate to profile screen
context.push('/Profile');

// Or use the route name
context.goNamed('ProfileScreen');
```

## Dependencies

- `flutter_screenutil` - Responsive design
- `go_router` - Navigation
- `http` - API calls (in web service)

## State Management

The feature uses a simple `ChangeNotifier` pattern with `ProfileCubit` for state management. This can be easily replaced with other state management solutions like Bloc, Riverpod, or Provider.

## API Integration

The feature includes mock data and API service structure. To integrate with real APIs:

1. Update `ProfileWebService` with actual API endpoints
2. Replace mock data in `ProfileRepositoryImpl` with real API calls
3. Add proper error handling and loading states
4. Implement authentication token management

## Customization

- Colors: Update `AppColors` for consistent theming
- Text Styles: Modify `AppTextStyles` for typography
- Layout: Adjust spacing and sizing using `flutter_screenutil`
- Icons: Replace Material Icons with custom icons as needed
