import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';


import 'package:medi_finder_user_home_page/side_menu/pharmasist_side_menu.dart';
import '../../data/category_data.dart';
import '../../models/category_model.dart';

import '../category/category_card.dart';
import '../category/pharmasist_app_bar.dart';
import '../category/total_card.dart';


class PharmacistHomePage extends StatefulWidget {
  const PharmacistHomePage({super.key});

  @override
  State<PharmacistHomePage> createState() => _PharmacistHomePageState();
}

class _PharmacistHomePageState extends State<PharmacistHomePage> {

  final categoryList = CategoryData().categoryList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: appBarBgColor ,
          title: appBarTitle,


        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/pimg5.png",
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
                                color: bannerFirstColor
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
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories that you include:",
                    style: TextStyle(
                        color: Heading2Color,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  Row(
                    children: [
                      Text("VIEW ALL",
                        style: TextStyle(
                            color: Heading2Color,
                            fontSize: 16,
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
                height: 15,
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
              const SizedBox(
                height: 15,
              ),
              const TotalCard(
                  availableValue: 0.5,
                  total: 100
              )
            ],
          ),
        ),
      ),
    );
  }
}
