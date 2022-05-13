import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:practice1/Widget/Buttons.dart';
import 'package:practice1/Widget/views.dart';
import 'package:practice1/main.dart';
import 'package:practice1/Datafile/data.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final Function onPressed;
  final AssetImage image;
  const ButtonWidget({required this.image, required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  //Main Menu Button
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.image,
            ),
          ),
          width: 100,
          height: 100,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.onPressed();
              });
            },
          )
        ),
        Container(
          child: Text(widget.text,
            style: TextStyle(fontSize: 15),),
          margin: EdgeInsets.all(10),
        )
      ],
    );
  }
}

//Plus Button
class PlusButton extends StatelessWidget {
  Function onPressed;
  PlusButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        child: TextButton(
            child: Icon(
              Icons.add_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              onPressed();
            }
        )
    );
  }
}

//Minus Button
class MinusButton extends StatelessWidget {
  Function onPressed;
  MinusButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextButton(
        child: Icon(
          Icons.zoom_out,
          color: Colors.black,
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}


//Changing Color Button

class ColorButton extends StatelessWidget {
  Function onPressed;
  ColorButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextButton(
        child: Icon(
          Icons.check_circle_outline,
          color: Colors.black,
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}


class NewButton extends StatefulWidget {
  Function onPressed;
  NewButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  State<NewButton> createState() => _NewButtonState();
}

class _NewButtonState extends State<NewButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AnimatedPositioned(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onPressed();
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.zoom_in),
                ),
              ),
              duration: Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}

