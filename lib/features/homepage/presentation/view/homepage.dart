import 'package:flutter/material.dart';
import 'package:townteam_app/features/KidsCatogry/presentation/view/kids_catogry.dart';
import 'package:townteam_app/features/MensCatogry/presentation/view/mens_catogry.dart';
import 'package:townteam_app/features/auth/presentation/view/login_page.dart';
import 'package:townteam_app/features/homepage/presentation/widgets/listtile_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'TOWN TEAM',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                icon: const Icon(Icons.message_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'TOWN TEAM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTileDrawer(
              title: 'Home',
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawer(
              title: 'MENS',
              icon: Icons.person,
              onTap: () {
                Navigator.pushReplacementNamed(context, MensCatogry.id);
              },
            ),
            ListTileDrawer(
              title: 'KIDS',
              icon: Icons.person,
              onTap: () {
                Navigator.pushReplacementNamed(context, KidsCatogry.id);
              },
            ),
            ListTileDrawer(
              title: 'SUMMER COLLECTION',
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawer(
              title: 'WINTER COLLECTION',
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawer(
              title: 'PROMOTIONS',
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawer(
              title: 'MY ACCOUNT',
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTileDrawer(
              title: 'CUSTOMER SERVICE',
              icon: Icons.person,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('men')
            .doc('closes')
            .collection('Boys Jackets')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var productt = snapshot.data!.docs[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https:${productt['image']['src']}',
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 120);
                      },
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        productt['title'] ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (productt['price'] != null)
                      Text(
                        'EGP ${productt['price']['amount']}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    if (productt['color'] != null)
                      Text(
                        'Color: ${productt['color']}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    if (productt['discount'] != null)
                      Text(
                        'Sale ${productt['discount']['percentage']}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Text(
                      'Fit: ${productt['fit'] ?? 'Standard'}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   static const String id = 'login_page';

//   const LoginPage({super.key});
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   final nameController = TextEditingController();
//   final surnameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final repeatPasswordController = TextEditingController();

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Process registration
//       print('All fields are valid');
//     } else {
//       _showWarningDialog();
//     }
//   }

//   void _showWarningDialog() {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         title: Column(
//           children: [
//             Icon(Icons.warning_amber_rounded, size: 48, color: Colors.orange),
//             SizedBox(height: 8),
//             Text('WARNING!'),
//           ],
//         ),
//         content: Text("Please complete all fields to continue."),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//               onPressed: () => Navigator.of(ctx).pop(),
//               child: Text("OK"),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     bool obscureText,
//   ) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       style: TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.grey[400]),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey[600]!),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) {
//           return '';
//         }
//         return null;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: BackButton(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.disabled,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildTextField(nameController, 'NAME', false),
//               SizedBox(height: 12),
//               _buildTextField(surnameController, 'SURNAME', false),
//               SizedBox(height: 12),
//               _buildTextField(emailController, 'EMAIL', false),
//               SizedBox(height: 12),
//               _buildTextField(passwordController, 'PASSWORD', true),
//               SizedBox(height: 12),
//               _buildTextField(
//                   repeatPasswordController, 'REPEAT PASSWORD', true),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey[900],
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 onPressed: _submitForm,
//                 child: Text(
//                   'SIGN UP',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                     letterSpacing: 1.5,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
