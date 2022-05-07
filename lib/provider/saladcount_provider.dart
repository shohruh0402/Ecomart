import 'package:ecomarket/screens/data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaladProvider extends ChangeNotifier {
  double tot = 0;
  Set ras = {};
  List<bool> likelar = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  Set order = {};
  Set searchedPokemons = {};
  del(index) {
    order.remove(index);
    notifyListeners();
  }

  void aniqla() {
    for (var i = 0; i < likelar.length; i++) {
      if (likelar[i] == true) {
        order.add(i);
      } else {
        order.remove(i);
      }
    }
    print(order);
    notifyListeners();
  }

  add(index) {
    meva[index]['price'] += meva[index]['price'] / meva[index]['kg'];
    meva[index]['kg'] += 1;
    notifyListeners();
  }

  remove(index) {
    if (meva[index]['kg'] > 1) {
      meva[index]['price'] -= meva[index]['price'] / meva[index]['kg'];
      meva[index]['kg'] -= 1;
    }
    notifyListeners();
  }

  layk(index) {
    likelar[index] = !likelar[index];

    print(order);
    notifyListeners();
  }

  total() {
    tot = 0;
    for (var item in order) {
      tot += meva[item]['price'];
    }
    return tot;
  }

  chiqar(String v) {
    searchedPokemons.clear();
    for (var i = 0; i < meva.length; i++) {
      if (v.isEmpty) {
        searchedPokemons.clear();
      } else if ((meva[i]['name'] as String).toLowerCase().contains(v)) {
        searchedPokemons.add(i);
      }
    }
    notifyListeners();
  }

  rasm() {
    for (var i = 0; i < meva.length; i++) {
      if (meva[i]['name'] == searchedPokemons.toList()[i]) {
        ras.add(i);
      } else {
        ras.add(2);
      }
    }
  }
}
