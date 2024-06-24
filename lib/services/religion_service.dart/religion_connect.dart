import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppdb/app/data/special_needs_model/special_needs_model.dart';

class ReligionConnect {
  final FirebaseFirestore firestore;

  ReligionConnect(this.firestore);

  final COL_RELIGION = 'religion';

  Future<QuerySnapshot<SpecialNeedsModel>> get fetchReligion => firestore
      .collection(COL_RELIGION)
      .withConverter(
        fromFirestore: (snapshot, _) =>
            SpecialNeedsModel.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson(),
      )
      .orderBy(FieldPath.fromString('title'))
      .get();
}
