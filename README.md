# simpsons-viewer-flutter
#Author: Benjamin Dempsey

For this project, I used GetX to handle state management and I followed the provided GetX architecture.

To parse the JSON feed from the provided source I used json_serializable to generate the fromJson() functions.

**In order for this to run you may need to run:**

`pub get`
`dart run build_runner build`

**This will generate the required files based on the Character model I created**


Sources: 
I used the following YouTube video for help with setting up the network service to retrieve the JSON feed: https://www.youtube.com/watch?v=hz2LQ43muio
I referenced a personal side project for help with setting up `home_controller.dart` and how to use the `Obx()` widget properly for state management.
I used `get_cli` to generate boilerplate code for the individual pages but all functionality was done on my own.
Here are all of the dependencies used in this project seen in `pubspec.yaml`:
```
dependencies: 
  cupertino_icons: ^1.0.2
  get: 4.6.5
  flutter: 
    sdk: flutter
  json_annotation: ^4.8.1
  build_runner: ^2.4.6
  http: ^1.1.0

dev_dependencies: 
  flutter_lints: ^2.0.0
  flutter_test: 
    sdk: flutter
  json_serializable: ^6.7.1
```
