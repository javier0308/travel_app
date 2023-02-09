import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = 'detail';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget countrieDestinity =
        ModalRoute.of(context)!.settings.arguments as Widget;

    final List<String> citys = ['basilica', 'burano_murano', 'gondola'];
    final List<String> prices = ['30', '210', '125'];
    final List<String> times = ['9:00', '7:00', '6:00'];
    final List<String> times2 = ['11:00', '8:00', '7:00'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                countrieDestinity,
                _AppBarCountrie(),
                const Positioned(
                  bottom: 20,
                  right: 15,
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemExtent: 180,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(-1, 2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/atractivos/${citys[i]}.jpg',
                            width: 125,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'St. Marks\nBasilica',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Sightseeing Tour',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Chip(
                                        label: Text('${times[i]} am'),
                                        backgroundColor:
                                            const Color(0xffE2F4F7),
                                      ),
                                      const SizedBox(width: 5),
                                      Chip(
                                        label: Text('${times2[i]} am'),
                                        backgroundColor:
                                            const Color(0xffE2F4F7),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\$${prices[i]}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Per Pax',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarCountrie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4)),
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4)),
                child: const Icon(
                  Icons.align_horizontal_center,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
