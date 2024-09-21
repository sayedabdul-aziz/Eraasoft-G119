import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/cart/presentation/page/checkout_view.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getTitleTextStyle(context),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is DeleteFromCartLoadingState ||
              state is UpdateCartLoadingState ||
              state is GetCartLoadingState) {
            showLoadingDialog(context);
          } else if (state is DeleteFromCartLoadedState ||
              state is UpdateCartLoadedState) {
            Navigator.pop(context);
            context.read<HomeBloc>().add(GetCartEvent());
          } else if (state is GetCartLoadedState ||
              state is GetCartEmptyState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is GetCartEmptyState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Text('Cart is empty', style: getBodyTextStyle(context)),
                ],
              ),
            );
          } else if (state is GetCartLoadedState) {
            var cartItems =
                context.read<HomeBloc>().getCartResponseModel.data?.cartItems;
            return Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems?.length ?? 0,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    cartItems?[index].itemProductImage ?? '',
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          cartItems?[index].itemProductName ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: getBodyTextStyle(context),
                                        ),
                                      ),
                                      IconButton.outlined(
                                          constraints: const BoxConstraints(
                                              maxWidth: 24, maxHeight: 24),
                                          onPressed: () {
                                            context.read<HomeBloc>().add(
                                                RemoveFromCartEvent(
                                                    cartItems?[index].itemId ??
                                                        0));
                                          },
                                          iconSize: 16,
                                          padding: const EdgeInsets.all(2),
                                          icon: const Icon(Icons.close))
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    '\$${cartItems?[index].itemProductPriceAfterDiscount}',
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Gap(20),
                                  // update quantity
                                  Row(
                                    children: [
                                      FloatingActionButton.small(
                                          heroTag:
                                              '${cartItems?[index].itemId}Add',
                                          elevation: 0,
                                          backgroundColor:
                                              AppColors.accentColor,
                                          onPressed: () {
                                            if ((cartItems?[index]
                                                        .itemQuantity ??
                                                    0) >
                                                1) {
                                              {
                                                context.read<HomeBloc>().add(
                                                    UpdateCartEvent(
                                                        cartItemId:
                                                            cartItems?[index]
                                                                    .itemId ??
                                                                0,
                                                        quantity: (cartItems?[
                                                                        index]
                                                                    .itemQuantity ??
                                                                0) -
                                                            1));
                                              }
                                            }
                                          },
                                          child: const Icon(Icons.remove)),
                                      const Gap(10),
                                      Text(
                                        cartItems?[index]
                                                .itemQuantity
                                                .toString() ??
                                            '0',
                                        style: getBodyTextStyle(context),
                                      ),
                                      const Gap(10),
                                      FloatingActionButton.small(
                                          heroTag:
                                              '${cartItems?[index].itemId}Remove',
                                          elevation: 0,
                                          backgroundColor:
                                              AppColors.accentColor,
                                          onPressed: () {
                                            if ((cartItems?[index]
                                                        .itemProductStock ??
                                                    0) >
                                                (cartItems?[index]
                                                        .itemQuantity ??
                                                    0)) {
                                              context.read<HomeBloc>().add(
                                                  UpdateCartEvent(
                                                      cartItemId:
                                                          cartItems?[index]
                                                                  .itemId ??
                                                              0,
                                                      quantity: (cartItems?[
                                                                      index]
                                                                  .itemQuantity ??
                                                              0) +
                                                          1));
                                            } else {
                                              showErrorDialog(
                                                  context, 'Out of Stock');
                                            }
                                          },
                                          child: const Icon(Icons.add)),
                                    ],
                                  ),
                                  const Gap(10),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: getBodyTextStyle(context),
                          ),
                          Text(
                            '\$${context.read<HomeBloc>().getCartResponseModel.data?.total ?? 0}',
                            style: getBodyTextStyle(context),
                          ),
                        ],
                      ),
                      const Gap(10),
                      CustomButton(
                          text: 'Checkout',
                          onTap: () {
                            push(
                                context,
                                CheckoutView(
                                  totalPrice: context
                                          .read<HomeBloc>()
                                          .getCartResponseModel
                                          .data
                                          ?.total ??
                                      '0',
                                ));
                          }),
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
