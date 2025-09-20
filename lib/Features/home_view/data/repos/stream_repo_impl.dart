import 'package:auto_swift/Features/home_view/data/repos/stream_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreamRepoImpl implements StreamRepo {
  @override
  Stream<QuerySnapshot> carsStream(String selectedBrand) {
    CollectionReference carsRef = FirebaseFirestore.instance.collection('cars');

    // فلترة على البراند فقط
    return carsRef.where('brand', isEqualTo: selectedBrand).snapshots();
  }

  Stream<QuerySnapshot> allCarsStream() {
    return FirebaseFirestore.instance.collection('cars').snapshots();
  }
}
