import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_bloc.dart';
import 'package:neostore/presentation/my_order/controller/order_detail/order_detail_events.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_bloc.dart';
import 'package:neostore/presentation/my_order/controller/order_list/order_list_state.dart';
import 'package:neostore/presentation/my_order/model/order_item.dart';
import 'package:neostore/utils/app_router.dart';
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
      body: BlocBuilder<OrderListingBloc, OrderListingState>(
          builder: (BuildContext context, OrderListingState state) {
        if (state is OrdersListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderListFetchSuccessState) {
          final orders = state.orders;
          return ListView.separated(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildOrderListTile(orders[index], context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  color: kLightGreyColor,
                );
              });
        } else if (state is OrderListFetchFailedState) {
          return Center(
            child: Text(
              state.failure.message,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return Container();
      }),
    );
  }

  ListTile _buildOrderListTile(OrderItem order, BuildContext context) {
    return ListTile(
      onTap: () {
        BlocProvider.of<OrderDetailBloc>(context)
            .add(FetchOrderDetailEvent(orderId: order.id!));
        Navigator.pushNamed(context, AppRouter.order_detail);
      },
      title: Text(
        "Order ID : ${order.id}",
        style: TextStyle(
            fontFamily: "Gotham",
            fontSize: 17,
            color: k1c1c1cColor,
            fontWeight: FontWeight.w500),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          "Order Date: ${order.created}",
          style: TextStyle(
              fontSize: 17,
              color: k4f4f4fColor,
              fontFamily: "Gotham",
              fontWeight: FontWeight.w100),
        ),
      ),
      trailing: Text(
        "${formatCurrencyRupeesSymbol.format(order.cost)} ",
        style: TextStyle(
          fontFamily: "Gotham",
          fontWeight: FontWeight.w100,
          color: k333333Color,
          fontSize: 20,
        ),
      ),
    );
  }
}
