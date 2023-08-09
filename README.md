# simpsons-viewer-flutter
#Author: Benjamin Dempsey

For this project I used GetX to handle state management and I followed the provided GetX architecture.

To parse the JSON feed from the provided source I used json_serializable to generate the fromJson() functions.
**In order for this to run you may need to run:**
`pub get`
`dart run build_runner build`
**This will generate the required files based on the Character model I created**

Sources - I used the following YouTube video for help with setting up the network service to retrieve the JSON feed: https://www.youtube.com/watch?v=hz2LQ43muio
