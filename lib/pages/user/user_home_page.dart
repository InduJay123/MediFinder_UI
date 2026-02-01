import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/cards/top_pharmacy_card.dart';
import 'package:medi_finder_user_home_page/data/category_data.dart';
import 'package:medi_finder_user_home_page/models/pharamcy_model.dart';
import 'package:medi_finder_user_home_page/cards/review_card.dart';
import 'package:medi_finder_user_home_page/data/review_data.dart';
import 'package:medi_finder_user_home_page/models/review_model.dart';
import 'package:medi_finder_user_home_page/common/search_bar.dart';
import 'package:medi_finder_user_home_page/services/pharmacy_service.dart';
import 'package:medi_finder_user_home_page/side_menu/side_menu.dart';
import '../../common/app_bar.dart';

class UserHomePage2 extends StatefulWidget {
  const UserHomePage2({super.key});

  @override
  State<UserHomePage2> createState() => _UserHomePage2State();
}

class _UserHomePage2State extends State<UserHomePage2> {
  final PharmacyService pharmacyService = PharmacyService();
  final categoryList = CategoryData().categoryList;
  final reviewList = ReviewData().reviewList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    // responsive helpers
    double clamp(double v, double min, double max) => v.clamp(min, max);

    final horizontalPadding = clamp(w * 0.04, 12, 20); // 12..20
    final bannerHeight = clamp(h * 0.28, 160, 240); // looks good on most devices

    // grid responsiveness: 2 cols on small, 3 on normal, 4 on tablets
    int gridCount = 3;
    if (w < 360) gridCount = 2;
    if (w >= 700) gridCount = 4;

    final titleSize = clamp(w * 0.060, 18, 22); // "Top Pharmacies"
    final brandSize = clamp(w * 0.085, 22, 34); // "MediFinder"
    final subBrandSize = clamp(w * 0.075, 18, 30); // "we always"
    final lineSize = clamp(w * 0.070, 16, 28); // "on duty for you"

    return SafeArea(
      child: Scaffold(
        drawer: const SideMenuu(),
        appBar: AppBar(
          backgroundColor: appBarBgColor,
          actions: [appBarAction],
          title: appBarTitle,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBox(),
                const SizedBox(height: 10),

                // ===== Banner (Responsive) =====
                SizedBox(
                  height: bannerHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/Emergency/img2.jpeg",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Responsive overlay using FractionallySizedBox
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: w < 360 ? 0.55 : 0.45,
                          heightFactor: 1,
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  "MediFinder ",
                                  style: TextStyle(
                                    fontSize: brandSize,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "we always ",
                                  style: TextStyle(
                                    fontSize: subBrandSize,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "on duty for",
                              style: TextStyle(
                                fontSize: lineSize,
                                fontWeight: FontWeight.w600,
                                color: bannerSecColor,
                              ),
                            ),
                            Text(
                              "you",
                              style: TextStyle(
                                fontSize: lineSize,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  "Top Pharmacies",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),

                StreamBuilder<List<PharmacyModel>>(
                  stream: pharmacyService.getTopPharmacies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    final pharmacies = snapshot.data ?? [];

                    if (pharmacies.isEmpty) {
                      return const Text("No top pharmacies found.");
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridCount,
                        crossAxisSpacing: kDefaultPadding,
                        mainAxisSpacing: kDefaultPadding,
                        childAspectRatio: w < 360 ? 0.78 : 0.80,
                      ),
                      itemCount: pharmacies.length,
                      itemBuilder: (context, index) {
                        final pharmacy = pharmacies[index];
                        return TopPharmacyCard(
                          title: pharmacy.name,
                          imageUrl: pharmacy.logoUrl,
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 16),
                Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviewList.length,
                  itemBuilder: (context, index) {
                    Review review = reviewList[index];
                    return ReviewCard(
                      reviewTitle: review.reviewTitle,
                      reviewTime: review.reviewTime,
                      reviewDescription: review.reviewDescription,
                      reviewImageUrl: review.reviewImageUrl,
                    );
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}