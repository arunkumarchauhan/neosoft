import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/domain/entity/product/product_detail_entity.dart';
import 'package:neostore/presentation/product_detail/model/product.dart';
import 'package:neostore/utils/colors.dart';
import 'package:neostore/utils/constants.dart';

class ProductDetailCardWidget extends StatefulWidget {
  const ProductDetailCardWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailCardWidget> createState() =>
      _ProductDetailCardWidgetState();
}

class _ProductDetailCardWidgetState extends State<ProductDetailCardWidget> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _selectedImageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${formatCurrency.format(widget.product.cost)}",
              style: kListPriceSubTitle,
            ),
            Icon(
              Icons.share,
              size: 23,
              color: k7f7f7fColor,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 20.h),
          child: SizedBox(
            height: 534.h,
            child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                itemCount: widget.product.productImages.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.product.productImages[index].image!,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, _, stackTrace) => const Center(
                      child: Text("Image Could Not be Loaded"),
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 207.h,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.product.productImages.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  _scrollController.animateTo(
                      index * (_scrollController.position.maxScrollExtent / 4),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 235.w,
                  height: 207.h,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: index == _selectedImageIndex
                        ? Colors.black
                        : Colors.grey,
                  ),
                  child: Image.network(
                    widget.product.productImages[index].image!,
                    fit: BoxFit.fitHeight,
                    width: 230.w,
                    height: 200.h,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
