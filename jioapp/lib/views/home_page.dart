import 'package:flutter/material.dart';
import 'package:jioapp/model/photoApi.dart';
import 'package:jioapp/views/slider.dart';
import 'package:jioapp/services/RemoteServices.dart';

import 'categories.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  List<Album>? Albums;
  bool isLoded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    Albums = await RemoteServices().getAlbums();
    if (Albums != null) {
      setState(() {
        isLoded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                        contentPadding: EdgeInsets.all(11),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  child: const Icon(Icons.qr_code_scanner),
                  onTap: () {
                    print("The icon is clicked");
                  },
                ),
              ),
              InkWell(
                child: const Icon(Icons.notifications),
                onTap: () {
                  print("The icon is clicked");
                },
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoryWidget(),
                const SizedBox(height: 20, width: 100),
                // const SliderWidget(),
                const SizedBox(height: 20),
                Visibility(
                  visible: isLoded,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ListView.builder(
                    itemCount: Albums?.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          child: Image(image: NetworkImage(Albums![index].url)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class IconsList {
  final IconData title;
  final double space;
  final Color color;

  IconsList({required this.title, required this.space, required this.color});
}
