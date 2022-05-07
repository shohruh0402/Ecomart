import 'package:ecomarket/constant/const.dart';
import 'package:ecomarket/sizconfig/sizeconfige.dart';
import 'package:flutter/material.dart';

class Compled extends StatelessWidget {
  const Compled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: he(160),
            ),
            child: Image.asset(
              'assets/imges/Group 48.png',
              height: 164,
            ),
          ),
          SizedBox(
            height: he(56),
          ),
          Center(
            child: Text(
              'Congratulations!!!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: he(32),
              ),
            ),
          ),
          SizedBox(
            height: he(16),
          ),
          Text(
            'Your order have been taken and \n             is being attended to',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: he(20),
            ),
          ),
          SizedBox(
            height: he(56),
          ),
          Container(
            height: he(56),
            width: wi(133),
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
                'Track order',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: he(16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: he(46),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Container(
              height: he(56),
              width: wi(181),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: wr.mainColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    he(10),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Continue shopping',
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
    );
  }
}
