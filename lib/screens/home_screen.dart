import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_manager/config/globals.dart';
import 'package:task_manager/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                color: grey1,
              )),
          const Gap(15)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        children: [
          ListTile(
            title: Text(
              "Hi, Joseph",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: grey1),
            ),
            subtitle: Text(
              "Be productive today!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: grey1, fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(5),
          const SearchWidget(),
          const Gap(5),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ListTile(
                            title: Text(
                              "Task Progress",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "30/40 tasks done",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xff3f37c9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "March 22",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: CircularProgressIndicator(
                              value: 0.5,
                              strokeWidth: 9,
                              color: const Color(0xff3f37c9),
                              backgroundColor: bgColor,
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                          Positioned(
                              child: Text(
                            "50%",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ))
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
