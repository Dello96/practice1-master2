

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:practice1/Datafile/data.dart';
import 'package:practice1/Datafile/firebase.dart';
import 'package:practice1/Widget/buttons.dart';
import 'package:practice1/utils.dart';

import '../Widget/views.dart';


//   Main Page

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Management Menu',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                text: 'OrderCheck' ,
                image: AssetImage('assets/Images/order.png'),
                onPressed: () async {
                  await system.data.getOrders();
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) {
                        return OrderCheck();
                      })
                  );
                }
              ),
              ButtonWidget(text: 'StockCheck', onPressed: () {}, image: AssetImage('assets/Images/stock.png')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(text: 'SalesManagement', onPressed: () {}, image: AssetImage('assets/Images/sales.png')),
              ButtonWidget(text: 'A/S', onPressed: () {}, image: AssetImage('assets/Images/analytic.png'))
            ],
          ),
        ],
      ),
    );
  }
}


//   Order Check Page

class OrderCheck extends StatefulWidget {
  OrderCheck({Key? key}) : super(key: key);

  @override
  State<OrderCheck> createState() => _OrderCheckState();
}

class _OrderCheckState extends State<OrderCheck> {
  List<bool> changes = [false, false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  List<bool> colors = [false, false, false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Check',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: system.data.orders.length,
        itemBuilder: (context, index){
          if (index == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black87
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(system.data.orders[index].date.toString().split(' ')[0]),
                      Text(system.data.orders[index].time.toString().split(' ')[0])
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                ordercard(index)
              ],
            );
          }
          if (system.data.orders[index].date != system.data.orders[index - 1].date) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black87
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(system.data.orders[index].date.toString().split(' ')[0]),
                          Text(system.data.orders[index].time.toString().split(' ')[0])
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                ordercard(index)
              ],
            );
          }
          else {
            return ordercard(index);
          }
        },
      ),
    );
  }
  
  Widget ordercard (int index) {
    return !changes[index] ?
    Conciseview2(
      index: index,
      button: NewButton(
          onPressed: () {
            setState(() {
              changes[index] = !changes[index];
            });
            }
      ),
      button2: ColorButton(
          onPressed: () {
            setState(() {
              colors[index] = !colors[index];
            });
          }
      ),
      color: colors[index],
      changes: changes[index],
    ) :
    DetailView(
      index: index,
      button: MinusButton(
          onPressed: () {
            setState(() {
              changes[index] = !changes[index];
            });
          }
      ),
      button2: ColorButton(
          onPressed: () {
            setState(() {
              colors[index] = !colors[index];
            });
          }
      ),
      color: colors[index],
      changes: changes[index],
    );
  }
}