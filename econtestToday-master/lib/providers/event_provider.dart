import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:econtest/model/event_model.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier{

  //Using provider and change Notifier

  List <EventModel> writingContestList = [];
  late EventModel eventModel;

  fetchWritingContest() async {
    List<EventModel> newList =[];

    QuerySnapshot value = await FirebaseFirestore.instance.collection("WritingContest").get();

    value.docs.forEach((element) {

      // print(element.data());
      eventModel = EventModel(
        eventImage: element.get("eventImage"),
        eventName: element.get("eventName"),
        eventDate: element.get("eventDate"),
        eventOrganizer: element.get("eventOrganizer"),
        eventDescription: element.get("eventDescription")
      );
      newList.add(eventModel);
    }
    );
    writingContestList = newList;
    notifyListeners();

  }


  List<EventModel> get getWritingContestList{
    return writingContestList;
  }

}