import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task_manager/config/globals.dart';

class StaggeredGridViewF extends StatelessWidget {
  const StaggeredGridViewF({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            tileBottomSpace: 10,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                1,
                crossAxisRatio: 3 / 4,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 4,
            (context, index) => Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          color: bgColor1.withOpacity(0.5),
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          bgColor,
                          bgColor1,
                        ]),
                    color: const Color(0xff3f37c9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(index.toString())),
          ),
        ),
      ),
    );
  }
}
