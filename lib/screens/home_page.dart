import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              color: const Color(0xFFFFA451),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: he(155)),
                    child: Image.asset(
                      'assets/imges/fruit_1.png',
                      width: wi(301),
                      height: he(260),
                    ),
                  ),
                  SizedBox(
                    height: he(20),
                  ),
                  Image.asset(
                    'assets/imges/soya.png',
                    width: wi(300),
                  ),
                ],
              ),
            ),
          ),
          lets(context),
        ],
      ),
    );
  }

  Expanded lets(context) {
    return Expanded(
      flex: 4,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: he(56),
                left: wi(25),
              ),
              child: Text(
                'Get The Freshest Fruit Salad Combo',
                overflow: TextOverflow.clip,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: he(20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: he(8),
                left: wi(25),
              ),
              child: Text(
                'We deliver the best and freshest fruit salad in \ntown. Order for a combo today!!!',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: he(16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: he(58), left: wi(24)),
              child: InkWell(
                child: Container(
                  height: he(56),
                  width: wi(327),
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
                      'Let’s Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: he(16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/name');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
