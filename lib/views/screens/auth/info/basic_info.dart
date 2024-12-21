import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';
import '../../../../global widget/global_widget.dart';
import '../../../../utlis/utils.dart';
import '../../../widgets/widgets.dart';
import 'build_pop_up_menu.dart';
import 'text_filed_helper.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  // Controllers for text fields
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final List<Map<String, String>> _countries = [
    {'name': 'Spain', 'flag': 'ES'}, // Spain
    {'name': 'Palestine', 'flag': 'PS'}, // Palestine
    {'name': 'France', 'flag': 'FR'}, // France
    {'name': 'Portugal', 'flag': 'PT'}, // Portugal
    {'name': 'Andorra', 'flag': 'AD'}, // Andorra
    {'name': 'Monaco', 'flag': 'MC'}, // Monaco
    {'name': 'Italy', 'flag': 'IT'}, // Italy
    {'name': 'Algeria', 'flag': 'DZ'}, // Algeria
    {'name': 'Morocco', 'flag': 'MA'}, // Morocco
    {'name': 'Tunisia', 'flag': 'TN'}, // Tunisia
    {'name': 'Lebanon', 'flag': 'LB'}, // Lebanon
    {'name': 'United Kingdom', 'flag': 'GB'}, // United Kingdom
    {'name': 'Switzerland', 'flag': 'CH'}, // Switzerland
    {'name': 'Belgium', 'flag': 'BE'}, // Belgium
    {'name': 'Luxembourg', 'flag': 'LU'}, // Luxembourg
    {'name': 'Netherlands', 'flag': 'NL'}, // Netherlands
    {'name': 'Germany', 'flag': 'DE'}, // Germany
    {'name': 'Liechtenstein', 'flag': 'LI'}, // Liechtenstein
    {'name': 'San Marino', 'flag': 'SM'}, // San Marino
    {'name': 'Sardinia (Italy)', 'flag': 'IT'}, // Sardinia (Italy)
    {'name': 'Malta', 'flag': 'MT'}, // Malta
    {'name': 'Cyprus', 'flag': 'CY'}, // Cyprus
    {'name': 'Egypt', 'flag': 'EG'}, // Egypt
    {'name': 'Jordan', 'flag': 'JO'}, // Jordan
    {'name': 'Syria', 'flag': 'SY'}, // Syria
    {'name': 'Kuwait', 'flag': 'KW'}, // Kuwait
    {'name': 'Iraq', 'flag': 'IQ'}, // Iraq
    {'name': 'Turkey', 'flag': 'TR'}, // Turkey
    {'name': 'Saudi Arabia', 'flag': 'SA'}, // Saudi Arabia
    {'name': 'United Arab Emirates', 'flag': 'AE'}, // UAE
    {'name': 'Oman', 'flag': 'OM'}, // Oman
    {'name': 'Qatar', 'flag': 'QA'}, // Qatar
    {'name': 'Bahrain', 'flag': 'BH'}, // Bahrain
    {'name': 'Afghanistan', 'flag': 'AF'}, // Afghanistan
    {'name': 'Pakistan', 'flag': 'PK'}, // Pakistan
    {'name': 'India', 'flag': 'IN'}, // India
    {'name': 'Armenia', 'flag': 'AM'}, // Armenia
    {'name': 'Georgia', 'flag': 'GE'}, // Georgia
    {'name': 'Azerbaijan', 'flag': 'AZ'}, // Azerbaijan
    {'name': 'Kazakhstan', 'flag': 'KZ'}, // Kazakhstan
    {'name': 'Turkmenistan', 'flag': 'TM'}, // Turkmenistan
    {'name': 'Uzbekistan', 'flag': 'UZ'}, // Uzbekistan
    {'name': 'Kyrgyzstan', 'flag': 'KG'}, // Kyrgyzstan
    {'name': 'Tajikistan', 'flag': 'TJ'}, // Tajikistan
    {'name': 'Mongolia', 'flag': 'MN'}, // Mongolia
    {'name': 'Bangladesh', 'flag': 'BD'}, // Bangladesh
    {'name': 'Sri Lanka', 'flag': 'LK'}, // Sri Lanka
    {'name': 'Nepal', 'flag': 'NP'}, // Nepal
    {'name': 'Bhutan', 'flag': 'BT'}, // Bhutan
    {'name': 'Maldives', 'flag': 'MV'}, // Maldives
    {'name': 'Myanmar', 'flag': 'MM'}, // Myanmar
    {'name': 'China', 'flag': 'CN'}, // China
    {'name': 'South Korea', 'flag': 'KR'}, // South Korea
    {'name': 'North Korea', 'flag': 'KP'}, // North Korea
    {'name': 'Japan', 'flag': 'JP'}, // Japan
    {'name': 'Philippines', 'flag': 'PH'}, // Philippines
    {'name': 'Indonesia', 'flag': 'ID'}, // Indonesia
    {'name': 'Malaysia', 'flag': 'MY'}, // Malaysia
    {'name': 'Singapore', 'flag': 'SG'}, // Singapore
    {'name': 'Australia', 'flag': 'AU'}, // Australia
    {'name': 'New Zealand', 'flag': 'NZ'}, // New Zealand
    {'name': 'Fiji', 'flag': 'FJ'}, // Fiji
    {'name': 'Papua New Guinea', 'flag': 'PG'}, // Papua New Guinea
    {'name': 'Vanuatu', 'flag': 'VU'}, // Vanuatu
    {'name': 'Samoa', 'flag': 'WS'}, // Samoa
    {'name': 'Tonga', 'flag': 'TO'}, // Tonga
    {'name': 'Cook Islands', 'flag': 'CK'}, // Cook Islands
    {'name': 'Marshall Islands', 'flag': 'MH'}, // Marshall Islands
    {'name': 'Nauru', 'flag': 'NR'}, // Nauru
    {'name': 'Palau', 'flag': 'PW'}, // Palau
    {'name': 'Solomon Islands', 'flag': 'SB'}, // Solomon Islands
    {'name': 'Micronesia', 'flag': 'FM'}, // Micronesia
    {'name': 'Kiribati', 'flag': 'KI'}, // Kiribati
    {'name': 'Tuvalu', 'flag': 'TV'}, // Tuvalu
    {'name': 'Malawi', 'flag': 'MW'}, // Malawi
    {'name': 'Zambia', 'flag': 'ZM'}, // Zambia
    {'name': 'Tanzania', 'flag': 'TZ'}, // Tanzania
    {'name': 'Kenya', 'flag': 'KE'}, // Kenya
    {'name': 'Uganda', 'flag': 'UG'}, // Uganda
    {'name': 'Rwanda', 'flag': 'RW'}, // Rwanda
    {'name': 'Burundi', 'flag': 'BI'}, // Burundi
    {'name': 'Mozambique', 'flag': 'MZ'}, // Mozambique
    {'name': 'Zimbabwe', 'flag': 'ZW'}, // Zimbabwe
    {'name': 'Botswana', 'flag': 'BW'}, // Botswana
    {'name': 'South Africa', 'flag': 'ZA'}, // South Africa
    {'name': 'Namibia', 'flag': 'NA'}, // Namibia
    {'name': 'Lesotho', 'flag': 'LS'}, // Lesotho
    {'name': 'Eswatini', 'flag': 'SZ'}, // Eswatini
    {'name': 'Angola', 'flag': 'AO'}, // Angola
  ];




  String _selectedCountry = 'Spain'; //
  // Selected values for dropdowns in Basic Info Tab
  String? _selectedGender;
  String? _selectedActivityLevel;
  String? _selectedCmFtmLevel;
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .018),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeH * .01),
              CustomText(text: "Please select your Gender".tr,),
              SizedBox(height: sizeH * .01),
              // Gender Selection
              buildPopupMenuField(
                ['gender_male', 'gender_female', 'gender_other', 'gender_prefer_not_to_say'],
                selectedValue: _selectedGender?.tr,
                hintText: 'hint_gender',
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(height: sizeH * .02),

              // Age Input
              CustomText(text: "What is your age?".tr,),
              SizedBox(height: sizeH * .01),
              ///=============Name===================
              CustomTextField(
                controller: _ageController,
                hintText: "What is your age?".tr,
                borderColor: AppColors.textFieldBorderColor,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter Age'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: sizeH * .02),

              CustomText(text: "What is your Height?".tr,),
              SizedBox(height: sizeH * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextField
                  Expanded(
                    child: CustomTextField(
                      controller: _heightController,
                      hintText: "176".tr,
                      borderColor: AppColors.textFieldBorderColor,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter Age'.tr;
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(width: 8.w), // Spacer between TextField and Dropdown
                  Expanded(
                    child: buildPopupMenuField(
                      ['cm','ft'],
                      selectedValue: _selectedCmFtmLevel?.tr,
                      hintText: 'cm',
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCmFtmLevel = value;
                        });
                      },
                    ),
                  ),
                  // DropdownButton

                ],
              ),
              SizedBox(height: sizeH * .02),
              // Age Input
              CustomText(text: "Select your activity level".tr,),
              SizedBox(height: sizeH * .01),
              ///=============Name===================
              buildPopupMenuField(
                ['Sedentary ( 0 active days/ week )', 'Light ( 1-3 active days/ week )', 'Moderate ( 3-5 active days/ week )', 'Active ( 5-7 active days/ week )'],
                selectedValue: _selectedActivityLevel?.tr,
                hintText: 'Select your activity level',
                onChanged: (String? value) {
                  setState(() {
                    _selectedActivityLevel = value;
                  });
                },
              ),

              SizedBox(height: sizeH * .02),
                 CustomText(text: "Which country are you from?".tr,),

              SizedBox(height: sizeH * .01),

              Center(
                child: Container(
                  height: 50.h, // Adjust the height here
                  width: 250.w, // Full width
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r), // Rounded corners
                    border: Border.all(color: Colors.grey), // Border styling
                    color: Colors.white, // Background color
                  ),
                  child: DropdownButton<String>(

                    value: _selectedCountry,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry = newValue!;
                      });
                    },
                    underline: SizedBox.shrink(), // Remove the default underline
                    items: _countries.map<DropdownMenuItem<String>>((country) {
                      return DropdownMenuItem<String>(
                        value: country['name'],
                        child: SingleChildScrollView( // Make the content scrollable if needed
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,  // Ensure it only takes up needed space
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Properly space elements
                            crossAxisAlignment: CrossAxisAlignment.center,  // Align items centrally
                            children: [
                              // Country name
                              Text(
                                country['name']!,
                                overflow: TextOverflow.ellipsis,  // Prevent overflow of text
                              ),
                              SizedBox(width: 10.w),  // Space between text and flag
                              // Country flag
                              CountryFlag.fromCountryCode(
                                country['flag']!,
                                width: 24.w,  // Adjust the width of the flag
                                height: 24.h, // Adjust the height of the flag
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Submit Button
              SizedBox(height: sizeH * .04),

              CustomText(text: "You can always fully custom your routine and diet afterwards".tr, maxline: 2,),
              SizedBox(height: sizeH * .01),
              CustomTextButton(
                color: Colors.grey,
                text: "lets_go".tr,  // Translated button text
                onTap: () {
                },
              ),
              SizedBox(height: sizeH * .04),


            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }
}
