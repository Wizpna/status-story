import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Status Stories',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StoryView(
        [
          //The StoryItem.text accepts a text, you can add any text you want
          StoryItem.text(
            "WOW !!! i built my first status story",
            Colors.pinkAccent,
            fontSize: 25
          ),

          //The StoryItem.pageImage accepts an image, you can add any image you want
          //In this tutorial, Cached Network Image Provider was used so as to load the image and also cache images
          //StoryItem.pageImage accepts a caption
          //The caption describes the image
          StoryItem.pageImage(
            CachedNetworkImageProvider(
                "https://i.pinimg.com/originals/f6/eb/53/f6eb535411056b553dfdec1665387c0c.jpg"),
            caption: "Simply beautiful😘😘😘",
          ),
          StoryItem.pageImage(
            CachedNetworkImageProvider(
                "https://i.pinimg.com/originals/f6/eb/53/f6eb535411056b553dfdec1665387c0c.jpg"),
            caption: "Simply beautiful😘😘😘",
          ),
          StoryItem.pageImage(
              CachedNetworkImageProvider(
                "http://s3.weddbook.com/t4/2/5/0/2501568/vanila-wedding-boutique-dubai-on-instagram-have-a-lovely-weekend-everyone-let-it-be-sunny-throughout-the-upcoming-days-to-enjoy-the-beach-and-the-sea-our-lovely-vanila-bride.jpg"),
              caption: "Vanila Wedding Boutique Dubai",
              ),
          StoryItem.pageImage(
            CachedNetworkImageProvider(
              "https://i0.pickpik.com/photos/836/957/310/adventure-jump-hipster-ext-preview.jpg"),
            caption: "Jumping beside cliff during daytime",
          ),

          //The StoryItem.pageGif accepts a GIf, you can add any Gif you want
          //It accepts a caption. The caption describes the Gif
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Thanks for watching",
            controller: storyController,
          ),
          
          //The StoryItem.pageVideo accepts a Video.
          //It accepts a caption. The caption describes the video
          StoryItem.pageVideo(
          "https://firebasestorage.googleapis.com/v0/b/tactile-timer-267314.appspot.com/o/Hang%20-%2030902.mp4?alt=media&token=74eec54b-7c4a-43dc-bd7a-522a494b69c0",
          caption: "title of the video",
          controller: storyController,
          shown: true,
          duration: Duration(m)
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: true,
        controller: storyController,
      ),
    );
  }
}
