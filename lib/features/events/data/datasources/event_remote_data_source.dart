// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:faro_clean_tdd/core/errors/exceptions.dart';
import 'package:faro_clean_tdd/features/events/data/models/event_model.dart';
import 'package:http/http.dart' as http;

abstract class EventRemoteDatasource {
  /// Fait une requête à http://localhost:3001/events
  ///
  /// Jette une [ServerException] en cas d'erreur
  Future<List<EventModel>> fetchAllEvents();

  // fait une requête à http://localhost:3001/event/create
  Future<EventModel> postAnEvent({
    required EventModel event,
    required File image,
  });

  /// Fait une requête à http://localhost:3001/event/:id/
  ///
  /// Jette une [ServerException] en cas d'erreur
  ///
  Future<EventModel> updateAnEvent(
      {required EventModel event, required File image});

  /// Fait une requête à http://localhost:3001/event/:id/
  ///
  /// Jette une [ServerException] en cas d'erreur
  ///
  Future<EventModel> activateAnEvent({required int eventId});

  Future<EventModel> closeAnEvent({required int eventId});
}

const FETCH_URL = 'http://192.168.1.27:3000/events';
const POST_EVENT_URL = 'http://192.168.1.27:3000/events';

class EventRemoteDatasourceImpl implements EventRemoteDatasource {
  const EventRemoteDatasourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<EventModel>> fetchAllEvents() async {
    // initialisation des variables
    List<EventModel> events = [];
    final uri = Uri.parse(FETCH_URL);

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> array = json.decode(response.body);
      for (var element in array) {
        events.add(EventModel.fromJson(element));
      }
      return events;
    } else {
      // Si la requête est infructueuse
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<EventModel> postAnEvent(
      {required EventModel event, required File image}) async {
    // initialisation des variables
    final Map<String, dynamic> myEvent = event.toJson();
    final uri = Uri.parse(POST_EVENT_URL);

    var request = http.MultipartRequest('POST', uri)
      ..headers['Content-Type'] = 'multipart/form-data';

    myEvent.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    request.files.add(http.MultipartFile(
      'photo',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: 'event_image.jpg',
    ));

    // fait la requête au serveur
    var response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 201) {
      return EventModel.fromJson(json.decode(response.body)["event"]);
    } else if (response.statusCode == 422) {
      final errorList = json.decode(response.body)["errors"];
      throw ServerException(errorMessage: errorList[0]);
    } else {
      // Si la requête est infructueuse
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<EventModel> updateAnEvent(
      {required EventModel event, required File image}) async {
    // initialisation des variables
    final Map<String, dynamic> myEvent = event.toJson();
    final uri = Uri.parse('$POST_EVENT_URL/${event.id}');

    var request = http.MultipartRequest('POST', uri)
      ..headers['Content-Type'] = 'multipart/form-data';

    myEvent.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    request.files.add(http.MultipartFile(
      'photo',
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: 'event_image.jpg',
    ));

    // fait la requête au serveur
    var response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      return EventModel.fromJson(json.decode(response.body)["event"]);
    } else if (response.statusCode == 422) {
      final errorList = json.decode(response.body)["errors"];
      throw ServerException(errorMessage: errorList[0]);
    } else {
      // Si la requête est infructueuse
      throw ServerException(errorMessage: response.body);
    }
  }

  @override
  Future<EventModel> activateAnEvent({required int eventId}) async {
    final uri = Uri.parse('$POST_EVENT_URL/$eventId/update_activation');
    final params = {"activated": true};

    final response = await client.put(uri,
        headers: {"Content-Type": 'application/json'},
        body: json.encode(params));

    final bool isSuccess =
        response.statusCode >= 200 && response.statusCode < 300;

    if (isSuccess) {
      return EventModel.fromJson(json.decode(response.body)["event"]);
    }
    if (response.statusCode == 404) {
      throw ServerException(errorMessage: "Not found");
    }
    if (response.statusCode == 422) {
      throw ServerException(errorMessage: json.decode(response.body)["errors"]);
    }

    throw ServerException(
        errorMessage: "An error as occured. Please try again later");
  }

  @override
  Future<EventModel> closeAnEvent({required int eventId}) async {
    final uri = Uri.parse('$POST_EVENT_URL/$eventId/update_close');
    final params = {
      "closed": true,
    };

    final response = await client.put(uri,
        headers: {"Content-Type": 'application/json'},
        body: json.encode(params));

    final bool isSuccess =
        response.statusCode >= 200 && response.statusCode < 300;

    if (isSuccess) {
      return EventModel.fromJson(json.decode(response.body)["event"]);
    }
    if (response.statusCode == 404) {
      throw ServerException(errorMessage: "Not found");
    }
    if (response.statusCode == 422) {
      throw ServerException(errorMessage: json.decode(response.body)["errors"]);
    }

    throw ServerException(
        errorMessage: "An error as occured. Please try again later");
  }

  //
}
