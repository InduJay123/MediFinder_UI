import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

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
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const SearchBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/Emergency/img2.jpeg",
                                width: MediaQuery.of(context).size.width* 0.91,
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height* 0.28,
                            ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width* 0.5,
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
                                      color: Colors.white
                                  ),),
                                ],
                              ),
                              Text("on duty for you",style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: bannerSecColor
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("CATEGORIES",
                        style: TextStyle(
                          color: Heading2Color,
                          fontSize: 21,
                          fontWeight: FontWeight.w500
                        ),),
                        Row(
                          children: [
                            Text("VIEW ALL",
                              style: TextStyle(
                                  color: Heading2Color,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              ),),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xff439328),
                              size: 17,
                            )
                          ],
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                 SizedBox(
                     height: MediaQuery.of(context).size.height* 0.16,
                     child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        Category category = categoryList[index];
                        return CategoryCard(
                          title: category.title,
                          imageUrl: category.imageUrl,
                      );
                      }
                 )
                 ),
                  const SizedBox(height: 8,),
                  const Text("Top Pharmacies",
                  style: TextStyle(
                    fontSize: 19,
                     color: Heading2Color,
                      fontWeight: FontWeight.w500
                  ),
                  ),
                  const SizedBox(height: 6,),
                 SizedBox(
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
