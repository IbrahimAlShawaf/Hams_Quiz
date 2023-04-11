import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/build_card.dart';
import 'package:flutter_application_1/views/widgets/text_util.dart';
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
      imageUrl: 'assets/images/Rectangle1.png',
    ),
    Product(
      name: 'Product 2',
      description: 'This is product 2.',
      price: 19.99,
      imageUrl: 'assets/images/Rectangle2.png',
    ),
    Product(
      name: 'Product 3',
      description: 'This is product 3.',
      price: 29.99,
      imageUrl: 'assets/images/Rectangle3.png',
    ),
    Product(
      name: 'Product 4',
      description: 'This is product 4.',
      price: 29.99,
      imageUrl: 'assets/images/one.png',
    ),
    Product(
      name: 'Product 5',
      description: 'This is product 5.',
      price: 29.99,
      imageUrl: 'assets/images/two.png',
    ),
    Product(
      name: 'Product 6',
      description: 'This is product 6.',
      price: 29.99,
      imageUrl: 'assets/images/three.png',
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    text: 'Categories',
                    color: Color(0xff222B45),
                    underLine: TextDecoration.none),
                TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: 'View all',
                    color: Color(0xffF3651F),
                    underLine: TextDecoration.none),
              ],
            ),
          ),
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
              //physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/tabbar.png",
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/tabbar.png",
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/tabbar.png",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextUtils(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    text: 'Popular Products',
                    color: Color(0xff222B45),
                    underLine: TextDecoration.none),
                TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    text: 'View all',
                    color: Color(0xffF3651F),
                    underLine: TextDecoration.none),
              ],
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
                        Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Image.asset(
                              products[index].imageUrl,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  )),
                            )
                          ],
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
