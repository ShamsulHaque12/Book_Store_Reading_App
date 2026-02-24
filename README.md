# book_store

A new Flutter project.

## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
# Book Store (book_store)

A Flutter mobile app implementing a simple book-store UI and flows (auth, discovery, book details, favourites, purchases). This repository uses GetX for state & routing, `get_storage` for local storage, and `flutter_screenutil` for responsive UI.

**Quick links**
- **Project:** [README.md](README.md)

## Features
- Authentication screens (login, sign up, OTP, forgot password)
- Discover & browse books by genre
- Book details, favourites, and purchase flows
- Theme support (light/dark) with persistence
- Responsive UI via `flutter_screenutil`

## Prerequisites
- Flutter SDK (see `environment` in `pubspec.yaml`) — this project targets SDK `^3.10.7`.
- Android Studio / Xcode for platform builds (optional: Visual Studio Code)

## Setup
1. Install Flutter and required platform tools: https://flutter.dev/docs/get-started/install
2. From the project root, fetch dependencies:

```bash
flutter pub get
```

3. (Optional) Upgrade packages if needed:

```bash
flutter pub upgrade --major-versions
```

## Run (dev)
- Run on connected device or emulator:

```bash
flutter run
```

- To run a specific platform build:

```bash
flutter run -d chrome      # web (if enabled)
flutter run -d emulator-5554  # android emulator
```

## Build

```bash
flutter build apk    # Android
flutter build ios    # iOS (macOS required)
```

## Project structure (high level)
- `lib/` — application code, main entry at `lib/main.dart`
- `assets/` — images and icons
- `android/`, `ios/` — platform projects
- `test/` — widget / unit tests

## Important implementation notes
- Uses GetX for navigation and state management (`get`, `get_storage`).
- Theme is managed in `app_theme_mode` and initialized in `main.dart` via `ThemeController` and `GetStorage`.
- Responsive layout uses `flutter_screenutil` with design size 375x812.

## Dependencies (not exhaustive)
- `get` — routing & state
- `get_storage` — local key-value storage
- `flutter_screenutil` — responsive sizing
- `flutter_svg`, `google_fonts`, `lottie`, `image_picker`, `share_plus`

## Recommendations / Next steps (quick review)
- Run `flutter pub outdated` then `flutter pub upgrade` to update dependencies safely.
- Add a `CHANGELOG.md` and a short contributing guide if others will collaborate.
- Add basic CI (e.g., GitHub Actions) to run `flutter analyze` and tests on PRs.

## Troubleshooting
- If you see dependency conflicts, try clearing pub cache and running `flutter pub get`:

```bash
flutter pub cache repair
flutter pub get
```

## License
Specify a license if you intend to open-source this project.

---
Generated README — run the app with `flutter run` after fetching packages.

