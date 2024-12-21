import 'package:flutter/material.dart';

import '../../../../../utlis/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: HeadingTwo(data: AppString.settingAbout),),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(sizeH*.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingThree(data: 'About Us'),
              SizedBox(height: sizeH*.02,),
              Container(
                width: double.infinity,
                height: sizeH*.77,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:  EdgeInsets.all(sizeH*.016),
                child: SingleChildScrollView(
                    child: HeadingThree(
                        data: AppString.policy)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
