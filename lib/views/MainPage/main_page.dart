import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_service/views/AccountScreen/account_screen.dart';
import 'package:my_service/views/BookingScreen/booking_screen.dart';
import 'package:my_service/views/CartScreen/cart_screen.dart';
import 'package:my_service/views/HomePage/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  static const List pages = <Widget>[
    HomePage(),
    CartScreen(),
    BookingScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    onTapped(selectedPage);
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
        height: kBottomNavigationBarHeight,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          onTapped(index);
        },
        index: selectedPage,
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 20.0,
          ),
          Icon(
            Icons.shop_outlined,
            color: Colors.white,
            size: 20.0,
          ),
          Icon(
            Icons.my_library_books_outlined,
            color: Colors.white,
            size: 20.0,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
