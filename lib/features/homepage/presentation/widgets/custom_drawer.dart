import 'package:flutter/material.dart';
import 'package:townteam_app/features/auth/presentation/view/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'TOWN TEAM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 20),
                _buildDrawerItem(
                  icon: Icons.home_outlined,
                  title: 'HOME',
                  onTap: () => Navigator.pushNamed(context, '/home'),
                ),
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  title: 'MENS',
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'mens',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.child_care,
                  title: 'KIDS',
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'kids',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.wb_sunny_outlined,
                  title: 'SUMMER COLLECTION',
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'summer',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.new_releases_outlined,
                  title: 'WINTER CLEARANCE',
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'winter',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.local_offer_outlined,
                  title: 'PROMOTIONS',
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'promotions',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  title: 'MY ACCOUNT',
                  onTap: () => Navigator.pushNamed(context, LoginPage.id),
                ),
                _buildExpandableDrawerItem(
                  icon: Icons.support_agent,
                  title: 'CUSTOMER SERVICE',
                  children: [
                    _buildSubDrawerItem(title: 'CONTACT US', onTap: () {}),
                    _buildSubDrawerItem(title: 'HOW TO PURCHASE', onTap: () {}),
                    _buildSubDrawerItem(
                      title: 'DELIVERY AND RETURNS',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'FACEBOOK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text(' · ', style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'EMAIL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('English, EGP',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: onTap,
    );
  }

  Widget _buildExpandableDrawerItem({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children: children,
    );
  }

  Widget _buildSubDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 72),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 14)),
      onTap: onTap,
    );
  }
}
