import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomarket/constant/const.dart';
import 'package:ecomarket/provider/saladcount_provider.dart';
import 'package:ecomarket/screens/data/data.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  // ignore: unused_field
  final TextEditingController _controller = TextEditingController();
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: he(50),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // _controller.clear();
                        context.read<SaladProvider>().searchedPokemons.clear();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: he(56),
                      width: wi(310),
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
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          onChanged: (v) {
                            print(
                                'bu ras ${context.read<SaladProvider>().searchedPokemons}');
                            // print(
                            //     'bu poke ${context.read<SaladProvider>().searchedPokemons}');
                            context.read<SaladProvider>().chiqar(v);
                          },
                          controller: _controller,
                          style: const TextStyle(fontSize: 23),
                          decoration: const InputDecoration(
                            hintText: 'Search here...',
                            border: InputBorder.none,
                          ),
                          scrollPadding: const EdgeInsets.only(left: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: he(712),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: wi(24),
                    right: wi(24),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (contex, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/add',
                                arguments: [
                                  meva[context
                                      .read<SaladProvider>()
                                      .searchedPokemons
                                      .toList()[index]],
                                  context
                                      .read<SaladProvider>()
                                      .searchedPokemons
                                      .toList()[index]
                                ],
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: containerColor[index]),
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
                                        .searchedPokemons
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
                                                .searchedPokemons
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
                                          '₦ ${((meva[context.watch<SaladProvider>().searchedPokemons.toList()[index]]['price']) as double).toStringAsFixed(2)}',
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
                      );
                    },
                    itemCount:
                        context.watch<SaladProvider>().searchedPokemons.length,
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
