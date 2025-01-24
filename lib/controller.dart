import 'dart:async';
import 'dart:convert';
import 'package:home_widget/home_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String appGroupId = "group.homeScreenApp";
String widgetName = "RandomFact";
String dataKey = "randomFact_Widget";
final StreamController<String> factStreamController =
    StreamController<String>.broadcast();

void saveFact(String factText) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('RandomFact', factText);
}

Future<String> loadFact() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('RandomFact') ?? "";
}

void handleWidget(String FactText) async {
  //save_widget
  String data = "Do You Know That: $FactText";
  await HomeWidget.saveWidgetData(dataKey, data);

  //update_widget
  HomeWidget.updateWidget(androidName: widgetName, iOSName: widgetName);
}

void Get_UselessFact() async {
  final response = await http.get(
    Uri.parse("https://uselessfacts.jsph.pl/api/v2/facts/random?language=en"),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final fact = data["text"];
    saveFact(fact);
    factStreamController.add(fact);
    handleWidget(fact);
  }
}

void toDo_First() {
  loadFact().then((storedFact) {
    if (storedFact == "") {
      Get_UselessFact();
    } else {
      factStreamController.add(storedFact);
    }
  });

  Timer.periodic(Duration(minutes: 30), (timer) => Get_UselessFact());

  // init_widget
  HomeWidget.setAppGroupId(appGroupId);
}
