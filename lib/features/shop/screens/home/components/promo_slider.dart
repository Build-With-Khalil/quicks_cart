import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home/home_controller.dart';

class QCPromoSlider extends StatelessWidget {
  const QCPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                homeController.updateCarouselIndex(index);
              },
            ),
            items:
                banners.map((url) => QCRoundedImage(imageURL: url)).toList()),
        SizedBox(
          height: QCSizes.sm,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                QCCircularContainer(
                  width: 20,
                  height: 05,
                  margin: EdgeInsets.only(right: QCSizes.xs),
                  backgroundColor:
                      homeController.carouselCurrentIndex.value == i
                          ? QCColors.primary
                          : QCColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
