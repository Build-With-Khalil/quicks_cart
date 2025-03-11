import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_tab_bar.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/search_container.dart';
import 'package:quicks_cart/common/widgets/layout/grid_layout.dart';
import 'package:quicks_cart/common/widgets/products/carts/cart_counter_icon.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/features/shop/screens/store/components/category_tab.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: QCAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            QCCartCounterIcon(
              onPressed: () {},
              iconColor: dark ? QCColors.light : QCColors.dark,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor:
                    QCHelperFunctions.isDarkMode(context)
                        ? QCColors.black
                        : QCColors.white,
                expandedHeight: 300,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: QCSizes.md,
                    vertical: QCSizes.sm,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: QCSizes.sm),
                      QCSearchContainer(
                        text: "Search In Store",
                        showBorder: true,
                        showBackGround: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: QCSizes.sm),
                      QCSectionHeadings(
                        title: "Featured Brands",
                        onPressed: () {},
                      ),
                      SizedBox(height: QCSizes.sm),
                      QCGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 60,
                        itemBuilder: (context, index) {
                          return QCBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),
                bottom: QcTabBar(
                  tabs: [
                    Tab(text: "Sports"),
                    Tab(text: "Furniture"),
                    Tab(text: "Electronics"),
                    Tab(text: "Clothes"),
                    Tab(text: "Cosmetics"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              QCCategoryTab(),
              QCCategoryTab(),
              QCCategoryTab(),
              QCCategoryTab(),
              QCCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
