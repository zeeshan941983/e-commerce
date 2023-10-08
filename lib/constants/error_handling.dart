import 'dart:convert';

import 'package:amazon/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showsnackbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showsnackbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showsnackbar(context, response.body);
  }
}
