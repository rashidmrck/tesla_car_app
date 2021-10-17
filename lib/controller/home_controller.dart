import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  bool rightLockStatus = true;
  bool leftLockStatus = true;
  bool topLockStatus = true;
  bool bottomLockStatus = true;

  void changeRightLockStatus() {
    rightLockStatus = !rightLockStatus;
    notifyListeners();
  }
  void changeLeftLockStatus() {
    leftLockStatus = !leftLockStatus;
    notifyListeners();
  }
  void changeTopLockStatus() {
    topLockStatus = !topLockStatus;
    notifyListeners();
  }
  void changeBottomLockStatus() {
    bottomLockStatus = !bottomLockStatus;
    notifyListeners();
  }
  // void changeLeftLockStatus() {
  //   doorLockStatus = !doorLockStatus;
  //   notifyListeners();
  // }
  // void changeDoorLockStatus() {
  //   doorLockStatus = !doorLockStatus;
  //   notifyListeners();
  // }
}
