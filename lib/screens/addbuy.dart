import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomarket/constant/const.dart';
import 'package:ecomarket/provider/saladcount_provider.dart';
import 'package:ecomarket/screens/data/data.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddBuy extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var lar;
  AddBuy({Key? key, this.lar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: containerColor[lar[1]],
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Column(
            children: [
              Container(
                height: he(300),
                child: InkWell(
                  onDoubleTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    color: containerColor[lar[1]],
                    child: Column(
                      children: [
                        SizedBox(
                          height: he(50),
                        ),
                        CachedNetworkImage(
                          imageUrl: '${lar[0]['image']}',
                          height: he(200),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: he(510),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 40,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        he(20),
                      ),
                      topRight: Radius.circular(
                        he(20),
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: he(40), left: wi(24), right: wi(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lar[0]['name'],
                            style: TextStyle(
                              color: const Color(0xFF27214D),
                              fontWeight: FontWeight.w500,
                              fontSize: he(32),
                            ),
                          ),
                          SizedBox(
                            height: he(34),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: he(32),
                                width: wi(32),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    context
                                        .read<SaladProvider>()
                                        .remove(lar[1]);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: wr.mainColor,
                                  ),
                                  backgroundColor: const Color(0xFFFFF2E7),
                                ),
                              ),
                              SizedBox(
                                width: wi(24),
                              ),
                              Text(
                                '${lar[0]['kg']}',
                                style: TextStyle(fontSize: he(24)),
                              ),
                              SizedBox(
                                width: wi(24),
                              ),
                              SizedBox(
                                height: he(32),
                                width: wi(32),
                                child: FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    context.read<SaladProvider>().add(lar[1]);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: wr.mainColor,
                                  ),
                                  backgroundColor: const Color(0xFFFFF2E7),
                                ),
                              ),
                              SizedBox(
                                width: wi(80),
                              ),
                              Expanded(
                                child: Text(
                                  '₦ ${(lar[0]['price'] as double).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: he(24),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: he(32)),
                          const Divider(
                            height: 1,
                          ),
                          SizedBox(
                            height: he(64),
                          ),
                          Text(
                            'One Pack Contains:',
                            style: TextStyle(
                              color: const Color(0xFF27214D),
                              fontWeight: FontWeight.w500,
                              fontSize: he(20),
                            ),
                          ),
                          Container(
                            color: wr.mainColor,
                            height: he(3),
                            width: wi(175),
                          ),
                          SizedBox(
                            height: he(18),
                          ),
                          Text(
                            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                            style: TextStyle(
                              color: const Color(0xFF27214D),
                              fontWeight: FontWeight.w500,
                              fontSize: he(16),
                            ),
                          ),
                          SizedBox(height: he(20)),
                          Divider(
                            height: he(1),
                          ),
                          SizedBox(
                            height: he(24),
                          ),
                          Text(
                            'If you are looking for a new fruit salad to eat today, \nquinoa is the perfect brunch for you. make',
                            style: TextStyle(
                              color: const Color(0xFF27214D),
                              fontWeight: FontWeight.w500,
                              fontSize: he(14),
                            ),
                          ),
                          SizedBox(
                            height: he(39),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: he(48),
                                width: wi(48),
                                child: FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    context.read<SaladProvider>().layk(lar[1]);
                                    context.read<SaladProvider>().aniqla();
                                  },
                                  child: Icon(
                                    context
                                            .watch<SaladProvider>()
                                            .likelar[lar[1]]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: wr.mainColor,
                                  ),
                                  backgroundColor: const Color(0xFFFFF2E7),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  height: he(56),
                                  width: wi(219),
                                  decoration: BoxDecoration(
                                    color: wr.mainColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        he(10),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Add to basket',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: he(16),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/order');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
