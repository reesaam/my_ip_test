import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ip_test/core/app_info.dart';
import 'package:my_ip_test/core/core_elements/core_widgets.dart';
import 'package:my_ip_test/core/developr_info.dart';
import 'package:my_ip_test/core/resources/app_progress_indicator.dart';
import 'package:my_ip_test/core/resources/app_text_styles.dart';
import 'package:my_ip_test/core/resources/app_texts.dart';
import 'package:my_ip_test/features/home/presentation/manager/get_last_ip_cubit_state/get_last_ip_cubit.dart';
import 'package:my_ip_test/features/home/presentation/manager/get_last_ip_cubit_state/get_last_ip_state.dart';

import '../../../../core/dependency_injection/di.dart';
import '../manager/ip_cubit_state/ip_cubit.dart';
import '../manager/ip_cubit_state/ip_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubitIp = diCore<IpCubit>();
  final cubitLastIp = diCore<GetLastIpCubit>();

  blocIp() => BlocBuilder<IpCubit, IpState>(builder: (context, state) {
        return state.whenOrNull(
                //Success State
                success: (data) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(AppTexts.homepageYourIP,
                              style: AppTextStyles.homepageYourIp),
                          spaceSizedBoxMedium,
                          Text(data?.ip ?? '', style: AppTextStyles.homepageIp),
                        ]),
                //Loading State
                loading: () => AppProgressIndicator.main) ??
            //Default - Init State
            Text(AppInfo.appName, style: AppTextStyles.homepageAppName);
      });

  blocLastIp() =>
      BlocBuilder<GetLastIpCubit, GetLastIpState>(builder: (context, state) {
        return state.whenOrNull(
                //Success State
                success: (data) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          data == null
                              ? Text(AppTexts.homepageLastIpNotAvailable)
                              : Text(AppTexts.homepageLastIP,
                                  style: AppTextStyles.homepageYourIp),
                          Text('${AppTexts.at}: ${data!.dateTime.toString()}'),
                          spaceSizedBoxMedium,
                          Text(data.ip!, style: AppTextStyles.homepageIp),
                        ]),
                //Loading State
                loading: () => AppProgressIndicator.main) ??
            //Default - Init State
            Text(AppTexts.homepageRetrieveIp,
                style: AppTextStyles.homepageAppName);
      });

  Widget widgetDeveloperInfo() => Column(children: [
    Text('by ${AppDeveloperInfo.fullName}')
  ]);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            cubitIp.getIP();
            return cubitIp;
          }),
          BlocProvider(create: (context) {
            cubitLastIp.getLastIp();
            return cubitLastIp;
          }),
        ],
        child: coreScaffold(Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [blocIp(), blocLastIp(), widgetDeveloperInfo()])));
  }
}

//
// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final cubitIp = diCore<IpCubit>();
//   final cubitLastIp = diCore<GetLastIpCubit>();
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) {
//             cubitIp.getIP();
//             return cubitIp;
//           }),
//           BlocProvider(create: (context) {
//             cubitLastIp.getLastIp();
//             return cubitLastIp;
//           }),
//         ],
//         child: coreScaffold(Column(children: [blocIp(), blocLastIp()])));
//   }
//
//   blocIp() =>
//       BlocBuilder<IpCubit, IpState>(builder: (context, state) {
//         return state.whenOrNull(
//                 //Success State
//                 success: (data) => Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(AppTexts.homepageYourIP,
//                               style: AppTextStyles.homepageYourIp),
//                           spaceSizedBoxMedium,
//                           Text(data?.ip ?? '', style: AppTextStyles.homepageIp),
//                         ]),
//                 //Loading State
//                 loading: () => AppProgressIndicator.main) ??
//             //Default - Init State
//             Text(AppInfo.appName, style: AppTextStyles.homepageAppName);
//       });
//
//   blocLastIp() =>
//       BlocBuilder<GetLastIpCubit, GetLastIpState>(builder: (context, state) {
//         return state.whenOrNull(
//                 //Success State
//                 success: (data) => Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           data == null
//                               ? Text(AppTexts.homepageLastIpNotAvailable)
//                               : Text(AppTexts.homepageLastIP,
//                                   style: AppTextStyles.homepageYourIp),
//                           Text('${AppTexts.at}: ${data!.dateTime.toString()}'),
//                           spaceSizedBoxMedium,
//                           Text(data.ip!, style: AppTextStyles.homepageIp),
//                         ]),
//                 //Loading State
//                 loading: () => AppProgressIndicator.main) ??
//             //Default - Init State
//             Text(AppTexts.homepageRetrieveIp,
//                 style: AppTextStyles.homepageAppName);
//       });
// }
