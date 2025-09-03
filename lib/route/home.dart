import 'package:get/get.dart';
import 'package:todo_list/page/home/binding.dart';
import 'package:todo_list/page/home/view.dart';
import '../page/detail/view.dart';
import '../page/export.dart';

class HomeRoute {
  static const String home = '/home';
  static const String task = '/task';
  static const String detail = '/detail';
  static const String edit = '/edit';
  static const String signIn = '/sign_in';

  static final routes = <GetPage>[
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: task,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: detail,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: edit,
      page: () => const EditView(),
      binding: EditBinding(),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
  ];
}
