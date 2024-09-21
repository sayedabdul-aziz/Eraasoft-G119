import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: getTitleTextStyle(context),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is DeleteFromWishlistLoadingState ||
              state is GetWishlistLoadingState) {
            showLoadingDialog(context);
          } else if (state is DeleteFromWishlistLoadedState) {
            Navigator.pop(context);
            context.read<HomeBloc>().add(GetWishlistEvent());
          } else if (state is GetWishlistLoadedState ||
              state is GetWishlistEmptyState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is GetWishlistEmptyState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.not_interested_rounded,
                    size: 100,
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Text('Wishlist is empty', style: getBodyTextStyle(context)),
                ],
              ),
            );
          } else if (state is GetWishlistLoadedState) {
            var wishlist =
                context.read<HomeBloc>().getWishlistResponseModel.data?.data;
            return Padding(
              padding: const EdgeInsets.all(22),
              child: ListView.separated(
                itemCount: wishlist?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: wishlist?[index].image ?? '',
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
                                    wishlist?[index].name ?? '',
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
                                          RemoveFromWishlistEvent(
                                              wishlist?[index].id ?? 0));
                                    },
                                    iconSize: 16,
                                    padding: const EdgeInsets.all(2),
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                            const Gap(5),
                            Text(
                              '\$${wishlist?[index].price}',
                              style: getBodyTextStyle(context),
                            ),
                            const Gap(20),
                            CustomButton(text: 'Add to cart', onTap: () {}),
                            const Gap(10),
                          ],
                        ),
                      )
                    ],
                  );
                },
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
