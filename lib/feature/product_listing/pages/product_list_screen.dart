import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/core/product/domain/entity/product_list_item_entity.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_bloc.dart';
import 'package:neostore/feature/product_detail/controller/product_detail_event.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_bloc.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_event.dart';
import 'package:neostore/feature/product_listing/controller/product_listing_state.dart';
import 'package:neostore/utils/app_router.dart';
import 'package:neostore/utils/constants.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _scrollController.addListener(() {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger &&
          !context.read<ProductListingBloc>().productEnded) {
        context.read<ProductListingBloc>().add(FetchMoreProductsListEvent());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<ProductListingBloc>().productCategory,
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
      body: BlocBuilder<ProductListingBloc, ProductListingState>(
          builder: (context, state) {
        if (state is ProductListFetchSuccessState) {
          return ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return _buildListTile(product: product);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 3,
                );
              },
              itemCount: state.products.length);
        } else if (state is ProductListRefetchLoadingState) {
          return ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return _buildListTile(product: product);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 3,
                );
              },
              itemCount: state.products.length);
        } else if (state is ProductListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductListFetchFailedState) {
          return Center(
            child: Text(state.failure.message),
          );
        }
        return const Center(
          child: Text("Initial State"),
        );
      }),
    );
  }

  Widget _buildListTile({required ProductListItemEntity product}) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to Detail Page
        context
            .read<ProductDetailBloc>()
            .add(ProductDetailFetchEvent(productId: product.id));
        Navigator.pushNamed(context, AppRouter.product_detail);
      },
      child: Container(
        height: 400.h,
        padding: EdgeInsets.all(20.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                product.productImages,
                width: 240.h,
                height: 240.h,
                fit: BoxFit.fill,
                errorBuilder:
                    (BuildContext context, _, StackTrace? stacktrace) =>
                        const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: 20.h,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.w,
                  ),
                  Flexible(
                    child: Text(product.name,
                        overflow: TextOverflow.ellipsis,
                        style: kListTitleTextStyle),
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                  Flexible(
                    child: Text(
                      product.producer,
                      overflow: TextOverflow.ellipsis,
                      style: kListSubTitleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rs.${product.cost}",
                          overflow: TextOverflow.ellipsis,
                          style: kListPriceSubTitle,
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int rate = 1; rate <= 5; rate++)
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.green.withOpacity(
                                      rate <= product.rating ? 1 : 0.5),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
