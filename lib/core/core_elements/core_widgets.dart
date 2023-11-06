import 'package:flutter/material.dart';

Widget coreScaffold(Widget body) => Scaffold(
    body: SafeArea(child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: body)));

Widget get shrinkSizedBox => const SizedBox.shrink();

Widget get shrinkOneExpanded =>
    const Expanded(flex: 1, child: SizedBox.shrink());

Widget get spaceSizedBoxMedium => const SizedBox(height: 20);
