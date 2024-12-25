import 'package:bookstore_api/View/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/bottomNavigation.dart';
import '../model/diplaybook.dart';
import '../model/favorith.dart';


class Detailpage extends StatefulWidget {
  Detailpage({super.key, required this.information_book});
  final Map<String, dynamic> information_book; // The book data

  @override
  State<Detailpage> createState() => _DetailpageState();
}

final List<Map<String, dynamic>> favorites = [];

class _DetailpageState extends State<Detailpage> {


  void toggleFavorite(String id) {
    setState(() {

      if (favorites.any((book) => book["id"] == id)) {
        favorites.removeWhere((book) => book["id"] == id);    // Remove it if already in favorites
      } else {
        favorites.add(widget.information_book);      // Add the full book data to favorites
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Image of the book
              Container(
                width: double.infinity,
                height: 500,
                child: Image.network(widget.information_book["book_url"] ?? "", fit: BoxFit.cover),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                        },
                        icon: Icon(Icons.arrow_circle_left, color: Colors.white, size: 40),
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            toggleFavorite(widget.information_book["id"].toString());
                          },
                          icon: Icon(
                            favorites.any((book) => book["id"] == widget.information_book["id"])
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favorites.any((book) => book["id"] == widget.information_book["id"])
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    // Display the book's title and price
                    Text(widget.information_book["title"] ?? "No Title", style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
                    Text(widget.information_book["price"] ?? "No Price", style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purpleAccent))),
                    // ElevatedButton(
                    //   onPressed: () {
                    //
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => FavoritePage(favorite_item: favorites),
                    //       ),
                    //     );
                    //   },
                    //   child: const Text("Let's go"),
                    // ),
                  ],
                ),
                
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 200,
          //   child:  MyBottomNavigationBarPage(),
          // )

        ],
      ),
      floatingActionButton: FloatingActionButton(  onPressed: () {

        Navigator.push(
        context,
         MaterialPageRoute(
             builder: (context) => FavoritePage(favorite_item: favorites),
        ),
        );
         },child: Icon(Icons.favorite),),
    );
  }
}


