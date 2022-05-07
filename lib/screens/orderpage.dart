import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:animated_card/animated_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomarket/constant/const.dart';
import 'package:ecomarket/provider/saladcount_provider.dart';
import 'package:ecomarket/screens/data/data.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: wr.mainColor,
              child: Row(
                children: [
                  SizedBox(
                    width: wi(24),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: wi(80),
                      height: he(32),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios_new_rounded),
                          Text(
                            'Go back',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: he(16),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            he(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: wi(34),
                  ),
                  Text(
                    'My Basket',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: he(24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //! -----------------------------------------------------------------
          Expanded(
            flex: 11,
            child: context.read<SaladProvider>().order.isEmpty
                ? const Center(
                    child: Text(
                      'Is Empty',
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                : SizedBox(
                    width: wi(344),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: he(40),
                        left: wi(24),
                        right: wi(24),
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => AnimatedCard(
                          child: Dismissible(
                            onDismissed: (v) {
                              context.read<SaladProvider>().layk(context
                                  .read<SaladProvider>()
                                  .order
                                  .toList()[index]);
                              context.read<SaladProvider>().aniqla(); //!------------ddddddd
                              // context.read<SaladProvider>().notifyListeners();
                            },
                            key: UniqueKey(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/add',
                                      arguments: [
                                        meva[context
                                            .read<SaladProvider>()
                                            .order
                                            .toList()[index]],
                                        context
                                            .read<SaladProvider>()
                                            .order
                                            .toList()[index]
                                      ],
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: containerColor[context
                                            .watch<SaladProvider>()
                                            .order
                                            .toList()[index]]),
                                    height: he(65),
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: he(65),
                                          width: wi(64),
                                          decoration: BoxDecoration(
                                            color: wr.mainColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                he(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CachedNetworkImage(
                                          imageUrl: meva[context
                                              .watch<SaladProvider>()
                                              .order
                                              .toList()[index]]['image'],
                                          height: he(85),
                                          width: wi(85),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: wi(79),
                                            ),
                                            SizedBox(
                                              width: wi(16),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: he(10),
                                                ),
                                                Text(
                                                  meva[context
                                                      .watch<SaladProvider>()
                                                      .order
                                                      .toList()[index]]['name'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: he(16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: he(6),
                                                ),
                                                Text(
                                                  '2packs',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: he(14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: wi(55),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '₦ ${(meva[context.watch<SaladProvider>().order.toList()[index]]['price'] as double).toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: he(16),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: he(16),
                                ),
                                const Divider(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: he(34),
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: context.read<SaladProvider>().order.length,
                      ),
                    ),
                  ),
          ),
          //!---------------------------------------------------------------
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  EdgeInsets.only(left: wi(24), right: wi(24), bottom: he(36)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: he(16),
                        ),
                      ),
                      Text(
                        '₦ ${(context.watch<SaladProvider>().total() as double).toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: he(24),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      height: he(56),
                      width: wi(219),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFA451),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            he(10),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: he(16),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: (context),
                        // ignore: avoid_unnecessary_containers
                        builder: (context) => Column(
                          children: [
                            FadeInRight(
                              duration: const Duration(milliseconds: 500),
                              child: SizedBox(
                                height: 48,
                                width: 48,
                                child: FloatingActionButton(
                                  mini: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.clear,
                                      color: Colors.black),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: he(10),
                            ),
                            Container(
                              height: he(390),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(he(30)),
                                  topRight: Radius.circular(he(30)),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: he(40),
                                  left: wi(24),
                                  right: wi(24),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery address',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: he(20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: he(16),
                                    ),
                                    Container(
                                      height: he(56),
                                      width: wi(327),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF3F1F1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            he(10),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: he(16), left: wi(15)),
                                        child: Text(
                                          '10th avenue, Lekki, Lagos State',
                                          style: TextStyle(
                                            color: const Color(0xFFC2BDBD),
                                            fontWeight: FontWeight.w500,
                                            fontSize: he(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: he(24),
                                    ),
                                    Text(
                                      'Number we can call',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: he(20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: he(16),
                                    ),
                                    Container(
                                      height: he(56),
                                      width: wi(327),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF3F1F1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            he(10),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: he(16), left: wi(15)),
                                        child: Text(
                                          '09090605708',
                                          style: TextStyle(
                                            color: const Color(0xFFC2BDBD),
                                            fontWeight: FontWeight.w500,
                                            fontSize: he(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: he(40),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: he(56),
                                            width: wi(125),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: wr.mainColor),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  he(10),
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Pay on delivery',
                                                style: TextStyle(
                                                  color: wr.mainColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: he(16),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                            showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: (context),
                                              builder: (context) => Container(
                                                color: Colors.orange,
                                              ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/comp');
                                          },
                                          child: Container(
                                            height: he(56),
                                            width: wi(125),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: wr.mainColor),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  he(10),
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Pay with card',
                                                style: TextStyle(
                                                  color: wr.mainColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: he(16),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
