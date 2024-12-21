import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:gimnasio_escorpion/utlis/app_icons.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

import '../../../routes/routes_name.dart';

class ChatScorpion extends StatelessWidget {
  const ChatScorpion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.red[100],
                  child: SvgPicture.asset(
                    AppIcons.chatIcon, // Replace with your scorpion image path
                    fit: BoxFit.contain,
                    height: 60,
                  ),
                ),
                CustomText(text: "Scorpion Gym Bro".tr,fontWeight: FontWeight.w600,),
                const SizedBox(height: 10),
                Text(
                  'Start talking with Gym bro'.tr,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(

                          backgroundColor: Colors.red[100],
                          child: SvgPicture.asset(AppIcons.chatIcon,width: 40,height: 40,)),
                       SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Hey bro, how can I help you today?'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Start your conversation with bro',
                      hintStyle: TextStyle(color: Colors.grey),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.chatScorpionDes,preventDuplicates: false);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
