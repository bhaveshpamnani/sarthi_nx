import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsarthi/product/all_products/all_products.dart';
import 'package:newsarthi/store/category_tab.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../common/widgets/appbar/tabbar.dart';
import '../common/widgets/custom_shapes/container/search_container.dart';
import '../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/product/cart/cart_menu_icon.dart';
import '../common/widgets/text/section_heading.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          leading: Icon(
            CupertinoIcons.back,
            color: dark ? Colors.white : Colors.black,
            size: SSizes.xl - 5,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SCartCounter(),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: dark ? SColors.black : SColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(
                    SSizes.defaultSpace,
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ///--Searchbar
                      const SizedBox(
                        height: SSizes.spaceBtwItems,
                      ),
                      const SSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        shoeBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),

                      ///--Featured brands
                      SSectionHeading(
                        title: 'Featured brands',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProductScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 1.5,
                      ),

                      SGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const SBrandCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                ///--Tabs
                bottom: const STabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronic'),
                    ),
                    Tab(
                      child: Text('Cloths'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
