import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/build_card.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../model/product_model.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'This is product 1.',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      name: 'Product 2',
      description: 'This is product 2.',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      name: 'Product 3',
      description: 'This is product 3.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      name: 'Product 4',
      description: 'This is product 4.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      name: 'Product 5',
      description: 'This is product 5.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
    Product(
      name: 'Product 6',
      description: 'This is product 6.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store App'),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Logout From App",
                titleStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                middleText: 'Are you sure you need to logout',
                middleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.grey,
                radius: 10,
                textCancel: " No ",
                cancelTextColor: Colors.white,
                textConfirm: " YES ",
                confirmTextColor: Colors.white,
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  controller.signOutFromApp();
                },
                buttonColor: Colors.green,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: ListView.separated(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return buildCard(index);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: 8,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80",
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80",
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80",
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(
              child: TabPageSelector(
                controller: _tabController,
                selectedColor: Colors.black,
                indicatorSize: 14,
                // color: Colors.purple,
                borderStyle: BorderStyle.solid,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.network(
                          products[index].imageUrl,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                products[index].name,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              const Icon(Icons.favorite_outline)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '\$${products[index].price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            products[index].description,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
