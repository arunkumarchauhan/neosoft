import 'package:neostore/core/orders/data/dto/order_detail_metadata_dto.dart';
import 'package:neostore/core/orders/data/dto/order_detail_response_dto.dart';
import 'package:neostore/core/orders/data/dto/order_list_response_dto.dart';
import 'package:neostore/core/orders/domain/entity/order_detail_metadata_entity.dart';
import 'package:neostore/core/orders/domain/entity/order_list_item_entity.dart';

class OrderMapper {
  static List<OrderListItemEntity> mapOrderListResponseDtoToOrderListItemEntity(
      OrderListResponseDto dto) {
    return dto.orderDtoList!
        .map((e) => OrderListItemEntity.fromMap(e.toMap()))
        .toList();
  }

  static OrderDetailMetaDataEntity
      mapOrderDetailResponseDtoToOrderDetailMetaDataEntity(
          OrderDetailResponseDto dto) {
    return OrderDetailMetaDataEntity.fromMap(
        dto.orderDetailResponseDto!.toMap());
  }
}
