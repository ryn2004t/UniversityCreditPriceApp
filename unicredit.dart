import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _baseURL = 'rayforuniversities.infinityfreeapp.com';

void main() {
  runApp(MyApp());
}

class UniMajors {
  int universityId;
  String name;
  int priceCredit;
  String instructorName;

  UniMajors(this.universityId, this.name, this.priceCredit, this.instructorName);

  @override
  String toString() {
    return 'Instructor Name: $instructorName \n Credit Price: $priceCredit';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UniversitySelector(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UniversitySelector extends StatefulWidget {
  @override
  _UniversitySelectorState createState() => _UniversitySelectorState();
}

List<UniMajors> _uniMajors = [];

class _UniversitySelectorState extends State<UniversitySelector> {
  final List<String> universities = ['LIU', 'LAU', 'AUB', 'AU', 'LU', 'LUA'];
  String selectedUniversity = 'LIU'; // Default value
  String price = '';
  String instructors = '';
  TextEditingController majorController = TextEditingController();

  Future<void> fetchPriceAndInstructors() async {
    try {
      final queryParameters = {
        'university': selectedUniversity,
        'major': majorController.text.trim(),
      };
      final url = Uri.https(_baseURL, 'index.php', queryParameters);

      print('Sending request to: $url');

      // Send the HTTP GET request
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse['error'] != null) {
          setState(() {
            price = jsonResponse['error'];
            instructors = '';
          });
        } else {
          setState(() {
            price = 'Price: ${jsonResponse['price_credit']}';
            instructors = 'Instructor: ${jsonResponse['instructor_name']}';
          });
        }
      } else {
        setState(() {
          price = 'Server error: ${response.statusCode}';
          instructors = '';
        });
      }
    } catch (e) {
      print('Error occurred: $e');
      setState(() {
        price = 'Connection failed. Please try again.';
        instructors = '';
      });
    }
  }

  void updateDisplay(bool success) {
    if (success) {
      price = 'Price: ${_uniMajors[0].priceCredit}';
      instructors = 'Instructor: ${_uniMajors[0].instructorName}';
    } else {
      price = 'Failed to load data';
      instructors = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Credit Price Finder'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a University:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedUniversity,
              icon: Icon(Icons.arrow_downward, color: Colors.deepPurple),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUniversity = newValue!;
                });
              },
              items: universities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: majorController,
              decoration: InputDecoration(
                labelText: 'Enter Major',
                labelStyle: TextStyle(color: Colors.deepPurple),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchPriceAndInstructors,
              child: Text('Get Details'),
            ),
            SizedBox(height: 20),
            Text(
              price,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              instructors,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
