import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookstore_api/model/getdatafromApi.dart';

import '../View/detailpage.dart';

class Seeall extends StatefulWidget {
  Seeall({super.key});

  @override
  State<Seeall> createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  List<dynamic> allBooks = [];    // Stores all books from the API
  List<dynamic> filteredBooks = [];   // Stores filtered books for search
  String searchQuery = "";    // Current search s

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  // Fetch books from the API
  void fetchBooks() async {
    final books = await getBook();
    setState(() {
      allBooks = books;
      filteredBooks = books; // Initially, show all books
    });
  }

  // Filter books based on search query
  void filterBooks(String query) {
    setState(() {
      searchQuery = query;
      filteredBooks = allBooks
          .where((book) =>
          book["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search books...",
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: filterBooks,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: filteredBooks.isEmpty
            ? Center(
          child: Text("No books found."),
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
          ),
          itemCount: filteredBooks.length,
          itemBuilder: (context, index) {
            final book = filteredBooks[index];
            return SizedBox(
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          book["book_url"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(book["title"],
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Text(book["price"],
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
