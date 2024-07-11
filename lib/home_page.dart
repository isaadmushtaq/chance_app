import 'package:flutter/material.dart';
import 'package:test_application/create_post_page.dart';
import 'package:test_application/widget/chat_tile.dart';
import 'package:test_application/widget/post_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PublicFeed(),
    Text('Search Screen'),
    Text('Create Screen'),
    ChatTile(),
    Text('Profile Screen'),
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 2) {
      // Adjust this index based on your actual item order
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreatePost()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CHANCE'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            labelColor: Color(0xff5DC482),
            indicatorColor: Color(0xff5DC482),
            tabs: [
              Tab(text: 'Public Feed'),
              Tab(text: 'Business Feed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _widgetOptions.elementAt(selectedIndex),
            const Text('Business Feed Screen'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff5DC482),
          unselectedItemColor: Colors.black,
          onTap: _onBottomNavItemTapped,
        ),
      ),
    );
  }
}

class PublicFeed extends StatelessWidget {
  const PublicFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add pull-to-refresh functionality here
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Feeds',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 30,
                    ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
