import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ip_test/core/app_info.dart';
import 'package:my_ip_test/core/core_elements/core_widgets.dart';
import 'package:my_ip_test/core/resources/app_progress_indicator.dart';
import 'package:my_ip_test/core/resources/app_text_styles.dart';
import 'package:my_ip_test/core/resources/app_texts.dart';

import '../../../../core/dependency_injection/di.dart';
import '../manager/ip_cubit.dart';
import '../manager/ip_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = diCore<IpCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            cubit.getIP();
            return cubit;
          })
        ],
        child: coreScaffold(BlocBuilder<IpCubit, IpState>(
          builder: (context, state) {
            return state.whenOrNull(
                    //Success State
                    success: (data) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(AppTexts.homepageYourIP,
                                  style: AppTextStyles.homepageYourIp),
                              spaceSizedBoxMedium,
                              Text(data?.ip ?? '',
                                  style: AppTextStyles.homepageIp),
                            ]),
                    //Loading State
                    loading: () => AppProgressIndicator.main) ??
                //Default - Init State
                Text(AppInfo.appName, style: AppTextStyles.homepageAppName);
          },
        )));
  }
}
