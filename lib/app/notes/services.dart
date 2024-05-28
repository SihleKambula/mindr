import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NoteServices {
  //Start recording
  void recordEvent(RecorderController controller) async {
    final hasPermission = await controller.checkPermission();
    if (hasPermission) {
      controller.androidOutputFormat = AndroidOutputFormat.mpeg4;
      await controller.record();
    } else {
      print('Require permission');
    }
  }

  // Stop recording
  void recordEventStop(RecorderController controller) async {
    final path = await controller.stop();
    sendRecordToAI(path!);
    controller.refresh();
  }

  void getData() async {
    var url = Uri.http('3e7c-192-143-86-73.ngrok-free.app', 'mindr');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(res.body) as Map<String, dynamic>;
      print(jsonResponse['message']);
    }
  }

  //Send recording to AI backend
  void sendRecordToAI(String filePath) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://3e7c-192-143-86-73.ngrok-free.app/mindr'));

    // add file
    request.files.add(await http.MultipartFile.fromPath('event', filePath));

    // add headers
    request.headers.addAll({"Content-type": "multipart/form-data"});

    // send
    var res = await request.send();
    if (res.statusCode == 200) {
      var data = await http.Response.fromStream(res);
      var jsonResponse = convert.jsonDecode(data.body) as Map<String, dynamic>;
      print(jsonResponse);
    }
  }
}
