import 'dart:math';
import 'package:flutter/material.dart';

class ShoppingCartVM extends ChangeNotifier {
  int itemsNum = 0;
  double totalPrice = 0;
  List<Order> ordersList = [];
  List<PieceNum> pieceNum = [];
  String seletectColor = '';
  String orderColorName = '';
  String orderColorHexa = '';

  addItem(int id, int num, String colorName, String colorHexa, String imgUrl,
      String price) {
    ordersList.add(Order(id, num, colorName, colorHexa, imgUrl, price));

    totalPrice = (totalPrice + double.parse(price) * num);
    totalPrice = totalPrice.ceilToDouble();
    addToPieceNum(id);
    itemsNum = itemsNum + num;
    orderColorHexa = '';
    orderColorName = '';
    seletectColor = '';
    var foundat = isInPieceNum(id);
    pieceNum.removeAt(foundat);
    notifyListeners();
  }

  deleteItem(int id) {
    int foundAtIndex = isInCart(id);
    // foundAtIndex >=0 if element found
    if (isInCart(id) >= 0) {
      if (ordersList[foundAtIndex].num > 1) {
        ordersList[foundAtIndex].num--;
        itemsNum--;
      } else {
        ordersList.removeAt(foundAtIndex);
      }
      notifyListeners();
    } else {
      null;
    }
  }

  deleteFromOrderList(int id, String colorHexa, int num) {
    int foundAtIndex = ordersList.indexWhere((element) =>
        element.id == id &&
        element.colorHexa == colorHexa &&
        element.num == num);
    itemsNum = itemsNum - ordersList[foundAtIndex].num;
    totalPrice = totalPrice -
        double.parse(ordersList[foundAtIndex].price) *
            ordersList[foundAtIndex].num;
    ordersList.removeAt(foundAtIndex);
    notifyListeners();
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
    if (foundAtIndex >= 0) {
      return pieceNum[foundAtIndex].num.toString();
    }
    return '0';
  }

  void addToPieceNum(int id) {
    if (pieceNum.isEmpty) {
      pieceNum.add(PieceNum(id));
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
  int num = 0;
  String colorName = '';
  String colorHexa = '';
  String imgUrl = '';
  String price = '';
  Order(this.id, this.num, this.colorName, this.colorHexa, this.imgUrl,
      this.price);
}

class PieceColor {
  String selectedColor;
  PieceColor(this.selectedColor);
}
