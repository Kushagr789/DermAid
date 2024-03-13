import 'package:shared_preferences/shared_preferences.dart';

class Login_shared_preference{
  Future<bool> autoLogin() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final String? user=prefs.getString('userId');
    if(user.toString()!='null')
      return true;
    return false;
  }
  Future<Null>loginUser({required String? userId,required String? email}) async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('userId', userId.toString());
  }
  Future<Null>logout() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('userId', null.toString());
  }

}