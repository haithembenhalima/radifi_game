import 'package:shared_preferences/shared_preferences.dart';
class ScoreFunctions{

  setScore(String categorie,int value) async
  {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(categorie, value);

  }
  
  Future<int?> getScore(String categorie) async
  {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int? value = prefs.getInt(categorie);
  return value;
  }
  
}