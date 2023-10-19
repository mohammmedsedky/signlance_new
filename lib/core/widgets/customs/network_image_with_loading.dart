import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart';
import '../../res/colors.dart';
import 'loading_widget.dart';

class NetworkImageWithLoading extends StatelessWidget {
  final String img;

  const NetworkImageWithLoading({
    Key? key,
    required this.img,
    this.boxFit,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(key: key);
  final BoxFit? boxFit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: ServiceConst.baseUrl + img,
        fit: boxFit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, loadingProgress) {
          return const Center(
            child: LoadingWidget(
              color: KAppColors.primaryColor,
            ),
          );
        },
        errorWidget: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error_outline),
          );
        },
      ),
    );
  }
}
