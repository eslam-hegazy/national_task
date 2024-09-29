import 'package:get/get.dart';
import 'package:national_task/features/home/screens/tabs/favourite_screen.dart';
import 'package:national_task/features/home/screens/tabs/question_screen.dart';

class HomeController extends GetxController {
  var currentScreenIndex=0.obs;
  final screens =  [
    QuestionScreen(),
    FavouriteScreen(),
  ];
}
