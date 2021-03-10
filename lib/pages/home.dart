import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String profileImage = 'https://www.rollingstone.com/wp-content/uploads/2018/07/dave-grohl-4870a23d-5f88-404f-8848-db39e6508261-e1530527310623.jpg';
  String userProfile = 'Dave Grohl';
  int rating = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              '$userProfile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Comforta',
                letterSpacing: 2,
                color: Colors.grey[300],
              ),
            ),
            elevation: 20,
            backgroundColor: Colors.indigo,
            centerTitle: true,
            bottom: PreferredSize(
              child:Transform.translate(
                  offset: const Offset(0, 30),
                child:  CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImage),
                ),
              ),
              preferredSize: const Size.fromHeight(0.0),
            ),
            floating: true,
            expandedHeight: 200,
          ),
        ],
      ),
    );
  }
}
