import 'package:flutter/material.dart';
import 'package:travel_app/screens/screen.dart';

class CountrieDestinity extends StatelessWidget {
  const CountrieDestinity(
      {super.key,
      required this.imgList,
      required this.atractivos,
      this.heightCity,
      this.height,
      required this.index});

  final List<String> imgList;
  final List<String> atractivos;
  final int index;
  final double? height, heightCity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.route,
          arguments: CountrieDestinity(
            imgList: imgList,
            atractivos: atractivos,
            index: index,
            height: 400,
            heightCity: 40,
          ),
        );
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(
              'assets/countries/${imgList[index]}.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                atractivos[index],
                style: TextStyle(
                    fontSize: heightCity,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 1,
                      child: const Icon(
                        Icons.airplanemode_active,
                        size: 25,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      imgList[index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
