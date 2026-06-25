import 'package:ecommerce_ui/screens/widgets/item_banner.dart';
import 'package:ecommerce_ui/screens/widgets/item_category.dart';
import 'package:ecommerce_ui/screens/widgets/item_gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> banners = ["banner1.webp", "banner2.webp"];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: const Text("E-commerce"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Badge(
              label: const Text(
                "10",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              child: const Icon(Icons.notification_add_outlined),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),

          SizedBox(
            height: 200,
            child: SizedBox(
              height: 200,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: [
                  for (String banner in banners) ItemBanner(image: banner),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: currentIndex == index ? 12 : 10,
                width: currentIndex == index ? 12 : 10,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Colors.grey.shade500
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Categories"),
            trailing: Text("SHOW ALL", style: TextStyle(color: Colors.indigo)),
          ),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemCategory(
                        title: "Beauty",
                        image: "beauty.png",
                        color: Colors.orange,
                      ),
                      ItemCategory(
                        title: "Baby",
                        image: "mother.png",
                        color: Colors.indigo,
                      ),
                      ItemCategory(
                        title: "Electronics",
                        image: "electronics.png",
                        color: Colors.green,
                      ),
                      ItemCategory(
                        title: "Kitchen",
                        image: "kitchen.png",
                        color: Colors.blueAccent,
                      ),
                      ItemCategory(
                        title: "Medicines",
                        image: "medicines.png",
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            title: Text("Products"),
            trailing: Text("SHOW ALL", style: TextStyle(color: Colors.indigo)),
          ),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.80,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: const [
              ItemGridview(
                image: "doctor_machines.jpg",
                title:
                    "Lorem ipsum is a standard dummy or placeholder text used in graphic design.",
                price: "₹125",
              ),
              ItemGridview(
                image: "headphones.jpeg",
                title:
                    "Lorem ipsum is a standard dummy or placeholder text used in graphic design.",
                price: "₹299",
              ),
              ItemGridview(
                image: "dslr.jpeg",
                title:
                    "Lorem ipsum is a standard dummy or placeholder text used in graphic design.",
                price: "₹999",
              ),
              ItemGridview(
                image: "shopping.jpg",
                title:
                    "Lorem ipsum is a standard dummy or placeholder text used in graphic design.",
                price: "₹199",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
