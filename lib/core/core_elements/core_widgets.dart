import 'package:flutter/material.dart';

Widget coreScaffold(Widget body) => SafeArea(
    child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Center(child: body))));

Widget get shrinkSizedBox => const SizedBox.shrink();

Widget get shrinkOneExpanded => const Expanded(flex: 1, child: SizedBox.shrink());

Widget get spaceSizedBoxMedium => const SizedBox(height: 20);
