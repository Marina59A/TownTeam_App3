import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:townteam_app/common/models/language_provider.dart';
import 'package:townteam_app/features/auth/presentation/view/login_page.dart';
import 'package:townteam_app/l10n/app_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                  title: l10n.Home,
                  onTap: () => Navigator.pushNamed(context, '/home'),
                ),
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  title: l10n.MENS,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'mens',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.child_care,
                  title: l10n.KIDS,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'kids',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.wb_sunny_outlined,
                  title: l10n.SUMMER_COLLECTION,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'summer',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.new_releases_outlined,
                  title: l10n.WINTER_COLLECTION,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'winter',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.local_offer_outlined,
                  title: l10n.PROMOTIONS,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: 'promotions',
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  title: l10n.MY_ACCOUNT,
                  onTap: () => Navigator.pushNamed(context, LoginPage.id),
                ),
                _buildExpandableDrawerItem(
                  icon: Icons.support_agent,
                  title: l10n.CUSTOMER_SERVICE,
                  children: [
                    _buildSubDrawerItem(title: l10n.CONTACT_US, onTap: () {}),
                    _buildSubDrawerItem(
                        title: l10n.HOW_TO_PURCHASE, onTap: () {}),
                    _buildSubDrawerItem(
                      title: l10n.DELIVERY_AND_RETURNS,
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
                      child: Text(
                        l10n.FACEBOOK,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text(' · ', style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.EMAIL,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<LanguageProvider>(context)
                                  .currentLocale
                                  .languageCode ==
                              'en'
                          ? 'English, EGP'
                          : 'العربية, ج.م',
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        final languageProvider = Provider.of<LanguageProvider>(
                            context,
                            listen: false);
                        languageProvider.toggleLanguage();
                      },
                      child: Text(
                        l10n.Change,
                        style: const TextStyle(color: Colors.white),
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
