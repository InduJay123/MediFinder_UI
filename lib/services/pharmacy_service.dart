import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medi_finder_user_home_page/models/pharamcy_model.dart';

class PharmacyService {
  final _db = FirebaseFirestore.instance;

  Stream<List<PharmacyModel>> getTopPharmacies() {
    return _db
        .collection('pharmacies')
        .where('isTop', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => PharmacyModel.fromMap(doc.id, doc.data()))
          .toList();
    });
  }
}