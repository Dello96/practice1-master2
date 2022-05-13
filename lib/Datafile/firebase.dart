import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice1/Datafile/data.dart';

class FirebaseManager {
  List<Order> orders = [];

  Future<void> getOrders () async {
    orders = [];
    CollectionReference ref = FirebaseFirestore.instance.collection("orders");
    QuerySnapshot snapshot = await ref.orderBy("date").get();
    print(snapshot.docs);

    for (int i = 0; i < snapshot.docs.length; i++) {
      orders.add(
        Order(
          id: snapshot.docs[i].id,
          year: int.parse(snapshot.docs[i]["date"].toString().substring(0, 4)),
          month: int.parse(snapshot.docs[i]["date"].toString().substring(4, 6)),
          day: int.parse(snapshot.docs[i]["date"].toString().substring(6, 8)),
          time: snapshot.docs[i]["slot"],
          items: snapshot.docs[i]["items"].cast<String>(),
          sizes: snapshot.docs[i]["sizes"],
          user: snapshot.docs[i]["user"],
          name: snapshot.docs[i]["name"],
          address: snapshot.docs[i]["address"],
          details: snapshot.docs[i]["addressDetails"],
        ),
      );

    }
  }
}