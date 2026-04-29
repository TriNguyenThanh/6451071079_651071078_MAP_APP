import '../data/services/login_auth_service.dart';
import '../data/models/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  UserModel? currentUser;

  bool get isLoggedIn => currentUser != null;

  Future<void> login(String email, String password) async {
    UserModel user = await _authService.loginWithEmailPassword(email, password);
    currentUser = user;
    update();
  }

  Future<void> logout() async {
    await _authService.logout();
    currentUser = null;
    update();
  }
}
