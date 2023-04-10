import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/build_card.dart';
import 'package:flutter_application_1/views/widgets/donut_tile.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // list of donuts
  List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "assets/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "assets/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "assets/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "assets/images/chocolate_donut.png"],
    ["Ice Cream", "36", Colors.blue, "assets/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "assets/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "assets/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "assets/images/chocolate_donut.png"],
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final controller = Get.find<AuthController>();

  //AuthController controller = Get.put(AuthController());
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
              shrinkWrap: true,
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
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://scontent.fgza9-1.fna.fbcdn.net/v/t1.6435-9/117729858_1650711601771304_3832706372464906444_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iduN0a63TssAX-x8XEG&_nc_ht=scontent.fgza9-1.fna&oh=00_AfD0OjIsNR_pGlWHPolAf1rTb_14uHeQomlWoCK8QOyH9Q&oe=645B7D69',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://scontent.fgza9-1.fna.fbcdn.net/v/t1.6435-9/117729858_1650711601771304_3832706372464906444_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iduN0a63TssAX-x8XEG&_nc_ht=scontent.fgza9-1.fna&oh=00_AfD0OjIsNR_pGlWHPolAf1rTb_14uHeQomlWoCK8QOyH9Q&oe=645B7D69',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://scontent.fgza9-1.fna.fbcdn.net/v/t1.6435-9/117729858_1650711601771304_3832706372464906444_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iduN0a63TssAX-x8XEG&_nc_ht=scontent.fgza9-1.fna&oh=00_AfD0OjIsNR_pGlWHPolAf1rTb_14uHeQomlWoCK8QOyH9Q&oe=645B7D69',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          TabPageSelector(
            indicatorSize: 15,
            color: Colors.amber.shade900,
            selectedColor: Colors.yellowAccent,
            controller: _tabController,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: donutsOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return DonutTile(
                  donutFlavor: donutsOnSale[index][0],
                  donutPrice: donutsOnSale[index][1],
                  donutColor: donutsOnSale[index][2],
                  imageName: donutsOnSale[index][3],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
