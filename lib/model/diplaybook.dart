import 'dart:convert';
import 'getdatafromApi.dart';
import 'package:bookstore_api/View/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DisplayBook extends StatefulWidget {
  const DisplayBook({super.key});

  @override
  State<DisplayBook> createState() => _DisplayBookState();
}

class _DisplayBookState extends State<DisplayBook> {





  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder(future: getBook(), builder:(context , snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child:CircularProgressIndicator(),);
        }
    if (snapshot.hasError) {
      return Center(
        child: Text("Error loading books. Please try again."),
      );
    }
        return SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:snapshot.data!.length < 8 ? snapshot.data!.length : 8,
            itemBuilder: (context , index){
              var information = snapshot.data![index];

              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detailpage(information_book:information)));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 170, // Specify height for the image container
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight:Radius.circular(20) ),
                          child: Image.network(
                            snapshot.data![index]["book_url"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height:100 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index]["title"] , style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontWeight: FontWeight.bold)),),
                                Text(snapshot.data![index]["price"] , style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },

          ),
        );
    }
      );

  }
}
