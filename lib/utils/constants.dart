import 'package:flutter/material.dart';
import 'package:neostore/utils/colors.dart';
import 'package:intl/intl.dart';

final kBaseUrl = "http://staging.php-dev.in:8844/trainingapp/api";

final kRedButtonTextStyle = TextStyle(
  color: kMainRedColor,
  fontFamily: 'Gotham',
  fontWeight: FontWeight.w500,
  fontSize: 26,
);

final kWhiteButtonTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Gotham',
  fontWeight: FontWeight.w500,
  fontSize: 26,
);

enum Gender { male, female }

final kListTitleTextStyle = TextStyle(
  fontFamily: "Gotham",
  fontWeight: FontWeight.w500,
  fontSize: 15,
  color: HexColor.fromHex("#4F4F4F"),
);

final kListSubTitleTextStyle = TextStyle(
  fontFamily: "Gotham",
  fontWeight: FontWeight.w100,
  fontSize: 10,
  color: HexColor.fromHex("#4F4F4F"),
);
final kListPriceSubTitle = TextStyle(
    color: HexColor.fromHex("#FE4040"),
    fontFamily: 'Gotham',
    fontWeight: FontWeight.w500,
    fontSize: 20);
final kProductDetailTitleTextStyle = TextStyle(
    color: HexColor.fromHex("#262626"),
    fontFamily: 'Gotham',
    fontWeight: FontWeight.w500,
    fontSize: 20);
final kProductDetailSubTitle = TextStyle(
    fontFamily: "Gotham",
    fontWeight: FontWeight.w100,
    fontSize: 16,
    color: HexColor.fromHex("#4F4F4F"));

final kProductDetailDescriptionTitleTextStyle = TextStyle(
  color: HexColor.fromHex("#111111"),
  fontSize: 10,
  fontFamily: "Gotham",
  fontWeight: FontWeight.w500,
);

final productDetailDescriptionBodyTextStyle = TextStyle(
    color: HexColor.fromHex("#333333"),
    fontWeight: FontWeight.w500,
    fontSize: 10,
    fontFamily: "Gotham");

final loremIpsumText =
    """You can use a PageController to control which page is visible in the view. In addition to being able to control the pixel offset of the content inside the PageView, a PageController also lets you control the offset in terms of pages, which are increments of the viewport size.\nou can use a PageController to control which page is visible in the view. In addition to being able to control the pixel offset of the content inside the PageView, a PageController also lets you control the offset in terms of pages, which are increments of the viewport size""";

final formatCurrency = new NumberFormat.simpleCurrency(
    locale: "en_IN", name: "Rs", decimalDigits: 2);
final formatCurrencyRupeesSymbol =
    new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 2);

const kMyAccount = "My Account";
const kMyOrders = "My Orders";
