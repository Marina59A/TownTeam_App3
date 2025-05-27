import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:townteam_app/common/models/auth_provider.dart';
import 'package:townteam_app/features/account/presentation/view/my_favorites_page.dart';

class MyAccountPage extends StatelessWidget {
  static const String id = 'my_account_page';

  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = firebase_auth.FirebaseAuth.instance.currentUser;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'MY ACCOUNT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Section
            Text(
              'Hello, ${user?.displayName ?? 'User'}!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user?.email ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Menu Items
            _buildAccountMenuItem(
              context,
              title: 'MY ORDERS',
              subtitle: 'Order Status, History and Tracking',
              onTap: () {},
            ),
            _buildAccountMenuItem(
              context,
              title: 'MY FAVORITES',
              subtitle: 'Manage and view favorite items',
              onTap: () => Navigator.pushNamed(context, MyFavoritesPage.id),
            ),
            _buildAccountMenuItem(
              context,
              title: 'PROFILE',
              subtitle: 'Manage name and phone number',
              onTap: () {},
            ),
            _buildAccountMenuItem(
              context,
              title: 'ADDRESS BOOK',
              subtitle: 'Manage your addresses',
              onTap: () {},
            ),
            _buildAccountMenuItem(
              context,
              title: 'RECENTLY VIEWED',
              subtitle: 'See recently viewed items',
              onTap: () {},
            ),
            _buildAccountMenuItem(
              context,
              title: 'ACCOUNT DELETION',
              subtitle: 'Request permanent account deletion',
              onTap: () {},
            ),

            const SizedBox(height: 40),

            // Sign Out Button
            Center(
              child: OutlinedButton(
                onPressed: () {
                  authProvider.logout();
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'SIGN OUT',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountMenuItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
