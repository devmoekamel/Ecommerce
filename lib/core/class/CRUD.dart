import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checknetwork.dart';
import 'status_response.dart';

class Crud {
  Future<Either<StatusResponse, Map>> PostData(String url, Map body) async {
    try {
      if (await check_network()) {
        var res = await http.post(Uri.parse(url), body: body);

        if (res.statusCode == 200 || res.statusCode == 201) {
          // if(res["data"]==)
          Map data = jsonDecode(res.body);

          return right(data);
        } else {
          return left(StatusResponse.serverfailure);
        }
      } else {
        return left(StatusResponse.networkfailure);
      }
    } catch (_) {
      return left(StatusResponse.serverfailure);
    }
  }
}
