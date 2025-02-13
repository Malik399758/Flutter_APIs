import 'package:flutter/cupertino.dart';

class ProviderName extends ChangeNotifier{

  List<int> no = [1,2,3,4,5];

  void add(){
    var lastNo = no.last.toInt();
    no.add(lastNo+1);
    notifyListeners();
  }

}