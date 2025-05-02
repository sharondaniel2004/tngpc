// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tngpc/constants/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Get.toNamed("authenticationtypepage");
    });
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: tWhite,
      body: SafeArea(
        child: Center(
          child: Container(
            height: screensize.height * 0.5,
            width: screensize.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://d3lzcn6mbbadaf.cloudfront.net/media/details/ANI-20240129133048.jpg',
                  ),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
