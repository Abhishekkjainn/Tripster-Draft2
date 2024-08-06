import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tripster_draft2/controllers/airportcontroller.dart';

class OnewayController extends GetxController {
  AirportController airportController = Get.find();
  late Map<String, dynamic> jsonData;
  late int length = 0;
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
  }

  PopulateLists() {
    cleanList();
    for (int i = 0; i < length; i++) {
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
      // InfantPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
      //     ['totalPriceList'][1]['fd']['INFANT']['fC']['TF']);
      // ChildPrices.add(jsonData['searchResult']['tripInfos']['ONWARD'][i]
      //     ['totalPriceList'][1]['fd']['CHILD']['fC']['TF']);
    }
    AdultPrices =
        AdultPrices.map((number) => number * airportController.Adults).toList();
    AdultTaxPrices =
        AdultTaxPrices.map((number) => number * airportController.Adults)
            .toList();
  }

  bool nonstop = true;
  void handleStopRadioValueChange(bool? value) {
    nonstop = value!;
    sortListsByStops(value);
    update();
  }

  bool prices = true;
  void handlePricesRadioValueChange(bool? value) {
    prices = value!;
    (prices == true) ? sortListsByPricesdec() : sortListsByPricesinc();
    update();
  }

  sortListsByPricesdec() {
    List<int> sortedIndexes = List.generate(length, (index) => index);
    sortedIndexes.sort((a, b) => AdultPrices[a].compareTo(AdultPrices[b]));

    AirlineList = sortedIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = sortedIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        sortedIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = sortedIndexes.map((index) => Flightname[index]).toList();
    FlightType = sortedIndexes.map((index) => FlightType[index]).toList();
    Stops = sortedIndexes.map((index) => Stops[index]).toList();
    Duration = sortedIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        sortedIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        sortedIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = sortedIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = sortedIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = sortedIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        sortedIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        sortedIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = sortedIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = sortedIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = sortedIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = sortedIndexes.map((index) => DepTime[index]).toList();
    DepDate = sortedIndexes.map((index) => DepDate[index]).toList();
    ArrTime = sortedIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = sortedIndexes.map((index) => ArrDate[index]).toList();
    isReturn = sortedIndexes.map((index) => isReturn[index]).toList();
    isNextDay = sortedIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = sortedIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = sortedIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = sortedIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices =
    //     sortedIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices =
    //     sortedIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices =
    //     sortedIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        sortedIndexes.map((index) => AdultTaxPrices[index]).toList();
    // ChildTaxPrices =
    //     sortedIndexes.map((index) => ChildTaxPrices[index]).toList();
    // InfantTaxPrices =
    //     sortedIndexes.map((index) => InfantTaxPrices[index]).toList();
  }

  sortListsByPricesinc() {
    // Create a list of indexes corresponding to the length of AdultPrices
    List<int> indexes = List<int>.generate(AdultPrices.length, (i) => i);

    // Sort the indexes based on the values in AdultPrices in ascending order
    indexes.sort((a, b) => AdultPrices[a].compareTo(AdultPrices[b]));

    // Reverse the sorted index list to get descending order
    List<int> sortedIndexes = indexes.reversed.toList();

    // Reorder all lists based on the reversed sorted index list
    AirlineList = sortedIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = sortedIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        sortedIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = sortedIndexes.map((index) => Flightname[index]).toList();
    FlightType = sortedIndexes.map((index) => FlightType[index]).toList();
    Stops = sortedIndexes.map((index) => Stops[index]).toList();
    Duration = sortedIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        sortedIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        sortedIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = sortedIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = sortedIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = sortedIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        sortedIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        sortedIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = sortedIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = sortedIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = sortedIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = sortedIndexes.map((index) => DepTime[index]).toList();
    DepDate = sortedIndexes.map((index) => DepDate[index]).toList();
    ArrTime = sortedIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = sortedIndexes.map((index) => ArrDate[index]).toList();
    isReturn = sortedIndexes.map((index) => isReturn[index]).toList();
    isNextDay = sortedIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = sortedIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = sortedIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = sortedIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices =
    //     sortedIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices =
    //     sortedIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices =
    //     sortedIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        sortedIndexes.map((index) => AdultTaxPrices[index]).toList();
    // ChildTaxPrices =
    //     sortedIndexes.map((index) => ChildTaxPrices[index]).toList();
    // InfantTaxPrices =
    //     sortedIndexes.map((index) => InfantTaxPrices[index]).toList();
  }

  sortListsByDuration(int dur) {
    // Create a list of indexes corresponding to the length of Duration
    List<int> indexes = List<int>.generate(Duration.length, (i) => i);

    // Filter indexes to only those with Duration less than 120 minutes
    List<int> filteredIndexes =
        indexes.where((i) => Duration[i] < dur).toList();
    print(filteredIndexes.length);
    length = filteredIndexes.length;

    // Sort the filtered indexes based on the values in Duration in ascending order
    filteredIndexes.sort((a, b) => Duration[a].compareTo(Duration[b]));

    // Reorder all lists based on the filtered sorted index list
    AirlineList = filteredIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = filteredIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        filteredIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = filteredIndexes.map((index) => Flightname[index]).toList();
    FlightType = filteredIndexes.map((index) => FlightType[index]).toList();
    Stops = filteredIndexes.map((index) => Stops[index]).toList();
    Duration = filteredIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        filteredIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        filteredIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = filteredIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = filteredIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = filteredIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        filteredIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        filteredIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = filteredIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = filteredIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = filteredIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = filteredIndexes.map((index) => DepTime[index]).toList();
    DepDate = filteredIndexes.map((index) => DepDate[index]).toList();
    ArrTime = filteredIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = filteredIndexes.map((index) => ArrDate[index]).toList();
    isReturn = filteredIndexes.map((index) => isReturn[index]).toList();
    isNextDay = filteredIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = filteredIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = filteredIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = filteredIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices = filteredIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices = filteredIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices = filteredIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        filteredIndexes.map((index) => AdultTaxPrices[index]).toList();
    // ChildTaxPrices = filteredIndexes.map((index) => ChildTaxPrices[index]).toList();
    // InfantTaxPrices = filteredIndexes.map((index) => InfantTaxPrices[index]).toList();

    update();
  }

  sortListsByStops(bool nonStop) {
    // Create a list of indexes corresponding to the length of Stops
    List<int> indexes = List<int>.generate(Stops.length, (i) => i);

    // Filter indexes based on the nonStop flag
    List<int> filteredIndexes;
    if (nonStop) {
      filteredIndexes = indexes.where((i) => Stops[i] == 0).toList();
    } else {
      filteredIndexes = indexes.where((i) => Stops[i] > 0).toList();
    }

    length = filteredIndexes.length;

    // Reorder all lists based on the filtered index list
    AirlineList = filteredIndexes.map((index) => AirlineList[index]).toList();
    AirlineCode = filteredIndexes.map((index) => AirlineCode[index]).toList();
    AirlineLicensed =
        filteredIndexes.map((index) => AirlineLicensed[index]).toList();
    Flightname = filteredIndexes.map((index) => Flightname[index]).toList();
    FlightType = filteredIndexes.map((index) => FlightType[index]).toList();
    Stops = filteredIndexes.map((index) => Stops[index]).toList();
    Duration = filteredIndexes.map((index) => Duration[index]).toList();
    DepAirportCode =
        filteredIndexes.map((index) => DepAirportCode[index]).toList();
    DepAirportName =
        filteredIndexes.map((index) => DepAirportName[index]).toList();
    DepCityCode = filteredIndexes.map((index) => DepCityCode[index]).toList();
    DepCityName = filteredIndexes.map((index) => DepCityName[index]).toList();
    DepTerminal = filteredIndexes.map((index) => DepTerminal[index]).toList();
    ArrAirportCode =
        filteredIndexes.map((index) => ArrAirportCode[index]).toList();
    ArrAirportName =
        filteredIndexes.map((index) => ArrAirportName[index]).toList();
    ArrCityCode = filteredIndexes.map((index) => ArrCityCode[index]).toList();
    ArrCityName = filteredIndexes.map((index) => ArrCityName[index]).toList();
    ArrTerminal = filteredIndexes.map((index) => ArrTerminal[index]).toList();
    DepTime = filteredIndexes.map((index) => DepTime[index]).toList();
    DepDate = filteredIndexes.map((index) => DepDate[index]).toList();
    ArrTime = filteredIndexes.map((index) => ArrTime[index]).toList();
    ArrDate = filteredIndexes.map((index) => ArrDate[index]).toList();
    isReturn = filteredIndexes.map((index) => isReturn[index]).toList();
    isNextDay = filteredIndexes.map((index) => isNextDay[index]).toList();
    AdultPrices = filteredIndexes.map((index) => AdultPrices[index]).toList();
    // ChildPrices = filteredIndexes.map((index) => ChildPrices[index]).toList();
    // InfantPrices = filteredIndexes.map((index) => InfantPrices[index]).toList();
    // AdultBasePrices = filteredIndexes.map((index) => AdultBasePrices[index]).toList();
    // ChildBasePrices = filteredIndexes.map((index) => ChildBasePrices[index]).toList();
    // InfantBasePrices = filteredIndexes.map((index) => InfantBasePrices[index]).toList();
    AdultTaxPrices =
        filteredIndexes.map((index) => AdultTaxPrices[index]).toList();
    // ChildTaxPrices = filteredIndexes.map((index) => ChildTaxPrices[index]).toList();
    // InfantTaxPrices = filteredIndexes.map((index) => InfantTaxPrices[index]).toList();

    update();
  }

  var isLoading = false;
  var searchResults = {}.obs;

  String apikey = '7114311e6a5e4f-ae3b-4988-9291-c9d3bca23bca';
  String apiUrl = 'https://apitest.tripjack.com';
  Map<String, String> headers = {
    'apikey': '6124573b4f6b20-4932-42e2-9d81-bd013141861a',
    'Content-Type': 'application/json'
  };

  Future<void> doSearch(Map<String, dynamic> searchRequest) async {
    // cleanList();
    isLoading = true;
    const String endpoint = '/fms/v1/air-search-all';
    final String url = '$apiUrl$endpoint';

    try {
      isLoading = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(searchRequest),
      );
      print(response.body);

      if (response.statusCode == 200) {
        searchResults.value = jsonDecode(response.body);
        jsonData = jsonDecode(response.body);
        length = jsonData['searchResult']['tripInfos']['ONWARD'].length;
        PopulateLists();
        isLoading = false;
        update();
      } else {
        Get.snackbar('Error', 'Failed to fetch flight data',
            backgroundColor: Colors.redAccent, isDismissible: true);
        Get.back();
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.redAccent, isDismissible: true);
      Get.back();
    } finally {
      isLoading = false;
    }
    update();
  }
}
