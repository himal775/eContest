
import 'package:econtest/pages/event_Overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingalProduct extends StatelessWidget {
  final String eventName;
  final String eventOrganizer;
  final String eventImage;
  final String eventDate;
  final String eventDescription;
  final Function onTap;

  // Constructor
  SingalProduct(
      {required this.eventName,
      required this.eventOrganizer,
      required this.eventImage,
      required this.eventDate,
      required this.eventDescription,
      required this.onTap}
      );

  @override
  Widget build(BuildContext context) {
    var widget;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector (
                  onTap:() async{
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  EventOverview(eventImage: '$eventImage', eventName: '$eventName', eventDescription: '$eventDescription', eventOrganizer: '$eventOrganizer', eventDate: '$eventDate', ),));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      eventImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventName,
                        ),
                        SizedBox(height: 7),
                        Text("-- Organized By ${eventOrganizer}"),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Text(eventDate)
                          ],
                        ),
                        // SizedBox(height: 7),
                        // Text("-- Description By ${eventDescription}"),
                        // // SizedBox(height: 7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
