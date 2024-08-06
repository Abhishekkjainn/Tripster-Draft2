import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster_draft2/controllers/airportcontroller.dart';
import 'package:tripster_draft2/resultsPages/ReturnResult.dart';
import 'package:http/http.dart' as http;

AirportController airportController = Get.find();

class ReturnController extends GetxController {
  late Map<String, dynamic> jsonData;
  late int tolength = 0;
  late int fromlength = 0;
  List AirlineList = [];
  List AirlineCode = [];
  List AirlineLicensed = [];
  List Flightname = [];
  List FlightType = [];
  List Stops = [];
  List Duration = [];
  List DepAirportCode = [];
  List DepAirportName = [];
  List DepCityCode = [];
  List DepCityName = [];
  List DepTerminal = [];
  List ArrAirportCode = [];
  List ArrAirportName = [];
  List ArrCityCode = [];
  List ArrCityName = [];
  List ArrTerminal = [];
  List DepTime = [];
  List DepDate = [];
  List ArrTime = [];
  List ArrDate = [];
  List isReturn = [];
  List isNextDay = [];
  List AdultPrices = [];
  List ChildPrices = [];
  List InfantPrices = [];
  List AdultBasePrices = [];
  List ChildBasePrices = [];
  List InfantBasePrices = [];
  List AdultTaxPrices = [];
  List ChildTaxPrices = [];
  List InfantTaxPrices = [];
  // late Map<String, dynamic> jsonData2;
  late int length2 = 0;
  List AirlineList2 = [];
  List AirlineCode2 = [];
  List AirlineLicensed2 = [];
  List Flightname2 = [];
  List FlightType2 = [];
  List Stops2 = [];
  List Duration2 = [];
  List DepAirportCode2 = [];
  List DepAirportName2 = [];
  List DepCityCode2 = [];
  List DepCityName2 = [];
  List DepTerminal2 = [];
  List ArrAirportCode2 = [];
  List ArrAirportName2 = [];
  List ArrCityCode2 = [];
  List ArrCityName2 = [];
  List ArrTerminal2 = [];
  List DepTime2 = [];
  List DepDate2 = [];
  List ArrTime2 = [];
  List ArrDate2 = [];
  List isReturn2 = [];
  List isNextDay2 = [];
  List AdultPrices2 = [];
  List ChildPrices2 = [];
  List InfantPrices2 = [];
  List AdultBasePrices2 = [];
  List ChildBasePrices2 = [];
  List InfantBasePrice2s = [];
  List AdultTaxPrices2 = [];
  List ChildTaxPrices2 = [];
  List InfantTaxPrices2 = [];

  String FromCity = '';
  String FromCityCode = '';
  String ToCity = '';
  String ToCityCode = '';

  cleanList() {
    AirlineList.clear();
    AirlineCode.clear();
    AirlineLicensed.clear();
    Flightname.clear();
    FlightType.clear();
    Stops.clear();
    Duration.clear();
    DepAirportCode.clear();
    DepAirportName.clear();
    DepCityCode.clear();
    DepCityName.clear();
    DepTerminal.clear();
    ArrAirportCode.clear();
    ArrAirportName.clear();
    ArrCityCode.clear();
    ArrCityName.clear();
    ArrTerminal.clear();
    DepTime.clear();
    DepDate.clear();
    ArrTime.clear();
    ArrDate.clear();
    isReturn.clear();
    isNextDay.clear();
    AdultPrices.clear();
    ChildPrices.clear();
    InfantPrices.clear();
    AdultBasePrices.clear();
    ChildBasePrices.clear();
    InfantBasePrices.clear();
    AdultTaxPrices.clear();
    ChildTaxPrices.clear();
    InfantTaxPrices.clear();
    //
    AirlineList2.clear();
    AirlineCode2.clear();
    AirlineLicensed2.clear();
    Flightname2.clear();
    FlightType2.clear();
    Stops2.clear();
    Duration2.clear();
    DepAirportCode2.clear();
    DepAirportName2.clear();
    DepCityCode2.clear();
    DepCityName2.clear();
    DepTerminal2.clear();
    ArrAirportCode2.clear();
    ArrAirportName2.clear();
    ArrCityCode2.clear();
    ArrCityName2.clear();
    ArrTerminal2.clear();
    DepTime2.clear();
    DepDate2.clear();
    ArrTime2.clear();
    ArrDate2.clear();
    isReturn2.clear();
    isNextDay2.clear();
    AdultPrices2.clear();
    ChildPrices2.clear();
    InfantPrices2.clear();
    AdultBasePrices2.clear();
    ChildBasePrices2.clear();
    InfantBasePrice2s.clear();
    AdultTaxPrices2.clear();
    ChildTaxPrices2.clear();
    InfantTaxPrices2.clear();
  }

