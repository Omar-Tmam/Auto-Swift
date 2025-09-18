import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StreamRepo {
  Stream<QuerySnapshot> carsStream( String selectedBrand);
}
