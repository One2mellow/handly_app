import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/services/auth.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  String profileImage = 'https://www.rollingstone.com/wp-content/uploads/2018/07/dave-grohl-4870a23d-5f88-404f-8848-db39e6508261-e1530527310623.jpg';
  String userProfile = 'Dave Grohl';
  int rating = 250;


  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    return Scaffold(
      drawer: Drawer(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue.withOpacity(0.9),
          ),
          child: ListView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(120, 127, 246, 1.0),
                ),
              ),
              ListTile(
                tileColor: Colors.white.withOpacity(0.4),
                  leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                ),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: SafeArea(
              child:
              Text(
                '$userProfile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comforta',
                  color: Colors.grey[400],
                  fontSize: 25,
                ),
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.indigo,
            bottom: PreferredSize(
              child:Transform.translate(
                offset: const Offset(0, 30),
                child:  Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 70,),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Community Score:',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Comforta',
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$rating',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comforta',
                                color: Colors.lightGreenAccent,
                                fontSize: 15,
                              ),
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profileImage),
                    ),
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(0.0),
            ),
            floating: true,
            expandedHeight: 200,
          ),

        ],
      ),
      floatingActionButton: FabCircularMenu(
        fabOpenIcon: Icon(Icons.record_voice_over_sharp),
        alignment: Alignment.bottomCenter,
        ringDiameter: 200,
        ringWidth: 2,
        fabColor: Colors.yellowAccent,
        fabElevation: 10,
        fabMargin: EdgeInsets.all(16.0),
        ringColor: Colors.grey[400],
        children: [
          IconButton(
              icon: Icon(Icons.pan_tool),
              color: Colors.amberAccent,
              iconSize: 40,
              onPressed: () {
                print('Give me a hand');
              }
          ),
          IconButton(
              icon: Icon(Icons.group_add),
              color: Colors.amberAccent,
              iconSize: 40,
              onPressed: () {
                print('Lets meet up');
              }
          ),
        ],
      ),

    );
  }
}
