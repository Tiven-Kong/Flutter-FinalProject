import 'package:bookstore_api/View/ProfileDetail.dart';
import 'package:bookstore_api/View/testing.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us "),
      ),
      body: Stack(

        children: [

          Container(

            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),
          Image.network(
            'https://books33.com/wp-content/uploads/2023/11/author-critics.jpg', // Replace with your image asset


          ),

          Positioned(
            bottom: 300,
            left: 20,
            right: 20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Us!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Name Field
                    Text(
                      "Team Name ",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      "CADT Team",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    // Email Field
                    Text(
                      "E-mail",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      "CADT.Stadent@arunravi.in",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    // Message Field
                    Text(
                      "More Detail",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      "Curernly We still study Year3 in Computer Science at CADT " ,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Floating Action Button
          Positioned(
            bottom:40,
            child: SizedBox(
              width:size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  FloatingActionButton
                    (
                    heroTag: 'facebook',
                    onPressed: (){}  , child: Icon(Icons.facebook),),
                  SizedBox(width: 30,),
                  FloatingActionButton(
                    heroTag: 'telegram',
                    onPressed: (){}  , child: Icon(Icons.telegram),),
                  SizedBox(width: 30,),
                  FloatingActionButton(
                    heroTag: 'tiktok',
                    onPressed: (){}  , child: Icon(Icons.tiktok),)

                ],
              ),
            ),
          ),
    //       Positioned(
    //           top: 20,
    //           child:   IconButton(
    // onPressed: () {
    // Navigator.push(context , MaterialPageRoute(builder: (context)=>tesing())); // Use pop to go back
    // },
    // icon: Icon(Icons.arrow_circle_left),
    // )
    //       )

    ],
      ),
    );
  }
}
