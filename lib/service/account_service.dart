import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuentasqr/model/account_model.dart';
import 'package:get/get.dart';

class AccountRepository extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<AcccountModel>> fetchAccount(String user) async {
    return _firestore
        .collection('accounts')
        .where('usuario', isEqualTo: user)
        .withConverter<AcccountModel>(
          fromFirestore: (snapshots, _) =>
              AcccountModel.fromJson(snapshots.data()!),
          toFirestore: (account, _) => account.toJson(),
        )
        .get();
  }
}
