import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomarket/constant/const.dart';
import 'package:ecomarket/provider/saladcount_provider.dart';
import 'package:ecomarket/screens/data/data.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  late SaladProvider read;
  late SaladProvider watch;

  @override
  Widget build(BuildContext context) {
    read = context.watch<SaladProvider>();
    watch = read = context.watch<SaladProvider>();

    SizeConfig().init(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: wi(24), top: he(12)),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/order');
                  },
                  child: SizedBox(
                    height: he(30),
                    width: wi(30),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/imges/Vector.png',
                          height: he(30),
                        ),
                        watch.order.isEmpty
                            ? const Text('')
                            : Positioned(
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: he(10),
                                  child: Center(
                                    child: Text(
                                      context
                                          .watch<SaladProvider>()
                                          .order
                                          .length
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  height: he(2.5),
                ),
                Text(
                  'My basket',
                  style: TextStyle(fontSize: he(10), color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: he(24),
                left: wi(25),
              ),
              child: Text(
                'Hello Tony, What fruit salad \ncombo do you want today?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: he(20),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: he(16), left: wi(24)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/ser');
                    },
                    child: Container(
                      height: he(56),
                      width: wi(288),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: he(5),
                            blurRadius: he(30),
                            offset: const Offset(0, 20),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            he(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: wi(15)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color(0xFFC2BDBD),
                            ),
                            SizedBox(
                              width: wi(10),
                            ),
                            Text(
                              'Search for fruit salad combos',
                              style: TextStyle(
                                color: const Color(0xFFC2BDBD),
                                fontWeight: FontWeight.w500,
                                fontSize: he(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: he(10), left: wi(10)),
                  child: Image.asset(
                    'assets/imges/set.png',
                    height: he(30),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: he(40),
                left: wi(25),
              ),
              child: Text(
                'Recommended Combo',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: he(24),
                ),
              ),
            ), // !
            Row(
              children: [twocon(), twocon()],
            ),
            SizedBox(
              height: he(48),
            ),
            SizedBox(
              width: double.infinity,
              height: he(60),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: wi(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hottest',
                        style: TextStyle(fontSize: he(24)),
                      ),
                      index == 0
                          ? Container(
                              height: he(4),
                              width: wi(25),
                              decoration: BoxDecoration(
                                color: wr.mainColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            )
                          : const Text('')
                    ],
                  ),
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: he(200),
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.only(top: he(15), left: wi(25), bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/add',
                          arguments: [meva[index], index]);
                    },
                    child: Container(
                      width: wi(152),
                      height: he(183),
                      decoration: BoxDecoration(
                        color: containerColor[index],
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.2),
                        //     spreadRadius: he(5),
                        //     blurRadius: he(30),
                        //     offset: const Offset(0, 20),
                        //   ),
                        // ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            he(16),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: wi(0),
                            top: he(0),
                            child: IconButton(
                              splashRadius: 1,
                              icon: Icon(
                                  context.watch<SaladProvider>().likelar[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                              onPressed: () {
                                context.read<SaladProvider>().layk(index);
                                context.read<SaladProvider>().aniqla();
                              },
                              color: wr.mainColor,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: he(22),
                              ),
                              Center(
                                  child: CachedNetworkImage(
                                imageUrl: meva[index]['image'],
                                height: he(80),
                              )),
                              SizedBox(
                                height: he(8),
                              ),
                              Text(
                                meva[index]['name'],
                                style: TextStyle(
                                  color: const Color(0xFF27214D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: he(16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: he(10), left: wi(17), right: wi(16)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₦ ${(meva[index]['price'] as double).toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: const Color(0xFFF08626),
                                        fontWeight: FontWeight.w500,
                                        fontSize: he(16),
                                      ),
                                    ),
                                    SizedBox(
                                      height: he(24),
                                      width: wi(24),
                                      child: FloatingActionButton(
                                        mini: true,
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: wr.mainColor,
                                        ),
                                        backgroundColor:
                                            const Color(0xFFFFF2E7),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 6,
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Padding twocon() {
    return Padding(
      padding: EdgeInsets.only(
        top: he(40),
        left: wi(25),
      ),
      child: Container(
        width: wi(152),
        height: he(183),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: he(30),
              offset: const Offset(0, 20),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              he(16),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: wi(10),
              top: he(10),
              child: Icon(
                Icons.favorite_border,
                color: wr.mainColor,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: he(22),
                ),
                Center(
                    child: Image.asset(
                  'assets/imges/twocon.png',
                  height: he(80),
                )),
                SizedBox(
                  height: he(8),
                ),
                Text(
                  'Honey lime combo',
                  style: TextStyle(
                    color: const Color(0xFF27214D),
                    fontWeight: FontWeight.w500,
                    fontSize: he(16),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: he(10), left: wi(17), right: wi(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₦ 2,000',
                        style: TextStyle(
                          color: const Color(0xFFF08626),
                          fontWeight: FontWeight.w500,
                          fontSize: he(16),
                        ),
                      ),
                      SizedBox(
                        height: he(24),
                        width: wi(24),
                        child: FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: wr.mainColor,
                          ),
                          backgroundColor: const Color(0xFFFFF2E7),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
