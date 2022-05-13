class Order {
  String id;
  String user;
  String name;
  List<String> items;
  late DateTime date;
  int year;
  int month;
  int day;
  int time;
  String address;
  String details;
  Map<dynamic, dynamic> sizes;
  Order({required this.id, required this.user, required this.name, required this.address, required this.details, required this.year, required this.month, required this.day, required this.time, required this.items, required this.sizes}){
    date = DateTime(year, month, day);
  }
}
