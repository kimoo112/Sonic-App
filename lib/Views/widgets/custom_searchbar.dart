import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/navigate.dart';
import '../screens/Search/search_view.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.onTap,
    this.onChanged,
  }) : super(key: key);
  final void Function()? onTap;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: cLightGrey.withOpacity(.4),
      borderRadius: BorderRadius.circular(20),
      color: cLight,
      child: TextField(
        onTap: onTap ??
            () {
              getToSearch(const SearchView(), context);
            },
        onChanged: onChanged ?? (value) {},
        style: const TextStyle(color: cDark),
        cursorColor: cBlue,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: cBlue,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: cBlue, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          // suffixIcon:
          //     Icon(CupertinoIcons.mic_fill, color: cDark.withOpacity(.7)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: "Looking for shoes",
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: cLight,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: cBlue),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
