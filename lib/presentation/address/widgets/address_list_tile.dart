import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/address/address_entity.dart';
import 'package:neostore/utils/colors.dart';

class AddressListTile extends StatelessWidget {
  AddressListTile({
    Key? key,
    required this.address,
    required this.onPressed,
    required this.groupValue,
    required this.value,
  }) : super(key: key);

  Function(int? value) onPressed;
  AddressEntity address;
  int groupValue;
  int value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.5,
              child: Radio<int?>(
                value: value,
                groupValue: groupValue,
                onChanged: (value) => onPressed(value),
                fillColor: MaterialStateProperty.all(kDarkGreyColor),
                activeColor: Colors.yellowAccent,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.white,
              width: 800.w,
              height: 130,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Gotham",
                      fontSize: 25,
                      color: k333333Color,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        address.address,
                        style: TextStyle(
                          color: k8e8e8eColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          right: 5,
          child: IconButton(
              onPressed: () {
                debugPrint("Pressed");
              },
              icon: Icon(
                Icons.cancel,
                color: kLightGreyColor,
                size: 30,
              )),
        )
      ],
    );
  }
}
