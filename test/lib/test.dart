import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, Map<String, Map<String, Map<String, bool>>>>> ticketStatusDictionary;

  @override
  void initState() {
    super.initState();
    ticketStatusDictionary = loadCSVData();
  }

  Future<Map<String, Map<String, Map<String, Map<String, bool>>>>> loadCSVData() async {
    final String csvData = await rootBundle.loadString('assets/ticket_status.csv');
    final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    final Map<String, Map<String, Map<String, Map<String, bool>>>> result = {};

    for (int i = 1; i < csvTable.length; i++) {
      final List<dynamic> row = csvTable[i];
      final String role = row[0].toString().toLowerCase();
      final String requestStatus = row[1].toString().toLowerCase().replaceAll(' ', '_');
      final String stepStatus = row[2].toString().toLowerCase().replaceAll(' ', '_');

      if (!result.containsKey(role)) {
        result[role] = {};
      }
      if (!result[role]!.containsKey(requestStatus)) {
        result[role]![requestStatus] = {};
      }
      if (!result[role]![requestStatus]!.containsKey(stepStatus)) {
        result[role]![requestStatus]![stepStatus] = {};
      }

      for (int j = 3; j < csvTable[0].length; j++) {
        final String buttonName = csvTable[0][j].toString().toLowerCase().replaceAll(' ', '_');
        final bool buttonState = row[j].toString().toLowerCase() == 'có';
        result[role]![requestStatus]![stepStatus]![buttonName] = buttonState;
      }
    }

    return result;
  }

  bool checkButtonState(Map<String, Map<String, Map<String, Map<String, bool>>>> dictionary, 
                        String role, String requestStatus, String stepStatus, String buttonName) {
    try {
      return dictionary[role]![requestStatus]![stepStatus]![buttonName] ?? false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ticket Status Checker')),
      body: FutureBuilder<Map<String, Map<String, Map<String, Map<String, bool>>>>>(
        future: ticketStatusDictionary,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          final dictionary = snapshot.data!;

          // Example usage
          final bool canComment = checkButtonState(dictionary, 'người yêu cầu', 'chờ_xử_lý', 'chờ_xử_lý', 'comment');
          
          return Center(
            child: Text('Can requester comment when in progress and waiting? $canComment'),
          );
        },
      ),
    );
  }
}
