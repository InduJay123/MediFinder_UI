import 'package:flutter/material.dart';
import '../../colors.dart';

class TotalCard extends StatefulWidget {
  final double availableValue;
  final int total;
  const TotalCard({
    super.key,
    required this.availableValue,
    required this.total
  });

  @override
  State<TotalCard> createState() => _TotalCardState();
}

class _TotalCardState extends State<TotalCard> {
  @override
  Widget build(BuildContext context) {
   int available =  (widget.availableValue*100).toInt();
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height* 0.26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [locationIconBgColor,totalCdFirstColor ]
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Current Progress &\navailable stock",style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),),
            const SizedBox(
              height: 18,
            ),
            LinearProgressIndicator(
              value:widget.availableValue,
              backgroundColor: progressLineColor,
              valueColor:  AlwaysStoppedAnimation(Colors.white ),
              minHeight: 12,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag(
                  "Available",
                  available.toString(),
                ),
                _buildTag(
                  "Total",
                  widget.total.toString(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildTag (String title , String value){
    return Column(
      children: [
        Text(title,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        const SizedBox(
          height: 8,
        ),
        Text(value,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),)
      ],
    );
  }
}


