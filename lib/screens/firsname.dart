import 'package:animate_do/animate_do.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';

class FirstName extends StatelessWidget {
  const FirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ElasticIn(
        child: Column(
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
                        'assets/imges/fruit_2.png',
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
      ),
    );
  }
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
              'What is your firstname?',
              overflow: TextOverflow.clip,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: he(20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: he(16), left: wi(24)),
            child: Container(
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
                padding:  EdgeInsets.only(top: he(20),left: wi(15)),
                child: Text(
                  'Tony',
                  style: TextStyle(
                    color: const Color(0xFFC2BDBD),
                    fontWeight: FontWeight.w500,
                    fontSize: he(16),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: he(42), left: wi(24)),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/home');
              },
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
                    'Start Ordering',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: he(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
