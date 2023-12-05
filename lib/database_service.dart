import 'package:firebase_database/firebase_database.dart';

void createUser(String name, String age, String address, String email) {
  DatabaseReference user =
      FirebaseDatabase.instance.ref().child('person').push();
  user.set({'name': name, 'age': age, 'address': address, 'email': email});
}

void readData(Function(List<Map<dynamic, dynamic>>) onDataFetched) {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('person');

  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value as Map;

    if (data != null) {
      List<Map<dynamic, dynamic>> list = [];

      data.forEach((key, value) {
        list.add(value);
      });

      onDataFetched(list);
    }
  });
}
