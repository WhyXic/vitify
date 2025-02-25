import 'package:flutter/material.dart';
import 'package:confession_app/searchpage.dart';
import 'package:confession_app/postscreen.dart';
import 'package:confession_app/profilescreen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  // List of pages to switch between
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    PostScreen(),
    ProfileScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Keeps state of each page
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Vitify"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
        ],
        toolbarHeight: 100,
      ),
    );
  }
}

// Create a separate HomePage widget for the main content
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          for (int i = 0; i < 5; i++) ContentCard()
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                  Text("Username"),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "I saw someone die in AB1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("MAN THAT IS SO CRINGE"),
              Spacer(),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.thumb_down)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
