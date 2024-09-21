import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/back_btn_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/data/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButtonWidget(),
            GestureDetector(
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(AddToWishlistEvent(productId: product?.id ?? 0));
                },
                child: SvgPicture.asset('assets/icons/Bookmark.svg')),
          ],
        ),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AddToWishlistLoadedState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.primaryColor,
                content: Text('Added to wishlist successfully'),
              ),
            );
          } else if (state is AddToCartLoadedState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.primaryColor,
                content: Text('Added to cart successfully'),
              ),
            );
          } else if (state is AddToWishlistLoadingState ||
              state is AddToCartLoadingState) {
            showLoadingDialog(context);
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(10),
                        Hero(
                          tag: product?.id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: product?.image ?? '',
                              fit: BoxFit.cover,
                              width: 250,
                              errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: AppColors.textColor),
                            ),
                          ),
                        ),
                        const Gap(15),
                        Text(
                          product?.name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getHeadlineTextStyle(context),
                        ),
                        const Gap(10),
                        Text(
                          product?.category ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyTextStyle(context,
                              color: AppColors.primaryColor),
                        ),
                        const Gap(10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur kaskasda lasjda ;l ajlka das adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          textAlign: TextAlign.justify,
                          style: getBodyTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(15),
                Row(
                  children: [
                    Text(
                      '\$${product?.price}',
                      style: getTitleTextStyle(context),
                    ),
                    const Spacer(),
                    CustomButton(
                        width: 250,
                        color: AppColors.textColor,
                        text: 'Add to cart',
                        onTap: () {
                          context
                              .read<HomeBloc>()
                              .add(AddToCartEvent(productId: product?.id ?? 0));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
