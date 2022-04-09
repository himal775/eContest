// Creating Model to store data in firebase

class EventModel {
  late String eventName;
  late String eventImage;
  late String eventDate;
  late String eventOrganizer;
  late String eventDescription;

  EventModel({
    required this.eventName,
    required this.eventImage,
    required this.eventDate,
    required this.eventOrganizer,
    required this.eventDescription
  });

  

}