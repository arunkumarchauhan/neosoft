import 'package:neostore/datasources/dto/order_detail/order_detail_metadata_dto.dart';
import 'package:neostore/datasources/dto/order_detail/order_detail_response_dto.dart';
import 'package:neostore/datasources/dto/order_list/order_list_response_dto.dart';
import 'package:neostore/domain/entity/order/order_detail_metadata_entity.dart';
import 'package:neostore/domain/entity/order/order_list_item_entity.dart';

// class OrderMapper {
//   static List<OrderListItemEntity> mapOrderListResponseDtoToOrderListItemEntity(
//       OrderListResponseDto dto) {
//     return dto.orderDtoList!
//         .map((e) => OrderListItemEntity.fromMap(e.toMap()))
//         .toList();
//   }
//
//   static OrderDetailMetaDataEntity
//       mapOrderDetailResponseDtoToOrderDetailMetaDataEntity(
//           OrderDetailResponseDto dto) {
//     return OrderDetailMetaDataEntity.fromMap(
//         dto.orderDetailResponseDto!.toMap());
//   }
// }

extension OrderListItemMapper on OrderListResponseDto {
  List<OrderListItemEntity> mapToEntity() {
    return orderDtoList!
        .map((e) => OrderListItemEntity.fromMap(e.toMap()))
        .toList();
  }
}

extension OrderDetailMapper on OrderDetailResponseDto {
  OrderDetailMetaDataEntity mapToEntity() {
    return OrderDetailMetaDataEntity.fromMap(orderDetailResponseDto!.toMap());
  }
}
