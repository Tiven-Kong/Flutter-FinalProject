import 'dart:convert';
import 'package:bookstore_api/View/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ProfileDetail.dart';
import 'package:http/http.dart' as http ;


class Editprofile extends StatefulWidget {
   Editprofile({super.key , required this.update});
  Map update ;

  @override
  State<Editprofile> createState() => _EditprofileState();
}





class _EditprofileState extends State<Editprofile> {
  TextEditingController _profile_url = TextEditingController() ;
  TextEditingController _name = TextEditingController() ;
  TextEditingController _email = TextEditingController() ;
  TextEditingController _phone  = TextEditingController() ;
  final _keyform =GlobalKey<FormState>();

  Future<void> updateData(String id) async {
    final updateinformation  = await http.put(Uri.parse("http://localhost:3000/ProfileDetail/${id}"),
      body: jsonEncode({
        "profile_url" :_profile_url.text ,
        "name":_name.text ,
        "email":_email.text ,
        "phone":_phone.text ,
      }


      ),

    );
    if(updateinformation.statusCode==200){
      print("Update success") ;
    }
    else{
      print(updateinformation.statusCode) ;
    }

  }
@override
  void initState() {
    _name.text=widget.update["name"];
    _email.text=widget.update["email"];
    _phone.text=widget.update["phone"];
    _profile_url.text=widget.update["profile_url"];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _keyform,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage()));
                    }, icon: Icon(Icons.backspace)),
                  ],

                ),
                SizedBox(height: 70,),
                Column(

                  children: [
                    Text("Edit your Profile" , style: GoogleFonts.abrilFatface(textStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 30  , color: Colors.blue[300])),),

                    SizedBox(height: 40,),
                    TextFormField(
                      controller: _profile_url,
                      decoration: InputDecoration(
                          hintText: 'Please input your Profile_Url',
                          border: OutlineInputBorder()     ,
                          label: Text("Image_url")

                      ),
                      validator:(value) {
                        if (value == null || value.isEmpty) {
                          return "Should be some Image_Url";
                        }
                      }

                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                            hintText: 'Please input your Name',
                            border: OutlineInputBorder()     ,
                            label: Text("Name")

                        ),
                        validator:(value) {
                          if (value == null || value.isEmpty) {
                            return "Title should be add Some Text";
                          }
                        }

                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: 'Please input The email',
                            border: OutlineInputBorder()     ,
                            label: Text("Email")

                        ),
                        validator:(value) {
                          if (value == null || value.isEmpty) {
                            return "Title should be add Some Text";
                          }
                        }

                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(
                            hintText: 'Please input The Phone number',
                            border: OutlineInputBorder()     ,
                            label: Text("Phone Number ")

                        ),
                        validator:(value) {
                          if (value == null || value.isEmpty) {
                            return "Title should be add Some Number";
                          }
                        }

                    ),
                    SizedBox(height: 30,),
                   Row(
                     children: [
                       Expanded(
                         child: ElevatedButton(
                           onPressed: () {
                             if (_keyform.currentState!.validate()) {
                               updateData(widget.update["id"]);
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Profiledetail()));

                             }

                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.blue[300]
                           ),
                           child: Text(
                             "Change It",
                             style: GoogleFonts.abel(
                               textStyle: TextStyle(
                                 fontWeight: FontWeight.bold,fontSize: 20
                               ),
                             ),
                           ),
                         ),
                       ),

                     ],
                   )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
