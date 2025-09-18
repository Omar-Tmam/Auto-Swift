import 'package:auto_swift/Features/home_view/data/repos/stream_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreamRepoImpl implements StreamRepo{
  @override
   Stream<QuerySnapshot> carsStream( String selectedBrand) {
    CollectionReference carsRef = FirebaseFirestore.instance.collection('cars');

    if (selectedBrand != null) {
      // فلترة على البراند فقط
      return carsRef.where('brand', isEqualTo: selectedBrand).snapshots();
    } else {
      // كل العربيات من غير ترتيب
      return carsRef.snapshots();
    }
  }

}