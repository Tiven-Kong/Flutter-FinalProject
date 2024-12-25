import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../View/detailpage.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key, required this.favorite_item});

  final List<dynamic> favorite_item;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: widget.favorite_item.length,
        itemBuilder: (context, index) {
          final book = widget.favorite_item[index];
          return SizedBox(
            height: 200,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailpage(information_book: widget.favorite_item[index])));
              },
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
            ),
          );
        },
      ),
    );
  }
}
