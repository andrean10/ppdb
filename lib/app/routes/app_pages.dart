import 'package:get/get.dart';

import '../modules/admin/detail_candidates/bindings/detail_candidates_binding.dart';
import '../modules/admin/detail_candidates/views/detail_candidates_view.dart';
import '../modules/admin/list_candidates/bindings/list_candidates_binding.dart';
import '../modules/admin/list_candidates/views/list_candidates_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/admin/recapitulation/bindings/recapitulation_binding.dart';
import '../modules/admin/recapitulation/views/recapitulation_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_form/bindings/register_form_binding.dart';
import '../modules/register_form/views/register_form_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/user/about/bindings/about_binding.dart';
import '../modules/user/about/views/about_view.dart';
import '../modules/user/information/bindings/information_binding.dart';
import '../modules/user/information/views/information_view.dart';
import '../modules/user/prospective_student_data/bindings/prospective_student_data_binding.dart';
import '../modules/user/prospective_student_data/views/prospective_student_data_view.dart';
import '../modules/user/social_media/bindings/socmed_binding.dart';
import '../modules/user/social_media/views/socmed_view.dart';
import '../modules/user/upload_file/bindings/upload_file_binding.dart';
import '../modules/user/upload_file/views/upload_file_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.REGISTER_FORM,
      page: () => const RegisterFormView(),
      binding: RegisterFormBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => const InformationView(),
      binding: InformationBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.SOCIAL_MEDIA,
      page: () => const SocmedView(),
      binding: SocmedBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.PROSPECTIVE_STUDENT_DATA,
      page: () => const ProspectiveStudentDataView(),
      binding: ProspectiveStudentDataBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_FILE,
      page: () => const UploadFileView(),
      binding: UploadFileBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CANDIDATES,
      page: () => const ListCandidatesView(),
      binding: ListCandidatesBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CANDIDATES,
      page: () => const DetailCandidatesView(),
      binding: DetailCandidatesBinding(),
    ),
    GetPage(
      name: _Paths.RECAPITULATION,
      page: () => const RecapitulationView(),
      binding: RecapitulationBinding(),
    ),
  ];
}
