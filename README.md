
# 🎬 Route Movie App 🍿

Welcome to the **Movie App** repository!  
This is a **Flutter-based mobile application** designed to deliver a smooth and engaging experience for movie lovers.  
Users can explore trending and popular movies, search for specific titles, view detailed information, and bookmark their favorites — all within a modern and responsive UI.

---

## 🎓 About the Project
This application was developed as part of our **Graduation Project** at **Route Training Center**, aiming to apply **industry-level standards** in mobile app development.  
The app showcases best practices in architecture, state management, API integration, and responsive design.

---

## ✨ Features
- 🎥 **Discover Movies**: Browse the latest, most popular, and trending films  
- 🔍 **Search Functionality**: Quickly find movies using keywords  
- 📂 **Categories & Browse**: Explore movies by genres, filtering duplicates automatically  
- 📖 **Movie Details**: View synopsis, rating, release date, genres, likes, and comments  
- 🎭 **Personalized Recommendations**: Suggested movies based on current selection  
- 🔖 **Bookmarking / Watchlist**: Save favorite movies for easy access later  
- 📝 **History Tab**: Tracks your recently viewed movies locally using SharedPreferences  
- 🌐 **API Integration**: Fetch live movie data from [YTS API](https://documenter.getpostman.com/view/24969030/2sAYBUDC3i)  
- 📱 **Responsive Design**: Optimized for all screen sizes and orientations  
- ⚡ **State Management**: Built using **Bloc** for robust state handling  

---

## 🛠️ Technologies Used
- **Framework:** Flutter & Dart  
- **State Management:** Bloc (Business Logic Component)  
- **Networking:** Dio & YTS API  
- **Local Storage:** SharedPreferences  
- **Image Caching:** CachedNetworkImage  
- **Design:** Figma for UI/UX  

---

## 📂 Project Structure
```
movie_app/
├─ lib/
│  ├─ core/
│  │  ├─ widgets/           # Shared widgets (MovieItem, Buttons, etc.)
│  │  └─ app_theme.dart     # Theme and styling
│  ├─ features/
│  │  ├─ auth/              # Login, Register, Forgot Password
│  │  ├─ tabs/
│  │  │  ├─ home_tab/
│  │  │  ├─ browse_tab/
│  │  │  └─ profile_tab/    # Watchlist, History, Update Profile
│  │  └─ details_screen/    # Movie Details Screen
│  └─ main.dart
├─ assets/                  # Images, icons, fonts
├─ pubspec.yaml
└─ README.md
```

---

## 🎨 Design
- [Figma Design File](https://www.figma.com/design/O51USUdiAaw2ptWy60PTrz/Movies?node-id=52-641&t=plSMleRAGBNcAfd0-0)  
- Fully responsive design with support for multiple screen sizes  
---

## 🎬 Demo Video
You can watch the full demo here:  
[▶️ Watch Demo ](https://drive.google.com/file/d/1P815JCgv_toQ4qrUH6ntI3qv2gma4pNf/view?usp=drivesdk)
---

## 🚀 Installation
1. **Clone the repository:**
```bash
git clone https://github.com/AyaaMohammedsayed/movie_app.git
cd movie_app
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the app:**
```bash
flutter run
```

---

## 🖥️ Screens
- Splash Screen  
- Onboarding Screens  
- Authentication Screens: Login, Register, Forget Password  
- Home Screen with 4 Tabs: Home, Search, Browse, Profile  
- Update Profile Screen  
- Movie Details Screen  

---

## 🤝 Team & Acknowledgments
Developed by the Flutter Track Graduation Team under the mentorship of Route Training Center.  
Special thanks to our instructors for their guidance and support.

### 👨‍💻 Collaborators
- 👩‍💻 Aya Mohamed Sayed — Flutter Developer & Team Lead  
- 👨‍💻 Mohamed Elsayed — Flutter Developer  
- 👨‍💻 Rahma Ahmed Sobih — Flutter Developer  

---

## 📌 Notes
- Ensure Bloc State Management is used for all state handling  
- All screens are fully responsive  
- Maintain history and watchlist persistence using local storage and API sync  
- Follow Clean Architecture principles for code structure  