  populateLists() {
    cleanList();
    for (int i = 0; i < fromlength; i++) {
      AirlineList2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['name']);
      AirlineCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['aI']['code']);
      AirlineLicensed2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['fD']['aI']['isLcc']);
      Flightname2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['fN']);
      FlightType2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['fD']['eT']);
      Stops2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['stops']);
      Duration2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]
          ['duration']);
      DepAirportCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['code']);
      DepAirportName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['da']['name']);
      DepCityCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['code']);
      DepCityName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['city']);
      DepTerminal2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['da']['terminal']);
      ArrAirportCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['code']);
      ArrAirportName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['sI'][0]['aa']['name']);
      ArrCityCode2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['code']);
      ArrCityName2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['city']);
      ArrTerminal2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]['sI']
          [0]['aa']['terminal']);
      DepTime2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);
      DepDate2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['dt']);
      ArrTime2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);
      ArrDate2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['at']);
      isReturn2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['isRs']);
      isNextDay2.add(
          jsonData['searchResult']['tripInfos']['RETURN'][i]['sI'][0]['iand']);
      AdultPrices2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      AdultTaxPrices2.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
    }

    for (int i = 0; i < tolength; i++) {
      AirlineList.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['fD']['aI']['name']);
      AirlineCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['fD']['aI']['code']);
      AirlineLicensed.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['fD']['aI']['isLcc']);
      Flightname.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['fD']['fN']);
      FlightType.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['fD']['eT']);
      Stops.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['stops']);
      Duration.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]
          ['duration']);
      DepAirportCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['da']['code']);
      DepAirportName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['da']['name']);
      DepCityCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['code']);
      DepCityName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['city']);
      DepTerminal.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['da']['terminal']);
      ArrAirportCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['aa']['code']);
      ArrAirportName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['sI'][0]['aa']['name']);
      ArrCityCode.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['code']);
      ArrCityName.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['city']);
      ArrTerminal.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI']
          [0]['aa']['terminal']);
      DepTime.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['dt']);
      DepDate.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['dt']);
      ArrTime.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['at']);
      ArrDate.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['at']);
      isReturn.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['isRs']);
      isNextDay.add(
          jsonData['searchResult']['tripInfos']['ONWARD'][i]['sI'][0]['iand']);
      AdultPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TF']);
      AdultTaxPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
          ['totalPriceList'][0]['fd']['ADULT']['fC']['TAF']);
      // InfantPrices.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
      //     ['totalPriceList'][1]['fd']['INFANT']['fC']['TF']);
      // ChildPrices.add(jsonData['searchResult']['tripInfos']['RETURN'][i]
      //     ['totalPriceList'][1]['fd']['CHILD']['fC']['TF']);

      //Return
    }
    AdultPrices =
        AdultPrices.map((number) => number * airportController.Adults).toList();
    AdultTaxPrices =
        AdultTaxPrices.map((number) => number * airportController.Adults)
            .toList();
    AdultPrices2 =
        AdultPrices2.map((number) => number * airportController.Adults)
            .toList();
    AdultTaxPrices2 =
        AdultTaxPrices2.map((number) => number * airportController.Adults)
            .toList();
  }

  // final searchRequest = {
  //   "searchQuery": {
  //     "cabinClass": airportController.SelectedCabin,
  //     "paxInfo": {
  //       "ADULT": airportController.Adults,
  //       "CHILD": airportController.Child,
  //       "INFANT": "0"
  //     },
  //     "routeInfos": [
  //       {
  //         "fromCityOrAirport": {"code": airportController.fromAirportCode},
  //         "toCityOrAirport": {"code": airportController.toAirportCode},
  //         "travelDate":
  //             "${airportController.OnewayDate.toString().substring(0, 10)}"
  //       }
  //     ],
  //     "searchModifiers": {}
  //   },
  // };

  // final returnRequest = {
  //   "searchQuery": {
  //     "cabinClass": airportController.SelectedCabin,
  //     "paxInfo": {
  //       "ADULT": airportController.Adults,
  //       "CHILD": airportController.Child,
  //     },
  //     "routeInfos": [
  //       {
  //         "fromCityOrAirport": {"code": airportController.fromAirportCode},
  //         "toCityOrAirport": {"code": airportController.toAirportCode},
  //         "travelDate": airportController.RoundTripStart
  //       },
  //       {
  //         "fromCityOrAirport": {"code": airportController.toAirportCode},
  //         "toCityOrAirport": {"code": airportController.fromAirportCode},
  //         "travelDate": airportController.RoundTripEnds
  //       }
  //     ],
  //     "preferredAirline": [
  //       {"code": "SG"},
  //       {"code": "6E"}
  //     ],
  //     "searchModifiers": {"isDirectFlight": true, "isConnectingFlight": false}
  //   }
  // };
  var searchResults = {}.obs;
  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124573b4f6b20-4932-42e2-9d81-bd013141861a',
    'Content-Type': 'application/json'
  };

  Future<void> doSearch(Map<String, dynamic> returnRequest) async {
    const String endpoint = '/fms/v1/air-search-all';
    final String url = '$apiUrl$endpoint';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(returnRequest),
      );

      print('Request: ${response.request}');
      print('Response: ${response.body}');

      if (response.statusCode == 200) {
        searchResults.value = jsonDecode(response.body);
        jsonData = jsonDecode(response.body);
        tolength = jsonData['searchResult']['tripInfos']['ONWARD'].length;
        fromlength = jsonData['searchResult']['tripInfos']['RETURN'].length;
        print(tolength.toString());
        print(fromlength.toString());
        populateLists();
        update();
      } else {
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: const Color.fromARGB(255, 50, 48, 48),
            isDismissible: true);
        print('Error Response: ${response.body}');
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      update();
    }
  }

  void handleStopRadioValueChange(bool? value) {}
}
