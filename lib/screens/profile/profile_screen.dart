import 'package:diamon_store/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        final user = authController.currentUser;
        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                color: Colors.blue,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user == null
                          ? 'Guest User'
                          : '${user.firstName} ${user.lastName}'.trim(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user?.email ?? 'Vui lòng đăng nhập để sử dụng đầy đủ tính năng',
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    if (user == null)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: const Text('Đăng nhập ngay'),
                      )
                    else
                      OutlinedButton(
                        onPressed: () async {
                          await authController.logout();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Đã đăng xuất'),
                              ),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: const Text('Đăng xuất'),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    user == null
                        ? 'Vui lòng đăng nhập để sử dụng đầy đủ tính năng'
                        : 'Xin chào ${user.username.isNotEmpty ? user.username : user.firstName}!',
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
