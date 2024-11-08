import 'package:flutter/material.dart';
import 'package:newsarthi/product/popular_products.dart';
import 'package:newsarthi/home/promo_slider.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../common/widgets/text/section_heading.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import 'home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  SHomeAppBar(),
                  SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),

                  ///Searchbar
                  SSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),

                  ///Categories
                  Padding(
                    padding: EdgeInsets.only(
                      left: SSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        SSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: SColors.white,
                        ),
                        SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        SHomeCategories(),
                        SizedBox(
                          height: SSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(SSizes.md),
              child: Column(
                children: [
                  const SPromoSlider(
                    banners: [
                      SImages.banner1,
                      SImages.banner2,
                      SImages.banner3,
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwSections,
                  ),
                  SSectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PopularProducts(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SGridLayout(
                    itemCount: 4,
                    itemBuilder: (BuildContext, int) => const SProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: NavigationMenu(),
    );
  }
}
