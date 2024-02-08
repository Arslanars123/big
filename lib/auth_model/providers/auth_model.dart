import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../screens/menu_box.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> registerUser(String email, String password, String confirmPassword, BuildContext context) async {
    // Validate the email format
    if (!_isEmailValid(email)) {
      Fluttertoast.showToast(
        msg: "Invalid email format",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return; // Stop further execution if the email is invalid
    }

    String url = 'https://game-izq04ir1y-mughees110s-projects.vercel.app/api/register';

    // Define the request body
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
      // Add other key-value pairs as needed
    };

    // Convert the request body to JSON format
    String requestBodyJson = json.encode(requestBody);

    try {
      // Check Internet connectivity
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        Fluttertoast.showToast(
          msg: "No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      // Show loader while making the request
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Make the POST request
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add other headers as needed
        },
        body: requestBodyJson,
      );

      // Dismiss loader after receiving the response
      Navigator.of(context).pop();

      // Check the response status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Register Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuBox()),
        );
        print('Response: ${response.body}');
        // You can parse the response JSON if needed
        var responseData = json.decode(response.body);
        // Process the responseData
      } else {
        Fluttertoast.showToast(
          msg: "Something Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        print('Request failed with status: ${response.statusCode}');
        // Handle the error
      }
    } catch (error) {
      // Exception occurred during the request
      // Dismiss loader if still visible
      Navigator.of(context).pop();
      print('Error sending request: $error');
      // Handle the exception
    }
  }

// Function to validate email format
  bool _isEmailValid(String email) {
    // Use RegExp to check if the email follows a valid format
    // This pattern checks for a string followed by @ followed by another string, then a dot, and finally another string
    // The provided regular expression is a basic format check and might not cover all valid email formats
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }


}
