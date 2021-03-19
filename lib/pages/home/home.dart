import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:handly_app/pages/handly_calls/create_handly_call.dart';
import 'package:handly_app/pages/home/handlyCalls_list.dart';
import 'package:handly_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:handly_app/services/handly_calls.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  final FirebaseAuth _ath = FirebaseAuth.instance;
  final AuthService _auth = AuthService();
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();


  String profileImage = 'https://www.rollingstone.com/wp-content/uploads/2018/07/dave-grohl-4870a23d-5f88-404f-8848-db39e6508261-e1530527310623.jpg';
  String userProfile;
  String email;
  int score = 250;



  @override
  Widget build(BuildContext context) {
    final User user = _ath.currentUser;
    print(user);
    if (user.displayName != null ) {
      setState(() {
        userProfile = user.displayName;
        email = user.email;
      });
    } else {
      setState(() {
        userProfile = 'Hello User';
      });
    }

    return StreamProvider<List<HandlyCall>>.value(
      value: HandlyCallsDatabaseService().handlyCalls,
      child: Scaffold(
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: SafeArea(
                  child:
                  Text(
                    '$userProfile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comforta',
                      color: Colors.grey[400],
                      fontSize: 26,
                    ),
                  ),
                ),

                centerTitle: true,
                elevation: 100,
                floating: false,
                pinned: true,
                expandedHeight: 180,
                collapsedHeight: 121,
                backgroundColor: Colors.indigo,

                bottom: PreferredSize(
                  child:Transform.translate(
                    offset: const Offset(0, 30),
                    child: SingleChildScrollView(
                      child:  Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 70,),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Community Score:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Comforta',
                                    color: Colors.grey[400],
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    '$score',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comforta',
                                      color: Colors.lightGreenAccent,
                                      fontSize: 19,
                                    ),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(profileImage),
                          ),
                        ],
                      ),
                    )
                  ),
                  preferredSize: const Size.fromHeight(0.0),
                ),
              ),
            ];
          },
          body: HandlyCallsList(),
        ),

         floatingActionButton: FabCircularMenu(
           key: fabKey,
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
                  if (fabKey.currentState.isOpen) {
                    fabKey.currentState.close();
                  } else {
                    fabKey.currentState.open();
                  }
                  Navigator.pushNamed(context, '/create_new_handly_call');
                }
            ),
            IconButton(
                icon: Icon(Icons.group_add),
                color: Colors.amberAccent,
                iconSize: 40,
                onPressed: () {
                  if (fabKey.currentState.isOpen) {
                    fabKey.currentState.close();
                  } else {
                    fabKey.currentState.open();
                  }
                  print('Lets meet up');
                }
            ),
          ],
        ),

      ),
    );
  }
}

