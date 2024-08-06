import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster_draft2/controllers/radiocontroller.dart';
import 'package:tripster_draft2/controllers/returnSearch.dart';
import 'package:tripster_draft2/controllers/searchcontroller.dart';
import 'package:tripster_draft2/resultsPages/ReturnResult.dart';
import 'package:tripster_draft2/resultsPages/SearchResult.dart';

OnewayController onewayController = Get.find();
RadioController radioController = Get.find();
SearchController searchController = Get.find();
ReturnController returnController = Get.find();

class AirportController extends GetxController {
  String fromAirportCode = 'FROM';
  String fromAirportName = 'FROMARP';
  String fromCity = 'Source';
  String toAirportCode = 'TO';
  String toAirportName = 'TOARP';
  String toCity = 'Destination';
  String interchangeAirportCode = '';
  String interchangeAirportName = '';
  String interchangeCity = '';

  DateTime OnewayDate = DateTime.now();
  DateTime RoundTripStart = DateTime.now();
  DateTime RoundTripEnds = DateTime.now().add(Duration(days: 7));

  int Adults = 1;
  int Child = 0;

  String SelectedCabin = 'ECONOMY';

  void handleCabinValueChange(String? value) {
    SelectedCabin = value!;
    print(SelectedCabin);
    update();
  }

  swapAirports() {
    final tempCode = fromAirportCode;
    final tempCity = fromCity;
    fromAirportCode = toAirportCode;
    fromCity = toCity;
    toAirportCode = tempCode;
    toCity = tempCity;

    update();
  }

  increaseAdult() {
    Adults++;
    update();
  }

  subtractAdult() {
    if (Adults > 1) {
      Adults--;
      update();
    } else {
      Adults = Adults;
      update();
    }
  }

  increaseChild() {
    Child++;
    update();
  }

  subtractChild() {
    if (Child > 0) {
      Child--;
      update();
    } else {
      Child = Child;
      update();
    }
  }

  callSearch() async {
    // await onewayController.cleanList();
    // Get.snackbar('Cleared List', 'List has been cleared');
    Get.to(() => const SearchResults(), transition: Transition.rightToLeft);

    final searchRequest = {
      "searchQuery": {
        "cabinClass": SelectedCabin,
        "paxInfo": {"ADULT": Adults, "CHILD": Child, "INFANT": "0"},
        "routeInfos": [
          {
            "fromCityOrAirport": {"code": fromAirportCode},
            "toCityOrAirport": {"code": toAirportCode},
            "travelDate": "${OnewayDate.toString().substring(0, 10)}"
          }
        ],
        "searchModifiers": {}
      },
    };

    await onewayController.doSearch(searchRequest);
  }

  callSearchReturn() async {
    final returnRequest = {
      "searchQuery": {
        "cabinClass": SelectedCabin.toString(),
        "paxInfo": {
          "ADULT": Adults.toString(),
          "CHILD": Child.toString(),
          "INFANT": "0",
        },
        "routeInfos": [
          {
            "fromCityOrAirport": {"code": fromAirportCode.toString()},
            "toCityOrAirport": {"code": toAirportCode.toString()},
            "travelDate": RoundTripStart.toString().substring(0, 10)
          },
          {
            "fromCityOrAirport": {"code": toAirportCode.toString()},
            "toCityOrAirport": {"code": fromAirportCode.toString()},
            "travelDate": RoundTripEnds.toString().substring(0, 10)
          }
        ],
        "preferredAirline": [],
        "searchModifiers": {"isDirectFlight": false, "isConnectingFlight": true}
      }
    };
    print("Return Request: $returnRequest");
    Get.to(() => const ReturnResults(), transition: Transition.rightToLeft);
    await returnController.doSearch(returnRequest);
  }
}
