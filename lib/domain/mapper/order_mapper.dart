import 'package:neostore/domain/entity/order/order_detail_metadata_entity.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';
import 'package:neostore/presentation/my_order/model/order_detail_meta.dart';
import 'package:neostore/presentation/my_order/model/order_item.dart';

extension OrderListMapper on List<OrderListItemEntity> {
  List<OrderItem> mapToPresentation() {
    return map((e) => OrderItem.fromMap(e.toMap())).toList();
  }
}

extension OrderDetailMapper on OrderDetailMetaDataEntity {
  OrderDetailMeta mapToPresentation() {
    return OrderDetailMeta.fromMap(toMap());
  }
}
