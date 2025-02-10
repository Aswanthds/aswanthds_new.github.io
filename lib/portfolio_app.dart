import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'config/theme_manager.dart';
import 'presentation/blocs/home_bloc/home_bloc.dart';
import 'presentation/views/home_view.dart';
import 'package:http/http.dart' as http;

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    getdata();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme(),
      title: 'Aswanth DS',
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const HomeView(),
      ),
    );
  }
}

void getdata() async {
  try {
    final token =
        await AuthService().login("jesbinjose57@gmail.com", "password");
    print('Token: $token');
  } catch (e) {
    print('Error: $e');
  }
}



class AuthService {
  final String baseUrl =
      'https://backendrealchat.molla.cloud';  // Replace with your actual base URL
  static const String loginEndpoint = '/token/';

  Future<String> login(String username, String password) async {

    // Prepare data (assuming username and password login)
    final data = {
      "name": "Jupiter",
      "avatar":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1021.jpg",
      "id": "4"
    };

    try {
      final response = await http.post(
        Uri.parse("https://6635149d9bb0df2359a3c161.mockapi.io/test/users"),
        body: jsonEncode(data),
        headers: {
          'Content-Type' : "application/json",
        }
      );

      if (response.statusCode == 200) {
        // Extract token from response (modify based on your API response format)
        final token = jsonDecode(response.body) as Map<String,dynamic>; // Replace with the actual key in your response
        return token['access'];
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error during login: ${e.message}');
    }
  }
}
