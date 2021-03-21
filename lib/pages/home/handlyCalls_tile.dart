import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:handly_app/models/location_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HandlyCallTile extends StatelessWidget {
  final HandlyCall handlyCall;

  HandlyCallTile({this.handlyCall});

  @override
  Widget build(BuildContext context) {

    String _rwrd;

    final geo = GeoFlutterFire();
    var locationModel = Provider.of<LocationModel>(context);
    var point = geo.point(latitude: handlyCall.location.latitude, longitude: handlyCall.location.longitude);

    var distance = point.distance(lat: locationModel.latitude, lng: locationModel.longitude);


    if (handlyCall.reward == ''){
       _rwrd = handlyCall.money.toString() + ' ₪';
    } else {
      _rwrd = handlyCall.reward;
    }


    return Padding(
        padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTileTheme(
          child: ExpansionTile(
            leading: Icon(Icons.pin_drop_outlined),
            title: Text(
                handlyCall.title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            ),
            subtitle: Wrap(
              children: [
                Text(
                  '${handlyCall.name} offers a reward of: ',
                  style: TextStyle(
                    fontSize: 15.5,
                  ),
                ),
                Text(
                  _rwrd,
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 10, 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Type of help needed:  ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          handlyCall.type,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'The job:  ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          handlyCall.description,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Distance From you:  ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          distance.toStringAsFixed(2) + ' Km',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              IconButton(
                  icon: Icon(Icons.my_location),
                  onPressed: () {
                    launch('https://www.google.com/maps/search/?api=1&query=${handlyCall.location.latitude},${handlyCall.location.longitude}');
                  }
              ),
              ],
          ),
        ),
      ),
    );
  }
}
