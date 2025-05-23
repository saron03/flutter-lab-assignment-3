# Flutter Lab Assignment 3
- Saron Yitbareck Tigabu
- UGR/3774/15

This Flutter app fetches and displays a list of albums using the JSONPlaceholder API. Users can view album titles on the list screen and explore each album's photos and details on the detail screen.

## JSONPlaceholder API

- Albums: [`https://jsonplaceholder.typicode.com/albums`](https://jsonplaceholder.typicode.com/albums)  
- Photos: [`https://jsonplaceholder.typicode.com/photos`](https://jsonplaceholder.typicode.com/photos)

---

## Tech Stack

| Layer                | Technology                  |
|---------------------|-----------------------------|
| Architecture        | MVVM                        |
| UI Layer            | Flutter Widgets             |
| State Management    | BLoC                        |
| Networking          | `http` package (HttpClient) |
| Navigation          | `go_router`                 |

---

## Features

### List Screen
- Scrollable list of albums
- Each item shows:
  - Thumbnail photo
  - Album title
- Displays loading indicator while fetching data
- Displays error message with a retry option if the request fails

### Detail Screen
- Displays all photos related to the selected album using image cards
- Shows album information like:
  - Album ID
  - User ID
  - Album title

### Navigation
- Implemented using the `GoRouter` package for smooth screen transitions

### Error Handling
- Graceful handling of network errors with retry functionality

---

## Project Structure (MVVM + BLoC)

    lib/
    ├── data/
    │ ├── models/ # Album and Photo models
    │ └── repositories/ # Fetch data from APIs
    ├── logic/
    │ └── bloc/ # AlbumBloc, states, events
    ├── presentation/
    │ ├── screens/ # ListScreen and DetailScreen
    │ └── widgets/ # Reusable UI components
    ├── routes/ # GoRouter configuration
    └── main.dart # App entry point


---

## Getting Started
1. Clone the repository:
```
git clone https://github.com/yourusername/flutter-lab-assignment-3.git
```
```
cd flutter-lab-assignment-3
```
2. Install dependencies:
```
flutter pub get
```
3. Run the app:
```
flutter run
```


