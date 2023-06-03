import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/pages/pages.dart';
import 'package:warzone_companion_app/widgets/square_avatar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const String route = '/';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final tabsPage = <BottomNavigationBarItem, Widget>{
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_max_outlined),
      label: 'Home',
    ): const HomePage(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.stream_outlined),
      label: 'Stream',
    ): const StreamPage(),
    const BottomNavigationBarItem(
        icon: Icon(Icons.content_paste_rounded),
        label: 'Guides'): const GuidesPage(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.storefront_outlined),
      label: 'Store',
    ): const StorePage(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.people_outline_rounded),
      label: 'Friends',
    ): const StorePage(),
  };

  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          SquareAvatar(imageUrl: ronal.image),
        ],
      ),
      body: tabsPage.entries.elementAt(currentIndex).value,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          items: tabsPage.keys.toList(),
          currentIndex: currentIndex,
          selectedItemColor: Colors.lightGreenAccent[400],
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
