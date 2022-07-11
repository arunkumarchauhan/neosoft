import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_entity.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_metadata_entity.dart';
import 'package:neostore/feature/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/feature/my_order/controller/order_detail/order_detail_states.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order ID :${context.read<OrderDetailBloc>().orderId}",
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
      body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
          builder: (BuildContext context, OrderDetailState state) {
        print(state);
        if (state is OrderDetailLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderDetailFetchSuccessState) {
          final orders = state.order.orderDetails;
          return ListView.separated(
              itemCount: orders!.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == orders.length) {
                  return _buildTotalWidget(state.order);
                } else {
                  return _buildOrderIdListTile(orders[index]);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  color: kLightGreyColor,
                );
              });
        }
        return const Center(
          child: Text(
            "Something Went wrong",
            style: TextStyle(color: Colors.red),
          ),
        );
      }),
    );
  }

  ListTile _buildOrderIdListTile(OrderDetailEntity orderDetail) {
    return ListTile(
      leading: SizedBox(
        width: 200.w,
        height: 200.w,
        child: Image.network(
          orderDetail.prodImage!,
          fit: BoxFit.fitHeight,
          errorBuilder: (error, _, stackTrace) => const Center(
            child: Icon(
              Icons.error,
              size: 40,
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${orderDetail.prodName}",
            style: TextStyle(
              fontSize: 17,
              color: k1c1c1cColor,
              fontWeight: FontWeight.w100,
              fontFamily: 'Gotham',
            ),
          ),
          Text(
            "(${orderDetail.prodCatName})",
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
              "QTY : ${orderDetail.quantity}",
              style: TextStyle(
                fontSize: 13,
                color: k4f4f4fColor,
                fontWeight: FontWeight.w100,
                fontFamily: 'Gotham',
              ),
            ),
            Text(
              "${formatCurrency.format(orderDetail.total)} ",
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

  Column _buildTotalWidget(OrderDetailMetaDataEntity order) {
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
            "${formatCurrency.format(order.cost)} ",
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
