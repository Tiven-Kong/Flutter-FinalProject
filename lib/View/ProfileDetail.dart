import 'dart:convert';

import 'package:bookstore_api/View/Editprofile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:bookstore_api/model/getdatafromApi.dart';

class Profiledetail extends StatefulWidget {
  const Profiledetail({super.key});

  @override
  State<Profiledetail> createState() => _ProfiledetailState();
}

TextEditingController name = TextEditingController()  ;







class _ProfiledetailState extends State<Profiledetail> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(future: getDetail(), builder:(context , snapshot){
     if(snapshot.connectionState==ConnectionState.waiting){
       return Center(
         child:CircularProgressIndicator(),
       );

     }
     return ListView.builder(
       itemCount: snapshot.data?.length,
       itemBuilder: (context , index){
         return Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 10),
               child: Row(
                 children: [
                   CircleAvatar(
                       radius: 25,
                       child: IconButton(onPressed: (){
                         Navigator.pop(context);
                       }, icon:Icon(Icons.backspace))),
                 ],
               ),
             ),
             SizedBox(height: 50,),
             CircleAvatar(
               radius: 75,
               backgroundColor: Colors.blue[100],
               child: CircleAvatar(
                 radius: 70,
                   backgroundImage: NetworkImage("${snapshot.data?[index]["profile_url"]}")),
               
             ),
             SizedBox(
               height: 100,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: Container(
                 decoration: BoxDecoration(border: Border.all(color: Colors.black38 , width: 1  ,) , borderRadius: BorderRadius.circular(10) ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Text("Email", style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontWeight: FontWeight.bold ,  )),) ,
                       Text("${snapshot.data?[index]["email"]}"),

                     ],
                   ),
                 ),
               ),
             ), SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: Container(
                 decoration: BoxDecoration(border: Border.all(color: Colors.black38 , width: 1  ,) , borderRadius: BorderRadius.circular(10) ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Name", style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontWeight: FontWeight.bold ,  )),) ,
                       Text("${snapshot.data?[index]["name"]}"),

                     ],
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: Container(
                 decoration: BoxDecoration(border: Border.all(color: Colors.black38 , width: 1  ,) , borderRadius: BorderRadius.circular(10) ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("PhoneNumber", style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontWeight: FontWeight.bold ,  )),) ,
                       Text("${snapshot.data?[index]["phone"]}"),

                     ],
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 70,
             ),


             ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile(update: snapshot.data?[index])));
             }, child:Text("Edit Profile" , style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontWeight: FontWeight.bold)),))

           ],
         ) ;
       },
     );
    }
      )
    );
  }
}
