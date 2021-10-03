import 'package:get/get.dart';

import 'package:police_info_system/app/modules/add_report/bindings/add_report_binding.dart';
import 'package:police_info_system/app/modules/add_report/views/add_report_view.dart';
import 'package:police_info_system/app/modules/approve_officers/bindings/approve_officers_binding.dart';
import 'package:police_info_system/app/modules/approve_officers/views/approve_officers_view.dart';
import 'package:police_info_system/app/modules/help/bindings/help_binding.dart';
import 'package:police_info_system/app/modules/help/views/help_view.dart';
import 'package:police_info_system/app/modules/home/bindings/home_binding.dart';
import 'package:police_info_system/app/modules/home/views/home_view.dart';
import 'package:police_info_system/app/modules/login/bindings/login_binding.dart';
import 'package:police_info_system/app/modules/login/views/login_view.dart';
import 'package:police_info_system/app/modules/officer_details/bindings/officer_details_binding.dart';
import 'package:police_info_system/app/modules/officer_details/views/officer_details_view.dart';
import 'package:police_info_system/app/modules/police_info/bindings/police_info_binding.dart';
import 'package:police_info_system/app/modules/police_info/views/police_info_view.dart';
import 'package:police_info_system/app/modules/query/bindings/query_binding.dart';
import 'package:police_info_system/app/modules/query/views/query_view.dart';
import 'package:police_info_system/app/modules/registration/bindings/registration_binding.dart';
import 'package:police_info_system/app/modules/registration/views/registration_view.dart';
import 'package:police_info_system/app/modules/report/bindings/report_binding.dart';
import 'package:police_info_system/app/modules/report/views/report_view.dart';
import 'package:police_info_system/app/modules/reports/bindings/reports_binding.dart';
import 'package:police_info_system/app/modules/reports/views/reports_view.dart';
import 'package:police_info_system/app/modules/settings/bindings/settings_binding.dart';
import 'package:police_info_system/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),

    GetPage(
      name: _Paths.APPROVE_OFFICERS,
      page: () => ApproveOfficersView(),
      binding: ApproveOfficersBinding(),
    ),
    // GetPage(
    //   name: _Paths.TEST,
    //   page: () => TestView(),
    //   binding: TestBinding(),
    // ),
    GetPage(
      name: _Paths.OFFICER_DETAILS,
      page: () => OfficerDetailsView(),
      binding: OfficerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.POLICE_INFO,
      page: () => PoliceInfoView(),
      binding: PoliceInfoBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.QUERY,
      page: () => QueryView(),
      binding: QueryBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_REPORT,
      page: () => AddReportView(),
      binding: AddReportBinding(),
    ),
  ];
}
