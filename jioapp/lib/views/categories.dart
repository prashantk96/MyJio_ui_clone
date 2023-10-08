import 'package:flutter/material.dart';

import 'home_page.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isExpanded = false;
  final List<IconsList> _iconsLists = [
    IconsList(title: Icons.phone_android, space: 50, color: Colors.blue),
    IconsList(title: Icons.router_outlined, space: 50, color: Colors.blue),
    IconsList(title: Icons.music_note_outlined, space: 50, color: Colors.cyan),
    IconsList(title: Icons.tv, space: 50, color: Colors.red),
    IconsList(
        title: Icons.smart_display_outlined, space: 50, color: Colors.cyan),
    IconsList(
        title: Icons.shopping_bag_rounded, space: 50, color: Colors.redAccent),
    IconsList(title: Icons.border_color_rounded, space: 50, color: Colors.blue),
    IconsList(title: Icons.payment, space: 50, color: Colors.blue),
    IconsList(title: Icons.gamepad, space: 50, color: Colors.purple),
    IconsList(
        title: Icons.videogame_asset_rounded, space: 50, color: Colors.green),
    IconsList(title: Icons.newspaper_rounded, space: 50, color: Colors.red),
    IconsList(
        title: Icons.local_pharmacy_rounded, space: 50, color: Colors.cyan),
    IconsList(title: Icons.money, space: 50, color: Colors.blue),
    IconsList(title: Icons.health_and_safety, space: 50, color: Colors.cyan),
    IconsList(
        title: Icons.backup,
        space: 50,
        color: const Color.fromARGB(255, 76, 163, 206)),
    IconsList(title: Icons.movie_sharp, space: 50, color: Colors.pink),
    IconsList(title: Icons.event_sharp, space: 50, color: Colors.cyan),
    IconsList(
        title: Icons.store_mall_directory_rounded,
        space: 50,
        color: Colors.blue),
    IconsList(
        title: Icons.money_off_csred_rounded, space: 50, color: Colors.blue),
    IconsList(title: Icons.work, space: 50, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: isExpanded
                ? _iconsLists.length
                : _iconsLists.length < 12
                    ? _iconsLists.length
                    : 12,
            itemBuilder: (BuildContext context, int index) {
              if (!isExpanded && index == 11) {
                return MaterialButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 50,
                    color: Colors.blue,
                  ),
                );
              }
              IconsList icon = _iconsLists[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(180.0)),
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(180.0)),
                        color: icon.color),
                    child: Icon(
                      icon.title,
                      size: icon.space,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("The icon is clicked");
                  },
                ),
              );
            },
          ),
        ),
        if (isExpanded)
          MaterialButton(
            onPressed: () {
              setState(() {
                isExpanded = false;
              });
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_circle_up_outlined,
                    size: 50, color: Colors.blue),
              ],
            ),
          ),
      ],
    );
  }
}
