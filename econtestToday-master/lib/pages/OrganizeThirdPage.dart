import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Photos category",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(child: Icon(Icons.edit), padding: const EdgeInsets.all(10.0))
        ],
      ),
      body: Column(
        children: [
          Image.network("https://europamundoblog.com/wp-content/uploads/02.png",
              fit: BoxFit.cover),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Thank you for Organizing  contest!!!!",
              style: TextStyle(
                  fontFamily: "Lato",
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Your request is in under review. We shall get back to you very soon through the contact details you have provide.",
            style: TextStyle(
                fontFamily: "Lato",
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                "Ok",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18),
              ),
            ),
            onPressed: null,
            color: Colors.black,
          )
        ],
      ),
    ));
  }
}
