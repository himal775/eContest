 import 'package:econtest/pages/single_product.dart';
import 'package:econtest/pages/take_part.dart';
import 'package:econtest/providers/event_provider.dart';
import 'package:econtest/widgets/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EventOverview extends StatelessWidget {

  // creating model for storing data
  final String eventName;
  final String eventImage;
  final String eventDescription;
  final String eventOrganizer;
  final String eventDate;

  //Creating Constructor
  EventOverview({
    required this.eventName, 
    required this.eventImage, 
    required this.eventDescription, 
    required this.eventOrganizer, 
    required this.eventDate
    });

    // provider to access data in system
   late EventProvider eventProvider;
  @override
  Widget _buildWritingEvent(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Text("Other Content")
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: eventProvider.getWritingContestList.map(
            (writingContestList) {
              return SingalProduct (
                  onTap: () {}
                  , 
                  eventImage: writingContestList.eventImage,
                  eventName: writingContestList.eventName,
                  eventDate: writingContestList.eventDate,
                  eventOrganizer: writingContestList.eventOrganizer,
                  eventDescription: writingContestList.eventDescription,
                  );
            },
          ).toList(),
        
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
 eventProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          
           icon: Icon(Icons.arrow_back),
           color: Colors.black,
           onPressed: (){
             
            //  Navigate to HomeScreen
            Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyBottomNavBar()));
           },
         ),
        centerTitle: true,
        title: Text("Event Detail",
        style: TextStyle(
          color: Colors.black,  
          fontWeight: FontWeight.w700,        
        ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10, 
              ),
              Text(
                "Writing Contest",
                textAlign:TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
                
                ),
              Container(
                height: 250,
                child: Image.network(eventImage),
                
              ),
      
              ListTile(
                title: Text(eventName,
                textAlign: TextAlign.center,
                ),
                subtitle: Text("Organized By $eventOrganizer",
                            textAlign: TextAlign.center,
      ),
              ),
              Text("Description: $eventDescription"),
              Text("Date of Event : $eventDate"),
              
              TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TakePartScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
              color: Colors.grey[800],
      
          ),
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          
          child: Text("Take Part",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white
          ),),
        ),
      ),
      Column(
        children: [
          _buildWritingEvent(context)

        ]

      )
            ]
          
          ),
        ),
        
      ),

      

    );
  }
}