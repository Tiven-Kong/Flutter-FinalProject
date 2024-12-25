import 'package:bookstore_api/View/AboutUs.dart';
import 'package:bookstore_api/View/ProfileDetail.dart';
import 'package:bookstore_api/View/helpuser.dart';
import 'package:bookstore_api/View/promotionindex.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/diplaybook.dart';
import 'package:bookstore_api/View/ProfileDetail.dart';
import '../model/Seeall.dart';
import 'package:bookstore_api/model/getdatafromApi.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key  , });



  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FutureBuilder(future: getDetail(), builder: (context , snapshort){
            if(snapshort.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 50,
                  width: 120,
                  child: ListView.builder(
                    itemCount: snapshort.data?.length,
                    itemBuilder: (context , index){
                      return
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profiledetail()));
                                  },
                                  child: CircleAvatar(
                                      backgroundImage:
                                      NetworkImage(snapshort.data?[index]["profile_url"])

                                  ),
                                ),
                              ),
                            ),
                          ],
                        );

                    },
                  ),
                ),
              );
            }
          }),
        ],
        leading:Builder(
            builder: (context) {
          return IconButton(
          onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.power_input_outlined));
      }
        )

      ),
      drawer: SafeArea(
        child: Drawer(
          child:Column(
            children: [



              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Seeall()));
                },
                leading:Icon(Icons.search),
                title:Text("Search the book"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Profiledetail()));
                },
                leading:Icon(Icons.person),
                title:Text("Account Settings"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Helpuser()));
                },
                leading:Icon(Icons.help),
                title:Text("Help & Support"),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>AboutUs()));
                },
                leading:Icon(Icons.home),
                title:Text("About Us "),
              ),

            ],
          )

        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
          //           GestureDetector(
          //             onTap: (){
          //               Navigator.push(context, MaterialPageRoute(builder: (context)=>Profiledetail()));
          // },
          //
          //             child: CircleAvatar(
          //               radius: 25,
          //               backgroundImage: NetworkImage(
          //                 "https://media.istockphoto.com/id/1015970570/photo/indoor-portrait-of-young-male-isolated-on-gray-background-in-white-tshirt-with-optimistic.jpg?s=612x612&w=0&k=20&c=hBjkEZWi8Cn8LnxUsPxOscldc-e-ovz3WbTlN_Yxy04=",
          //               ),
          //             ),
          //           ),
                  ],
                ),

                SizedBox(height: 10),
                // Welcome Section
                PromotionBook(),
                SizedBox(height: 20),
                // Popular Books Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Now",
                      style: GoogleFonts.aboreto(
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Seeall()),
                        );
                      },
                      child: Text(
                        "See all",
                        style: GoogleFonts.aboreto(
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Display Book Section
                DisplayBook(),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discover your",
                          style: GoogleFonts.almendra(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Text(
                          "best book now",
                          style: GoogleFonts.almendra(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Find your dream book according to your preferences",
                          style: GoogleFonts.abhayaLibre(color: Colors.grey[700]),
                        ),
                        Text(
                          "and join our family. What are you waiting for?",
                          style: GoogleFonts.abhayaLibre(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
