import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_state.dart';
import 'package:bookia_app/feature/home/presentation/page/book_details/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooksWidget extends StatefulWidget {
  const BestSellerBooksWidget({
    super.key,
  });

  @override
  State<BestSellerBooksWidget> createState() => _BestSellerBooksWidgetState();
}

class _BestSellerBooksWidgetState extends State<BestSellerBooksWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBestSellersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Seller', style: getTitleTextStyle(context)),
          const Gap(15),
          BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  current is GetBestSellersSuccessState ||
                  current is GetBestSellersLoadingState,
              builder: (context, state) {
                if (state is GetBestSellersSuccessState) {
                  // var books = state.bestSellerResponseModel.data?.products;
                  var books = context
                      .read<HomeBloc>()
                      .bestSellerResponseModel
                      .data
                      ?.products;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: books?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          push(
                              context,
                              BookDetailsView(
                                product: books?[index],
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondaryColor,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: books?[index].id ?? '',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: books?[index].image ?? '',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error,
                                              color: AppColors.textColor),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Text(
                                books?[index].name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: getBodyTextStyle(context),
                              ),
                              const Gap(15),
                              Row(
                                children: [
                                  Text(
                                    '\$${books?[index].price}',
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Spacer(),
                                  CustomButton(
                                      height: 30,
                                      width: 75,
                                      color: AppColors.textColor,
                                      text: 'Buy',
                                      radius: 4,
                                      textStyle: getSmallTextStyle(context,
                                          color: AppColors.whiteColor),
                                      onTap: () {}),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
