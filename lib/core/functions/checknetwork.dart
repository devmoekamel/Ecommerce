import 'dart:io';

check_network()async{
  try {
      var result = await InternetAddress.lookup('example.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
      {
        return true;
      }


      
    } on SocketException catch (_) {

         return false ;


}}