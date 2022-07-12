import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/core/address/domain/entity/address_entity.dart';
import 'package:neostore/feature/address/widgets/address_list_tile.dart';
import 'package:neostore/feature/shared/buttons/red_background_white_text_elevated_button.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

import '../widgets/address_list.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor,
      appBar: AppBar(
        title: Text(
          "Address List",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(
                  color: k333333Color,
                  fontSize: 22,
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AddressList(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 250.h,
                child: RedBackgroundWhiteTextElevatedButton(
                    text: "PLACE ORDER", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
