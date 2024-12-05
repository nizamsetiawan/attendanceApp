import 'package:dartz/dartz.dart';
import 'package:facedivi/core/constants/variables.dart';
import 'package:facedivi/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class NotesRemoteDatasource {
  Future<Either<String, String>> addNotes(
      String title, String note
      ) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-notes');
    final headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    };
    var request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['title'] = title;
    request.fields['note'] = note;

    http.StreamedResponse response = await request.send();
    final String body = await response.stream.bytesToString();

    if(response.statusCode == 201) {
      return const Right('Note added successfully');
    } else {
      return const Left('Failed to add note');
    }

  }

}