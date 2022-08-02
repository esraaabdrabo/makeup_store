import 'dart:developer';

import 'package:flutter/material.dart';

class ShoppingCartVM extends ChangeNotifier {
  int itemsNum = 0;
  List<Order> ordersList = [];
  List<PieceNum> pieceNum = [];
  String seletectColor = '';
  String orderColorName = '';
  String orderColorHexa = '';

  addItem(int id, String colorName, String colorHexa) {
    //int foundAtIndex = isInCart(id);
    // foundAtIndex >=0 if element found
    /*if (isInCart(id) >= 0) {
      ordersList[foundAtIndex].num++;
      ordersList[foundAtIndex].colorHexa = colorHexa;
      ordersList[foundAtIndex].colorName = colorName;

      itemsNum++;

      notifyListeners();
    } else {*/
    ordersList.add(Order(id, colorName, colorHexa));
    addToPieceNum(id);
    itemsNum++;
    // ordersList[foundAtIndex].colorHexa = colorHexa;
    //ordersList[foundAtIndex].colorName = colorName;
    notifyListeners();
    //  }
  }

  deleteItem(int id) {
    int foundAtIndex = isInCart(id);
    // foundAtIndex >=0 if element found
    if (isInCart(id) >= 0) {
      if (ordersList[foundAtIndex].num > 0) {
        ordersList[foundAtIndex].num--;
        itemsNum--;
        notifyListeners();
      }
    } else {
      null;
    }
  }

//search for certain id in order list
//return -1 if element not foune
// return index if element found
  int isInCart(int id) {
    return ordersList.indexWhere((element) => element.id == id);
  }

  int isInPieceNum(int id) {
    return pieceNum.indexWhere((element) => element.id == id);
  }

//to retuen num on cart for view
  String getproductOrderNum(int id) {
    int foundAtIndex = isInPieceNum(id);
    log('index $foundAtIndex');
    if (foundAtIndex >= 0) {
      log(pieceNum.length.toString());
      return pieceNum[foundAtIndex].num.toString();
    }
    return '0';
  }

  void addToPieceNum(int id) {
    if (pieceNum.isEmpty) {
      pieceNum.add(PieceNum(id));
      log('added');
    } else if (isInPieceNum(id) >= 0) {
      int foundAt = isInPieceNum(id);
      pieceNum[foundAt].num++;
    } else {
      pieceNum.add(PieceNum(id));
    }
    notifyListeners();
  }

  void removeFromPieceNum(int id) {
    int foundAt = isInPieceNum(id);

    if (pieceNum.isEmpty) {
      null;
    } else if (isInPieceNum(id) >= 0) {
      if (pieceNum[foundAt].num == 1) {
        pieceNum.removeAt(foundAt);
        itemsNum--;
      } else {
        pieceNum[foundAt].num--;
        itemsNum--;
      }

      notifyListeners();
    }
    //if list is not empt or not contain the element
    else {
      null;
    }
  }

  void selectColor(String color) {
    seletectColor = color;
    notifyListeners();
  }
}

class PieceNum {
  int id;
  int num = 1;
  PieceNum(this.id);
}

class Order {
  int id;
  int num = 1;
  String colorName = '';
  String colorHexa = '';
  Order(this.id, this.colorName, this.colorHexa);
}

class PieceColor {
  String selectedColor;
  PieceColor(this.selectedColor);
}
