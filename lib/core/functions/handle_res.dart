

import '../class/status_response.dart';

handle_Res(response)
{
 if(response is StatusResponse)
 {
    return response ;
 }else{
  return StatusResponse.success;
 }

}