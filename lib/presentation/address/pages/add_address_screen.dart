import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/presentation/shared/buttons/red_background_white_text_elevated_button.dart';
import 'package:neostore/presentation/shared/textfield/base_text_form_field.dart';
import 'package:neostore/utils/colors.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);
  TextEditingController _textAddressController = TextEditingController();
  TextEditingController _textCityController = TextEditingController();
  TextEditingController _textLandmarkController = TextEditingController();
  TextEditingController _textStateController = TextEditingController();
  TextEditingController _textZipController = TextEditingController();
  TextEditingController _textCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      appBar: AppBar(
        title: Text(
          "Add Address",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ADDRESS",
              style: TextStyle(
                color: k333333Color,
                fontFamily: "Gotham",
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            Container(
              color: Colors.white,
              height: 140,
              margin: const EdgeInsets.only(top: 20),
              child: BaseTextFormField(
                controller: _textAddressController,
                textColor: k333333Color,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "LANDMARK",
              style: TextStyle(
                color: k333333Color,
                fontFamily: "Gotham",
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            Container(
              color: Colors.white,
              height: 55,
              margin: const EdgeInsets.only(top: 20),
              child: BaseTextFormField(
                controller: _textLandmarkController,
                textColor: k333333Color,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTextInputColumn(
                    text: "CITY", textEditingController: _textCityController),
                _buildTextInputColumn(
                    text: "STATE", textEditingController: _textStateController),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTextInputColumn(
                    text: "ZIPCODE", textEditingController: _textZipController),
                _buildTextInputColumn(
                    text: "COUNTRY",
                    textEditingController: _textCountryController),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 90,
              child: RedBackgroundWhiteTextElevatedButton(
                  text: "SAVE ADDRESS", onPressed: () {}),
            )
          ],
        )),
      )),
    );
  }

  Column _buildTextInputColumn({
    required String text,
    required TextEditingController textEditingController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: k333333Color,
            fontFamily: "Gotham",
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          color: Colors.white,
          height: 55,
          width: 450.w,
          child: BaseTextFormField(
            controller: textEditingController,
          ),
        ),
      ],
    );
  }
}
