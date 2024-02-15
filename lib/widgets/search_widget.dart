import 'package:flutter/material.dart';
import 'package:task_manager/config/globals.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        cursorColor: grey1,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: grey1, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: grey1),
          prefixIcon: Icon(
            Icons.search,
            color: grey1,
          ),
          filled: true,
          fillColor: bgColor1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
