import 'package:flutter/material.dart';
import 'package:neostore/domain/entity/address/address_entity.dart';
import 'package:neostore/presentation/address/widgets/address_list_tile.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: AddressEntity.getAddressList().length,
      itemBuilder: (BuildContext context, int index) {
        final model = AddressEntity.getAddressList()[index];
        return AddressListTile(
          address: model,
          onPressed: (value) {
            setState(() {
              _groupValue = value!;
            });
          },
          groupValue: _groupValue,
          value: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
    );
  }
}
