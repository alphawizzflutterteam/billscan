import 'package:flutter/material.dart';

import '../Helper/app_colors.dart';

class CustomAppbar extends StatefulWidget {
  String? titlee;
  CustomAppbar({Key? key, this.titlee}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primery,
      elevation: 3,
      shadowColor: AppColors.primery,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13), bottomRight: Radius.circular(13)),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
        height: 80,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                      color: AppColors.SigninCardBackgroundColor,
                    )),
                Text(
                  '${widget.titlee}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.SigninCardBackgroundColor),
                ),
                const SizedBox(),
              ],
            )),
      ),
    );
  }
}
