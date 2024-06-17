import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  String imagePath;
  String title;
  String text;
  IntroPage(this.imagePath, this.title, this.text, {super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              fit: BoxFit.fill,
              widget.imagePath,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 100,
        left: 0,
        right: 0,
        child: Container(
          height: 120,
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                // TextStyle(

                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
