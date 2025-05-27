import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:townteam_app/common/models/cart_provider.dart';
import 'package:townteam_app/features/auth/presentation/view/login_page.dart';
import 'package:townteam_app/features/homepage/presentation/widgets/homepage_widget.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final List<Map<String, dynamic>> categories = [
  //   {'name': "Men's\nCollection", 'icon': Icons.person,},
  //   {'name': 'Apparel-\nKids', 'icon': Icons.child_care},
  //   {'name': 'New\nArrival', 'icon': Icons.new_releases},
  //   {'name': 'Winter\n2025', 'icon': Icons.ac_unit},
  // ];

  final List<Map<String, dynamic>> categories = [
    {
      'name': "Men's\nCollection",
      'icon': Icons.person,
      'path': 'men/closes',
      'subcategory': 'Boys Jackets',
      'title': 'Men'
    },
    {
      'name': 'Apparel-\nKids',
      'icon': Icons.child_care,
      'path': 'kids/closes',
      'subcategory': 'Boys Jackets',
      'title': 'Kids'
    },
    {
      'name': 'New\nArrival',
      'icon': Icons.new_releases,
      'path': 'newarrival/newarrival',
      'subcategory': 'Men Jackets',
      'title': 'New Arrival'
    },
    {
      'name': 'Winter\n2025',
      'icon': Icons.ac_unit,
      'path': 'winter/winter',
      'subcategory': 'Men Jackets',
      'title': 'Winter'
    },
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: const Text(
            'TOWN TEAM',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return cartProvider.items.isEmpty
                          ? const SizedBox()
                          : Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${cartProvider.items.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            // Category Circles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: categories
                    .map(
                      (category) => _buildCategoryCircle(context, category),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            HomePageWidget(),
            // Unique Pick Banner
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: GestureDetector(
            //     onTap: () {
            //       // Use the first category as the banner's category, or define a dedicated one
            //       final bannerCategory = categories[0];
            //       Navigator.pushNamed(
            //         context,
            //         '/product',
            //         arguments: {
            //           'path': bannerCategory['path'],
            //           'subcategory': bannerCategory['subcategory'],
            //           'title': bannerCategory['name'].split('\n')[0],
            //         },
            //       );
            //     },
            //     child: HomePageWidget(),
            //     // child: Container(
            //     //   width: double.infinity,
            //     //   height: 400,
            //     //   decoration: BoxDecoration(
            //     //     borderRadius: BorderRadius.circular(8),
            //     //     color: Colors.pink[100],
            //     //   ),
            //     //   child: Stack(
            //     //     children: [
            //     //       Positioned(
            //     //         bottom: 0,
            //     //         left: 0,
            //     //         right: 0,
            //     //         child: Container(
            //     //           padding: const EdgeInsets.all(16),
            //     //           decoration: BoxDecoration(
            //     //             gradient: LinearGradient(
            //     //               begin: Alignment.bottomCenter,
            //     //               end: Alignment.topCenter,
            //     //               colors: [
            //     //                 Colors.black.withOpacity(0.8),
            //     //                 Colors.transparent,
            //     //               ],
            //     //             ),
            //     //           ),
            //     //           child: const Column(
            //     //             crossAxisAlignment: CrossAxisAlignment.start,
            //     //             children: [
            //     //               Text(
            //     //                 'UNIQUE PICK',
            //     //                 style: TextStyle(
            //     //                   color: Colors.white,
            //     //                   fontSize: 24,
            //     //                   fontWeight: FontWeight.bold,
            //     //                 ),
            //     //               ),
            //     //               Text(
            //     //                 '40% OFF',
            //     //                 style: TextStyle(
            //     //                   color: Colors.yellow,
            //     //                   fontSize: 20,
            //     //                   fontWeight: FontWeight.bold,
            //     //                 ),
            //     //               ),
            //     //             ],
            //     //           ),
            //     //         ),
            //     //       ),
            //     //     ],
            //     //   ),
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCircle(
    BuildContext context,
    Map<String, dynamic> category,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: {
            'path': category['path'],
            'subcategory': category['subcategory'],
            'title': category['title'],
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.orange, width: 2),
              color: Colors.grey[200],
            ),
            child: Icon(category['icon'], size: 40, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            category['name'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
