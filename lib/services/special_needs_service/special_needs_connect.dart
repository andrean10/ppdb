import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppdb/app/data/special_needs_model/special_needs_model.dart';

class SpecialNeedsConnect {
  final FirebaseFirestore firestore;

  SpecialNeedsConnect(this.firestore);

  final COL_SPECIAL_NEEDS = 'special_needs';

  Future<QuerySnapshot<SpecialNeedsModel>> get fetchSpecialNeeds => firestore
      .collection(COL_SPECIAL_NEEDS)
      .withConverter(
        fromFirestore: (snapshot, _) =>
            SpecialNeedsModel.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson(),
      )
      .orderBy(FieldPath.fromString('category'))
      .get();
}
