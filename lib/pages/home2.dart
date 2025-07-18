import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/common/feedback.dart';
import 'package:medi_finder_user_home_page/cards/top_pharmacy_card.dart';
import 'package:medi_finder_user_home_page/data/category_data.dart';
import 'package:medi_finder_user_home_page/data/top_pharmacy_data.dart';
import 'package:medi_finder_user_home_page/models/category_model.dart';
import 'package:medi_finder_user_home_page/models/top_pharamcy_model.dart';
import 'package:medi_finder_user_home_page/cards/review_card.dart';
import 'package:medi_finder_user_home_page/data/review_data.dart';
import 'package:medi_finder_user_home_page/models/review_model.dart';
import 'package:medi_finder_user_home_page/common/search_bar.dart';
import 'package:medi_finder_user_home_page/side_menu/side_menu.dart';


import '../pharmacy_interface/category/category_card.dart';
import '../common/app_bar.dart';

class UserHomePage2 extends StatefulWidget {
  const UserHomePage2({super.key});

  @override
  State<UserHomePage2> createState() => _UserHomePage2State();
}

class _UserHomePage2State extends State<UserHomePage2> {

  final categoryList = CategoryData().categoryList;
  final topPharmacyList = TopPharmacyData().topPharmacyList;
  final reviewList = ReviewData().reviewList;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenuu(),
        appBar: AppBar(
          backgroundColor: appBarBgColor ,
          actions: [appBarAction],
          title: appBarTitle,
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBox(),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/Emergency/img2.jpeg",
                        width: MediaQuery.of(context).size.width* 0.97,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height* 0.28,
                      ),
                    ),
                    Container(
                          width: MediaQuery.of(context).size.width* 0.40,
                          height: MediaQuery.of(context).size.height* 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.6)
                          ),
                        ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("MediFinder ",style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                              ),),
                              Text("we always ",style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),),
                            ],
                          ),

                              Text("on duty for ",style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: bannerSecColor
                                  ),),
                              Text("you",style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),),
                            ],
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                  const SizedBox(height: 8,),
                   const Text("Top Pharmacies",
                  style: TextStyle(
                    fontSize: 20,
                     color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                  ),
                  const SizedBox(height: 6,),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Emergency/img11.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height* 0.38,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: kDefaultPadding,
                              mainAxisSpacing: kDefaultPadding,
                              childAspectRatio: 8/10,),

                            itemCount: topPharmacyList.length,
                            itemBuilder: (context, index) {
                              TopPharmacy topPharmacy = topPharmacyList[index];
                              return TopPharmacyCard(
                                title: topPharmacy.name,
                                imageUrl: topPharmacy.logo,
                              );
                            },),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:  MediaQuery.of(context).size.height* 0.20,
                  child: ListView.builder(
                      scrollDirection:Axis.vertical,
                      itemCount: reviewList.length,
                      itemBuilder: (context, index) {
                        Review review = reviewList[index];
                        return ReviewCard(
                            reviewTitle: review.reviewTitle,
                            reviewTime: review.reviewTime,
                            reviewDescription: review.reviewDescription,
                            reviewImageUrl: review.reviewImageUrl
                        );
                      }
                  ),
                ),
                //ReviewPage()
              ],
            ),

          ),
        ),
      ),
    );
  }
}
