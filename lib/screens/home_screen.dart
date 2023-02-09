import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/countrie_destinity.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SafeArea(
                bottom: false,
                child: Text(
                  'What you would like\nto find?',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _IconSelected(
                    icon: Icon(
                      FontAwesomeIcons.plane,
                      color: Color(0xff40B9CE),
                    ),
                    backColor: Color(0xffD8ECF1),
                  ),
                  _IconSelected(
                    icon: Icon(
                      FontAwesomeIcons.car,
                      color: Colors.grey,
                    ),
                    backColor: Color(0xffE7EBEE),
                  ),
                  _IconSelected(
                    icon: Icon(
                      FontAwesomeIcons.skyatlas,
                      color: Colors.grey,
                    ),
                    backColor: Color(0xffE7EBEE),
                  ),
                  _IconSelected(
                    icon: Icon(
                      FontAwesomeIcons.motorcycle,
                      color: Colors.grey,
                    ),
                    backColor: Color(0xffE7EBEE),
                  ),
                  SizedBox(width: 1)
                ],
              ),
              const SizedBox(height: 20),
              const _NavegacionAll(tittle: 'Top Destinations'),
              const SizedBox(height: 15),
              const CardsDestino(),
              const SizedBox(height: 15),
              const _NavegacionAll(tittle: 'Exclusive Hotels'),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10),
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/hote.jpeg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomOptions(),
    );
  }
}

class _BottomOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      iconSize: 30,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bagShopping), label: ''),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            label: '')
      ],
    );
  }
}

class CardsDestino extends StatelessWidget {
  const CardsDestino({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'italy',
      'francia',
      'peru',
      'egipto',
      'brasil',
      'mexico',
    ];
    final List<String> atractivos = [
      'Venice',
      'Paris',
      'Machu Picchu',
      'Piramides',
      'Cristo Redentor',
      'Chichen Itza',
    ];
    final List<String> actividades = [
      '125 activities',
      '98 activities',
      '102 activities',
      '50 activities',
      '112 activities',
      '120 activities',
    ];
    final List<String> resume = [
      'Enjoy best trips from top\ntravel agencies at best prices.',
      'Unique and custom travel organizez by local in city.',
      'Machu Picchu is the most outstanding Inca archaeological site due to its creative urban design.',
      'The pyramids were funerary monuments, that is, tombs in which the pharaohs were buried.',
      'With a total weight of 1,445 tons, despite being completely hollow except for the arms.',
      'Chichén Itzá The legendary Mayan city of Chichén Itzá, a World Heritage Site.',
    ];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  blurRadius: 1,
                  spreadRadius: 0.5,
                  offset: const Offset(-2.5, 8),
                  color: Colors.grey.withOpacity(0.1),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CountrieDestinity(
                  imgList: imgList,
                  atractivos: atractivos,
                  index: index,
                  height: 200,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        actividades[index],
                        style: const TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        resume[index],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.4)),
                      )
                    ],
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

class _NavegacionAll extends StatelessWidget {
  final String tittle;
  const _NavegacionAll({
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tittle,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          'See All',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff40B9CE),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class _IconSelected extends StatelessWidget {
  final Icon icon;
  final Color backColor;

  const _IconSelected({required this.icon, required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backColor,
        ),
        child: icon);
  }
}
