import 'package:flutter/material.dart';


import '../utlis/custom_text_style.dart';
import 'custom_button.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String title;
  final String title1;
  final Color? textColor;
  final Color? text2Color;
  final String buttonText;
  final VoidCallback onTap;
  final Color? bgColor;
  const CustomCard({
    super.key, required this.img, required this.title, required this.buttonText, required this.onTap, this.bgColor, this.title1 ="" , this.textColor,this.text2Color,
  });

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      height: sizeH * .24,
      child: Stack(
        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(sizeH * .022),
              child: Image.asset(
                img,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Container(decoration:
            BoxDecoration(
                color: Colors.black.withOpacity(0.6),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(sizeH * .02)
            ),),
          Padding(
            padding: EdgeInsets.all(sizeH * .03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizeW*.5,
                  child:   HeadingTwo(data:title,color:  textColor ?? Colors.white,),
                ),
                SizedBox(
                  width: sizeW*.5,
                  child:  HeadingTwo(data:title1 ,color: text2Color ??  Colors.white,fontWeight: FontWeight.w500,),
                ),

                SizedBox(
                    width: sizeW * .5,
                    child: CustomTextButton(
                      color: bgColor,
                      text: buttonText,
                      onTap: onTap,
                      padding: sizeH * .002,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
