import 'package:flutter/material.dart';
import 'package:goolez/screens/cleaningscreen.dart';
import '../widgets/reuseableservicebox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    OrdersPage(),
    PromotionsPage(),
    NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3FA),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Promotions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "Notifications",
          ),
        ],
      ),
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
    );
  }
}

//
//
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: const BoxDecoration(
            color: Color(0xffD7FF00),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 22,
                        child: Image.asset(
                          'assets/goolezzlogo.png',
                          width: 28,
                          height: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Goolez",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.menu, size: 32),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "I want to hire a...",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Services",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                ServiceBox(icon: Icons.cleaning_services, title: "Cleaning", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CleaningServicesPage(),));
                },),
                ServiceBox(icon: Icons.build, title: "Repairing", onTap: () {  },),
                ServiceBox(icon: Icons.electrical_services, title: "Electrician", onTap: () {  },),
                ServiceBox(icon: Icons.chair_alt, title: "Carpenter", onTap: () {  },),
                ServiceBox(icon: Icons.handyman, title: "Plumber", onTap: () {  },),
                ServiceBox(icon: Icons.local_taxi, title: "Taxi", onTap: () {  },),
                ServiceBox(icon: Icons.person, title: "Driver", onTap: () {  },),
                ServiceBox(icon: Icons.local_pharmacy, title: "Medicine", onTap: () {  },),
                ServiceBox(icon: Icons.more_horiz, title: "More", onTap: () {  },),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//
//
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Orders Page",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
//
class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Promotions Page",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
//
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Notifications Page",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
