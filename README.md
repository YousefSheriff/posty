# P O S T Y 🟣
### YOUR SOCIAL SPACE

> A cross-platform mobile social application built with Flutter.

---

## 📖 Project Overview

Posty is a cross-platform mobile social application built with Flutter. Users can register an account, log in, browse a live feed of posts fetched from a REST API, search through them in real time, view full post details, and publish their own posts. The app ships with a polished dark/light theme toggle and handles offline connectivity gracefully.

### Core Features

- 🎬 Animated splash screen with slide-in branding
- 🔐 Firebase Authentication — email/password register & login
- 🗄️ Firestore user profiles created on registration
- 📡 Posts feed fetched from MockAPI via Dio
- 🔍 Real-time in-app search across titles and body text
- 📄 Post details screen loaded on demand
- ✍️ Create & publish new posts with date-time stamping
- 🌙 Dark / Light theme toggle, persisted across sessions
- 📶 Offline detection with a persistent snackbar banner
- 💾 Session persistence — users stay logged in between launches

---

## 🚀 How to Run

### Prerequisites

- Flutter SDK ≥ 3.0 — verify with `flutter --version`
- Dart SDK ≥ 3.0
- Android Studio or VS Code with Flutter & Dart plugins
- A Firebase project with **Authentication** and **Firestore** enabled
- `google-services.json` placed in `android/app/`
- `GoogleService-Info.plist` placed in `ios/Runner/` *(iOS only)*

### Step-by-Step

**1. Clone the repository**
```bash
git clone https://github.com/your-username/posty.git
cd posty
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Add Firebase configuration files**

Copy `google-services.json` into `android/app/` and (optionally) `GoogleService-Info.plist` into `ios/Runner/`.

**4. Run the app**
```bash
flutter run
```
Or select a device in your IDE and press Run.

**5. (Optional) Build a release APK**
```bash
flutter build apk --release
```

---

## 🏗️ Architecture Explanation

Posty follows a **Feature-First Clean Architecture** approach combined with the **BLoC (Cubit)** pattern.

```
lib/
├── Features/
│   ├── auth/
│   │   ├── data/               # Models (UserModel)
│   │   └── presentation/
│   │       ├── manager/        # LoginCubit, RegisterCubit + States
│   │       └── views/          # Screens + Widgets
│   ├── posts/
│   │   ├── data/               # Models (PostModel, fake data)
│   │   └── presentation/
│   │       ├── manager/        # PostsCubit + States
│   │       └── views/          # Home, Details, Create screens
│   └── splash/
│       └── presentation/
│           └── views/          # SplashScreen + animation
└── core/
    ├── local/                  # CacheHelper (SharedPreferences)
    ├── network/
    │   ├── remote/             # DioHelper + EndPoints
    │   └── network_cubit/      # ConnectivityCubit (online/offline)
    ├── theme/                  # ThemeCubit + ThemeStates
    ├── shared/                 # BlocObserver, shared methods, components
    └── utils/                  # AppColors, AppStyles, AppRoutes, AppAssets
```

The architecture separates concerns across **three distinct layers**:

- **Data Layer** — responsible only for models and raw data access. It knows nothing about Flutter widgets or business logic.
- **Presentation Layer** — split into *managers* (Cubits + States) and *views* (screens + widgets). Cubits own all business logic and emit states that the UI reacts to — no business logic ever lives inside a widget.
- **Core Layer** — cross-cutting infrastructure (network helpers, local cache, routing, theming, shared components) that any feature can import without circular dependencies.

This separation makes each piece **testable in isolation**: a Cubit can be unit-tested by providing a fake `DioHelper`, a widget can be widget-tested by providing a fake Cubit, and routing can be integration-tested independently.

---

## 📦 Libraries Used

| Package | Why it was chosen |
|---|---|
| `flutter_bloc` / `bloc` | State management with Cubit pattern — predictable, scalable, testable |
| `firebase_auth` | Firebase Authentication — email/password sign-in and registration |
| `cloud_firestore` | Firestore database — stores user profiles after registration |
| `dio` | HTTP client — clean API for GET/POST requests with timeouts |
| `go_router` | Declarative routing — type-safe navigation with GoRouter |
| `shared_preferences` | Local key-value storage — persists uId, isDark theme, and splash flag |
| `connectivity_plus` | Real-time network monitoring — detects online/offline changes |
| `fluttertoast` | Lightweight toast notifications — success/error feedback |
| `flutter_svg` | SVG asset rendering — used for the splash screen logo |
| `intl` | Date formatting — formats post creation timestamps |
| `conditional_builder_null_safety` | Conditional widget builder — cleanly switches between loading and content |

---

*Posty — Built with Flutter ❤️*