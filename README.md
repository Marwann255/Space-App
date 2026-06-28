# 🪐 Space App

A Flutter mobile app for exploring the solar system. Swipe through the planets in an animated carousel, then tap into a detail screen packed with real astronomical data for each one — distance from the sun, orbital period, radius, mass, gravity, and more.

## Features

- **Login screen** — Full-bleed background image with a welcome message and an "Explore" button that drops you into the app.
- **Planet carousel (Home screen)** — A swipeable `PageView` cycling through all 9 bodies (Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, and the Sun). Back/forward arrow buttons stay in sync with the swipe gesture via a shared `PageController`, and the current planet's name updates live below the carousel.
- **Planet detail screen** — Tapping "Explore" on a planet navigates (via `Navigator.pushNamed` with the selected index as an argument) to a dedicated screen showing:
    - A short description of the planet
    - Distance from the Sun (km)
    - Length of day (hours)
    - Orbital period (years)
    - Radius (km)
    - Mass (kg)
    - Surface gravity (m/s²)
    - Surface area (km²)
- **Custom branding** — A Saturn-themed app icon (`flutter_launcher_icons`) and a matching native splash screen (`flutter_native_splash`) for both Android and iOS.
## Tech Stack

- **Flutter** / **Dart** (SDK `^3.11.5`)
- Named routes (`MaterialApp.routes`) for navigation between `loginScreen`, `homeScreen`, and `planetDetailedScreen`
- `StatefulWidget` + `PageController` for carousel state, with state lifted to the parent screen so the nav arrows and the page indicator stay in sync
- `flutter_launcher_icons` and `flutter_native_splash` for app branding
## Project Structure

```
lib/
├── main.dart                       # App entry point & route table
├── Screens/
│   ├── login_screen.dart           # Welcome / entry screen
│   ├── home_screen.dart            # Planet carousel + navigation
│   └── planet_detailed_screen.dart # Per-planet detail view
└── utilites/
    ├── page_view.dart              # AppPageView — the reusable planet carousel widget
    ├── app_Constants.dart          # Planet names, images, and all astronomical data
    ├── app_colors.dart             # Shared color palette
    ├── app_buttons.dart            # Reusable buttons (ActionButton, ExploreAppButtons)
    ├── app_scaffold.dart           # Shared screen scaffold/background
    └── text_style.dart             # Shared text styles
```

## Assets

Planet imagery for `earth`, `jupiter`, `mars`, `mercury`, `neptune`, `saturn`, `sun`, `uranus`, and `venus`, plus background art (`Frame 1.png`, `Rectangle 4.png`) and branding images (`logo.png`, `logo1.png`) used for the splash screen and app icon. All assets live in `assets/` and are declared in `pubspec.yaml`.

## Getting Started

**Prerequisites:** [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and on your `PATH`, plus Android Studio (or VS Code) with the Flutter/Dart plugins.

```bash
# Clone the repo
git clone https://github.com/Marwann255/Space-App.git
cd Space-App
 
# Install dependencies
flutter pub get
 
# Run on a connected device or emulator
flutter run
```

## Author

Built by [Marwann255](https://github.com/Marwann255) as part of ongoing Flutter coursework and practice projects.