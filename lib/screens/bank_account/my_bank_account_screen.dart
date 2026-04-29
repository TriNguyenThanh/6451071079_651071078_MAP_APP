import 'package:flutter/material.dart';
import '/controller/bank_account_controller.dart';
import '/data/models/bank_account_model.dart';
import 'add_edit_bank_account_screen.dart';

class MyBankAccountScreen extends StatelessWidget {
  final BankAccountController _controller = BankAccountController();
  MyBankAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE), // Nền xám nhạt cực sang
      appBar: AppBar(
        title: const Text(
          'My Bank Accounts',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.blue),
            onPressed: () => (context as Element).markNeedsBuild(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditBankAccountScreen()),
          );
        },
        label: const Text(
          'Add Bank',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<List<BankAccountModel>>(
stream: _controller.getBanks(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}
final banks = snapshot.data ?? [];
if (banks.isEmpty) {
return _buildEmptyState(context);
}
return ListView.builder(
padding: const EdgeInsets.symmetric(horizontal: 16, vertical:
10),
itemCount: banks.length,
itemBuilder: (context, index) {
final bank = banks[index];
return _buildBankCard(context, bank);});}
    );
  }
}
