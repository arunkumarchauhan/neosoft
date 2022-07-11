import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order ID :1587",
          overflow: TextOverflow.ellipsis,
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
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
      ),
      body: ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 4) {
              return _buildTotalWidget();
            }
            return _buildOrderIdListTile();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
              color: kLightGreyColor,
            );
          }),
    );
  }

  ListTile _buildOrderIdListTile() {
    return ListTile(
      leading: SizedBox(
        width: 200.w,
        height: 200.w,
        child: Image.asset(
          "assets/images/slider_img3.jpeg",
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pembroke",
            style: TextStyle(
              fontSize: 17,
              color: k1c1c1cColor,
              fontWeight: FontWeight.w100,
              fontFamily: 'Gotham',
            ),
          ),
          Text(
            "(Sofa)",
            style: TextStyle(
              fontSize: 15,
              color: k6b6b6bColor,
              fontWeight: FontWeight.w100,
              fontFamily: 'Gotham',
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "QTY : 4",
              style: TextStyle(
                fontSize: 13,
                color: k4f4f4fColor,
                fontWeight: FontWeight.w100,
                fontFamily: 'Gotham',
              ),
            ),
            Text(
              "${formatCurrency.format(45.00)} ",
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: k333333Color,
                fontSize: 13,
                fontFamily: 'Gotham',
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildTotalWidget() {
    return Column(
      children: [
        ListTile(
          leading: Text(
            "TOTAL",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: k333333Color,
              fontFamily: 'Gotham',
            ),
          ),
          trailing: Text(
            "${formatCurrency.format(180.00)} ",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: k333333Color,
              fontFamily: 'Gotham',
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: kLightGreyColor,
        )
      ],
    );
  }
}
