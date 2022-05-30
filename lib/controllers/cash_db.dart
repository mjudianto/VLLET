import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cashdb {
  late Box box;
  late SharedPreferences preferences;

  Cashdb() {
    openBox();
  }

  openBox() {
    box = Hive.box('cash');
  }

  void addData(String name, int amount) async {
    var value = {
      'name': name,
      'amount': amount,
    };
    box.add(value);
  }

  Future deleteData(
    int index,
  ) async {
    await box.deleteAt(index);
  }

  Future cleanData() async {
    await box.clear();
  }

  addName(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
    print("sukses" + name);
  }

  getName() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }

  setLocalAuth(bool val) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.setBool('auth', val);
  }

  Future<bool> getLocalAuth() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getBool('auth') ?? false;
  }
}
