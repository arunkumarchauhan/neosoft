import 'package:flutter/material.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class MyOrdersListPage extends StatelessWidget {
  const MyOrdersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
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
            return ListTile(
              onTap: () {},
              title: Text(
                "Order ID : 1587",
                style: TextStyle(
                    fontSize: 17,
                    color: k1c1c1cColor,
                    fontWeight: FontWeight.w500),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Order Date: 08 Aug 15",
                  style: TextStyle(
                      fontSize: 17,
                      color: k4f4f4fColor,
                      fontWeight: FontWeight.w100),
                ),
              ),
              trailing: Text(
                "${formatCurrency.format(45.00)} ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: k333333Color,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
              color: kLightGreyColor,
            );
          }),
    );
  }
}
