import 'package:get/route_manager.dart';
import 'package:proyectoapp/ui/pages/chat.dart';
import 'package:proyectoapp/ui/pages/home.dart';
import 'package:proyectoapp/ui/pages/login.dart';
import 'package:proyectoapp/ui/pages/register.dart';


routes() => [

  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/registration', page: () => RegisterPage()),
  GetPage(name: '/chat', page: () => ChatPage(title:'Chat')),
  
];