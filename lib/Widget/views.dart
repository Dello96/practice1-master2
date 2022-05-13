
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice1/Datafile/firebase.dart';
import 'package:practice1/Widget/buttons.dart';
import 'package:practice1/Pages/pages.dart';
import 'package:practice1/utils.dart';

// Containing ID, USER
class ConciseView extends StatelessWidget {
  final String text;
  final TextStyle? font;
  const ConciseView({required this.text, this.font, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: font ?? TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }
}


// Conataining DATE
class DateView extends StatelessWidget {
  String text;
  DateView({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
        color: Color(0xffEECC9E),
        child: Text(text,
          style: TextStyle(
            color: Colors.black,
          ),)
    );
  }
}


//containing (ID, USER, DATE)
class Conciseview2 extends StatefulWidget {
  int index;
  Widget button;
  bool color;
  Widget button2;
  bool changes;

  Conciseview2({required this.index, required this.button, required this.color,required this.button2, required this.changes, Key? key}) : super(key: key);

  @override
  State<Conciseview2> createState() => _Conciseview2State();
}

class _Conciseview2State extends State<Conciseview2> {
  late bool color;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: (widget.color)
              ? Color(0xffaa77bb)
              : Colors.white,
        ),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                alignment: Alignment.topLeft,
                child: ConciseView(text: system.data.orders[widget.index].id)
            ),
            Divider(
              color: Colors.black45,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 8),
                  child: Row(
                    children: [
                      ConciseView(text: system.data.orders[widget.index].name,
                        font: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                  ),
                ),
                widget.button2,
                Row(
                  children: [
                    Container(
                      child: widget.button,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DetailView extends StatefulWidget {
  Widget button;
  int index;
  bool color;
  Widget button2;
  bool changes;
  DetailView({required this.index, required this.button, required this.color, required this.button2, required this.changes, Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (widget.color) ? Color(0xffaa77bb) : Colors.white,
          ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
              alignment: Alignment.topLeft,
              child: ConciseView(text: system.data.orders[widget.index].id)
              ),
          Divider(
            color: Colors.black45,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 8),
                    child: Row(
                      children: [
                        ConciseView(text: system.data.orders[widget.index].name,
                          font: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    ),
                  ),
                  widget.button2,
                  Row(
                    children: [
                      Container(
                        child: widget.button
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  children: listItems(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  List<Widget> listItems () {
    List<Widget> items = [];
    for (int i = 0; i < system.data.orders[widget.index].items.length; i++) {
      items.add(Text(system.data.orders[widget.index].items[i].toString()));
    }
    return items;
  }
}


