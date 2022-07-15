import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:neostore/domain/entity/cart/cart_list_item_meta_entity.dart';
import 'package:neostore/presentation/cart/controller/cart_list_bloc.dart';
import 'package:neostore/presentation/cart/controller/cart_list_states.dart';
import 'package:neostore/presentation/cart/model/cart_item_meta.dart';
import 'package:neostore/presentation/shared/appbar/build_appbar_with_title_back_and_search_button.dart';
import 'package:neostore/presentation/shared/buttons/red_background_white_text_elevated_button.dart';
import 'package:neostore/utils/colors.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({Key? key}) : super(key: key);
  var items = List.generate(10, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbarWithTitleBackAndSearchButton(
        context: context,
        title: "My Cart",
      ),
      body: BlocBuilder<CartListBloc, CartListState>(
          builder: (BuildContext context, CartListState state) {
        debugPrint(state.toString());
        if (state is CartListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartListFetchFailedState) {
          return Center(
            child: Text(
              state.failure.message,
              style: const TextStyle(color: Colors.red, fontFamily: "Gotham"),
            ),
          );
        } else if (state is CartListFetchSuccessfulState) {
          if (state.cart.productMetaEntity != null &&
              state.cart.productMetaEntity!.isNotEmpty) {
            final cart = state.cart;
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (index == cart.productMetaEntity!.length) {
                    return _buildCartTotalColumn();
                  } else {
                    final cartItem = cart.productMetaEntity![index];
                    return _buildSlidableWidget(index, cartItem);
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    color: kLightGreyColor,
                  );
                },
                itemCount: cart.productMetaEntity!.length + 1);
          } else {
            return const Center(
              child: Text(
                "Your cart is Empty",
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            );
          }
        }
        return const Center(
          child: Text("Nothing to Show"),
        );
      }),
    );
  }

  Column _buildCartTotalColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          leading: Text(
            "TOTAL",
            style: TextStyle(
              color: k333333Color,
              fontFamily: "Gotham",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          trailing: Text(
            "Rs. 180.00",
            style: TextStyle(
              color: k333333Color,
              fontFamily: "Gotham",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: kLightGreyColor,
        ),
        const SizedBox(
          height: 15,
        ),
        RedBackgroundWhiteTextElevatedButton(
          text: "ORDER NOW",
          onPressed: () {},
        ),
      ],
    );
  }

  Slidable _buildSlidableWidget(int index, CartItemMeta item) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SizedBox(
            width: 80,
          ),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
      child: ListTile(
        leading: Image.network(
          item.product!.productImages!,
          // width: 300.w,
          // height: 300.w,
          errorBuilder: (error, _, stackTrace) => const Center(
            child: Icon(
              Icons.error,
              size: 40,
              color: Colors.red,
            ),
          ),
          fit: BoxFit.fitHeight,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.product!.name!,
              style: TextStyle(
                color: k1c1c1cColor,
                fontSize: 23,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "(${item.product!.productCategory})",
              style: TextStyle(
                color: k4f4f4fColor,
                fontSize: 15,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.w100,
              ),
            ),
            QuantityDropDownButton(
              items: items,
              quantity: item.quantity!,
            )
          ],
        ),
      ),
    );
  }
}

class QuantityDropDownButton extends StatefulWidget {
  const QuantityDropDownButton(
      {Key? key, required this.items, required this.quantity})
      : super(key: key);
  final int quantity;
  final List<int> items;

  @override
  State<QuantityDropDownButton> createState() => _QuantityDropDownButtonState();
}

class _QuantityDropDownButtonState extends State<QuantityDropDownButton> {
  int _selectedValue = 1;
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
                color: kLightGreyColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: DropdownButton(
              onChanged: (int? index) {
                if (index != null) {
                  setState(() {
                    _selectedValue = index;
                  });
                }
              },
              value: _selectedValue,
              items: widget.items
                  .map((e) => DropdownMenuItem<int>(
                      value: e, child: Text(e.toString())))
                  .toList(),
            ),
          ),
          Text(
            "Rs 45.0",
            style: TextStyle(
              color: k4f4f4fColor,
              fontSize: 15,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
