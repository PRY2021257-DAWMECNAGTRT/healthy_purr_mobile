import 'package:flutter/material.dart';
import 'package:healthy_purr_mobile_app/view_models/view_model.dart';
import 'package:provider/provider.dart';
import 'package:bordered_text/bordered_text.dart';

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    final catList = Provider.of<CatListViewModel>(context, listen: false).getCats();

    final catImages = Provider.of<CatListViewModel>(context, listen: false).getCatsImages();

    return SizedBox(
      height: 160,
      width: screenSize.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16, bottom: 10),
            height: 180,
            width: 105,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 4),
                )
              ]
            ),
            child: Stack(
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         duration: const Duration(milliseconds: 200),
                    //         reverseDuration: const Duration(milliseconds: 200),
                    //         type: PageTransitionType.rightToLeft,
                    //         child: CatProfileScreen(data[index], catImage(data[index]), hdrs)
                    //     )
                    // );
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(3, 5, 3, 4),
                      height: 170,
                      width: 99,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        image: DecorationImage(image: catImages[index].url != "" ? catImages[index] :
                            NetworkImage("https://w7.pngwing.com/pngs/270/98/png-transparent-cat-kitten-balloon-birthday-graphy-cats-mammal-hat-cat-like-mammal.png"), fit: BoxFit.fill),
                      )
                  ),
                ),
                Positioned(
                  bottom: 10, left: 14,
                  child: BorderedText(
                    strokeColor: Colors.black,
                    strokeWidth: 3.0,
                    child: Text(catList[index].name!,
                        style: const TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
