import 'package:flutter/material.dart';
import 'package:bookstore_api/model/promotionModel.dart';



class PromotionBook extends StatefulWidget {
  PromotionBook({super.key});

  @override
  State<PromotionBook> createState() => _PromotionBookState();
}

class _PromotionBookState extends State<PromotionBook> {
int SelectPageIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return
     Builder(
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Stack(

              alignment: Alignment.bottomCenter,
              children:[
                PageView(
                  onPageChanged: (index) {
                    setState(() {
                      SelectPageIndex = index;
                    });
                  },
                children:Promotion_image.map((item)=>ClipRRect(
                    child: Image.network(item.image))).toList() ,
              ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                     Promotion_image.length,
                          (i) => Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 10,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: i == SelectPageIndex
                                ? BorderRadius.circular(20)
                                : null,
                            color: i == SelectPageIndex ? Colors.red : Colors.blueAccent,
                            shape: i != SelectPageIndex
                                ? BoxShape.circle
                                : BoxShape.rectangle),
                      )),
                )]
            ),
          );
        }
      );

  }
}
