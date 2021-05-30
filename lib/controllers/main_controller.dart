import 'package:cuentasqr/service/account_service.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final AccountRepository _accountRepository = Get.find<AccountRepository>();

  onInit() {
    super.onInit();
  }

  Future getAmount(String user) async {
    final accounts = await _accountRepository.fetchAccount(user);
    return accounts.docs;
  }
}
