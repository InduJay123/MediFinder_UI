import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: searchBarBgColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: searchBarBorderColor,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: searchBarBorderColor,
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Chemical Name (required)",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: searchBarBgColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: searchBarBorderColor,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: searchBarBorderColor,
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Brand Name",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
