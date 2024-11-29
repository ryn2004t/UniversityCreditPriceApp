import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

class _UniversitySelectorState extends State<UniversitySelector> {
  final List<String> universities = ['LIU', 'LAU', 'AUB', 'AU', 'LU', 'LUA'];
  String selectedUniversity = 'LIU'; // Default value
  String price = '';
  String instructors = '';
  TextEditingController majorController = TextEditingController();

  void updatePriceAndInstructors() {
    String major = majorController.text.toLowerCase();
    switch (major) {
      case 'computer science':
      case 'electronic engineering / emphasis on biomedical':
      case 'computer engineering':
      case 'electrical engineering':
      case 'electronics engineering':
      case 'mechanical engineering':
      case 'surveying engineering':
      case 'communication engineering':
      case 'industrial engineering':
      case 'pharmacy':
      case 'accounting information systems':
      case 'economics':
      case 'banking & finance':
      case 'hospitality management':
      case 'business management':
      case 'management information systems':
      case 'marketing':
      case 'international business management':
      case 'liu-worms international business management':
        price = getCreditPrice(major);
        instructors = getInstructors(major);
        break;
      default:
        price = 'Major not found or not available for the selected university';
        instructors = '';
    }
    setState(() {});
  }

  String getCreditPrice(String major) {
    Map<String, String> liuPrices = {
      'computer science': 'Price per credit: \$150',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$160',
      'computer engineering': 'Price per credit: \$170',
      'electrical engineering': 'Price per credit: \$160',
      'electronics engineering': 'Price per credit: \$150',
      'mechanical engineering': 'Price per credit: \$175',
      'surveying engineering': 'Price per credit: \$145',
      'communication engineering': 'Price per credit: \$165',
      'industrial engineering': 'Price per credit: \$155',
      'pharmacy': 'Price per credit: \$180',
      'accounting information systems': 'Price per credit: \$130',
      'economics': 'Price per credit: \$140',
      'banking & finance': 'Price per credit: \$150',
      'hospitality management': 'Price per credit: \$140',
      'business management': 'Price per credit: \$150',
      'management information systems': 'Price per credit: \$130',
      'marketing': 'Price per credit: \$140',
      'international business management': 'Price per credit: \$160',
      'liu-worms international business management': 'Price per credit: \$170',
    };

    Map<String, String> lauPrices = {
      'computer science': 'Price per credit: \$200',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$210',
      'computer engineering': 'Price per credit: \$220',
      'electrical engineering': 'Price per credit: \$210',
      'electronics engineering': 'Price per credit: \$200',
      'mechanical engineering': 'Price per credit: \$225',
      'surveying engineering': 'Price per credit: \$195',
      'communication engineering': 'Price per credit: \$215',
      'industrial engineering': 'Price per credit: \$205',
      'pharmacy': 'Price per credit: \$230',
      'accounting information systems': 'Price per credit: \$180',
      'economics': 'Price per credit: \$190',
      'banking & finance': 'Price per credit: \$200',
      'hospitality management': 'Price per credit: \$190',
      'business management': 'Price per credit: \$200',
      'management information systems': 'Price per credit: \$180',
      'marketing': 'Price per credit: \$190',
      'international business management': 'Price per credit: \$210',
      'liu-worms international business management': 'Price per credit: \$220',
    };

    Map<String, String> aubPrices = {
      'computer science': 'Price per credit: \$250',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$260',
      'computer engineering': 'Price per credit: \$270',
      'electrical engineering': 'Price per credit: \$260',
      'electronics engineering': 'Price per credit: \$250',
      'mechanical engineering': 'Price per credit: \$275',
      'surveying engineering': 'Price per credit: \$245',
      'communication engineering': 'Price per credit: \$265',
      'industrial engineering': 'Price per credit: \$255',
      'pharmacy': 'Price per credit: \$280',
      'accounting information systems': 'Price per credit: \$230',
      'economics': 'Price per credit: \$240',
      'banking & finance': 'Price per credit: \$250',
      'hospitality management': 'Price per credit: \$240',
      'business management': 'Price per credit: \$250',
      'management information systems': 'Price per credit: \$230',
      'marketing': 'Price per credit: \$240',
      'international business management': 'Price per credit: \$260',
      'liu-worms international business management': 'Price per credit: \$270',
    };
    Map<String, String> luaPrices = {
      'computer science': 'Price per credit: \$150',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$160',
      'computer engineering': 'Price per credit: \$170',
      'electrical engineering': 'Price per credit: \$160',
      'electronics engineering': 'Price per credit: \$150',
      'mechanical engineering': 'Price per credit: \$175',
      'surveying engineering': 'Price per credit: \$145',
      'communication engineering': 'Price per credit: \$165',
      'industrial engineering': 'Price per credit: \$155',
      'pharmacy': 'Price per credit: \$180',
      'accounting information systems': 'Price per credit: \$130',
      'economics': 'Price per credit: \$140',
      'banking & finance': 'Price per credit: \$150',
      'hospitality management': 'Price per credit: \$140',
      'business management': 'Price per credit: \$150',
      'management information systems': 'Price per credit: \$130',
      'marketing': 'Price per credit: \$140',
      'international business management': 'Price per credit: \$160',
      'liu-worms international business management': 'Price per credit: \$170',
    };
    Map<String, String> auPrices = {
      'computer science': 'Price per credit: \$150',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$160',
      'computer engineering': 'Price per credit: \$170',
      'electrical engineering': 'Price per credit: \$160',
      'electronics engineering': 'Price per credit: \$150',
      'mechanical engineering': 'Price per credit: \$175',
      'surveying engineering': 'Price per credit: \$145',
      'communication engineering': 'Price per credit: \$165',
      'industrial engineering': 'Price per credit: \$155',
      'pharmacy': 'Price per credit: \$180',
      'accounting information systems': 'Price per credit: \$130',
      'economics': 'Price per credit: \$140',
      'banking & finance': 'Price per credit: \$150',
      'hospitality management': 'Price per credit: \$140',
      'business management': 'Price per credit: \$150',
      'management information systems': 'Price per credit: \$130',
      'marketing': 'Price per credit: \$140',
      'international business management': 'Price per credit: \$160',
      'liu-worms international business management': 'Price per credit: \$170',
    };
    Map<String, String> luPrices = {
      'computer science': 'Price per credit: \$150',
      'electronic engineering / emphasis on biomedical': 'Price per credit: \$160',
      'computer engineering': 'Price per credit: \$170',
      'electrical engineering': 'Price per credit: \$160',
      'electronics engineering': 'Price per credit: \$150',
      'mechanical engineering': 'Price per credit: \$175',
      'surveying engineering': 'Price per credit: \$145',
      'communication engineering': 'Price per credit: \$165',
      'industrial engineering': 'Price per credit: \$155',
      'pharmacy': 'Price per credit: \$180',
      'accounting information systems': 'Price per credit: \$130',
      'economics': 'Price per credit: \$140',
      'banking & finance': 'Price per credit: \$150',
      'hospitality management': 'Price per credit: \$140',
      'business management': 'Price per credit: \$150',
      'management information systems': 'Price per credit: \$130',
      'marketing': 'Price per credit: \$140',
      'international business management': 'Price per credit: \$160',
      'liu-worms international business management': 'Price per credit: \$170',
    };


    // Other university prices can be similarly defined...

    Map<String, Map<String, String>> allPrices = {
      'LIU': liuPrices,
      'LAU': lauPrices,
      'AUB': aubPrices,
      'AU': auPrices,
      'LU': luPrices,
      'LUA': luaPrices,
      // Add other universities' price mappings here...
    };

    return allPrices[selectedUniversity]?[major] ?? 'Price not available';
  }

  String getInstructors(String major) {
    Map<String, String> liuInstructors = {
      'computer science': 'Instructors: Dr. John Smith, Dr. Jane Doe',
      'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Alan Brown, Dr. Zoe Black',
      'computer engineering': 'Instructors: Dr. Mike Brown, Dr. Emily White',
      'electrical engineering': 'Instructors: Dr. Linda Green, Dr. Mark Black',
      'electronics engineering': 'Instructors: Dr. Alice Blue, Dr. Robert Red',
      'mechanical engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
      'surveying engineering': 'Instructors: Dr. Wayne Red, Dr. Sharon Orange',
      'communication engineering': 'Instructors: Dr. David King, Dr. Susan Lane',
      'industrial engineering': 'Instructors: Dr. George Hall, Dr. Sarah Young',
      'pharmacy': 'Instructors: Dr. Paul Walker, Dr. Nancy Adams',
      'accounting information systems': 'Instructors: Dr. Fred Johnson, Dr. Julie White',
      'economics': 'Instructors: Dr. Margaret Brown, Dr. Linda Grey',
      'banking & finance': 'Instructors: Dr. Tom Clark, Dr. Lisa Black',
      'hospitality management': 'Instructors: Dr. Kate Green, Dr. Sam Blue',
      'business management': 'Instructors: Dr. John Kelly, Dr. Sarah Grey',
      'management information systems': 'Instructors: Dr. Emily Davis, Dr. Richard Brown',
      'marketing': 'Instructors: Dr. Nancy Smith, Dr. Paul Grey',
      'international business management': 'Instructors: Dr. Andrew Brown, Dr. Jessica Green',
      'liu-worms international business management': 'Instructors: Dr. Mike Blue, Dr. Rachel White',
    };

    Map<String, String> lauInstructors = {
    'computer science': 'Instructors: Dr. Kevin Green, Dr. Rachel Black',
    'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Karen Clark, Dr. Gary White',
    'computer engineering': 'Instructors: Dr. Brenda White, Dr. Simon Blue',
    'electrical engineering': 'Instructors: Dr. Thomas Gray, Dr. Patricia Red',
    'electronics engineering': 'Instructors: Dr. Daniel Brown, Dr. Barbara Purple',
    'mechanical engineering': 'Instructors: Dr. Kenneth White, Dr. Theresa Yellow',
    'surveying engineering': 'Instructors: Dr. Donald Orange, Dr. Jessica Gray',
    'communication engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
    'industrial engineering': 'Instructors: Dr. Michael Cyan, Dr. Sandra Magenta',
    'pharmacy': 'Instructors: Dr. Larry Blue, Dr. Betty Black',
    'accounting information systems': 'Instructors: Dr. Henry White, Dr. Olivia Green',
    'economics': 'Instructors: Dr. Brian Black, Dr. Anna Brown',
    'banking & finance': 'Instructors: Dr. Sarah Clark, Dr. Michael Green',
    'hospitality management': 'Instructors: Dr. Lisa White, Dr. Eric Black',
    'business management': 'Instructors: Dr. George Brown, Dr. Emily White',
    'management information systems':'Dr. Lisa White, Dr. Eric Black'
  };
    Map<String, String> aubInstructors = {
      'computer science': 'Instructors: Dr. Kevin Green, Dr. Rachel Black',
      'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Karen Clark, Dr. Gary White',
      'computer engineering': 'Instructors: Dr. Brenda White, Dr. Simon Blue',
      'electrical engineering': 'Instructors: Dr. Thomas Gray, Dr. Patricia Red',
      'electronics engineering': 'Instructors: Dr. Daniel Brown, Dr. Barbara Purple',
      'mechanical engineering': 'Instructors: Dr. Kenneth White, Dr. Theresa Yellow',
      'surveying engineering': 'Instructors: Dr. Donald Orange, Dr. Jessica Gray',
      'communication engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
      'industrial engineering': 'Instructors: Dr. Michael Cyan, Dr. Sandra Magenta',
      'pharmacy': 'Instructors: Dr. Larry Blue, Dr. Betty Black',
      'accounting information systems': 'Instructors: Dr. Henry White, Dr. Olivia Green',
      'economics': 'Instructors: Dr. Brian Black, Dr. Anna Brown',
      'banking & finance': 'Instructors: Dr. Sarah Clark, Dr. Michael Green',
      'hospitality management': 'Instructors: Dr. Lisa White, Dr. Eric Black',
      'business management': 'Instructors: Dr. George Brown, Dr. Emily White',
      'management information systems':'Dr. Lisa White, Dr. Eric Black'
    };
    Map<String, String> luaInstructors = {
      'computer science': 'Instructors: Dr. Kevin Green, Dr. Rachel Black',
      'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Karen Clark, Dr. Gary White',
      'computer engineering': 'Instructors: Dr. Brenda White, Dr. Simon Blue',
      'electrical engineering': 'Instructors: Dr. Thomas Gray, Dr. Patricia Red',
      'electronics engineering': 'Instructors: Dr. Daniel Brown, Dr. Barbara Purple',
      'mechanical engineering': 'Instructors: Dr. Kenneth White, Dr. Theresa Yellow',
      'surveying engineering': 'Instructors: Dr. Donald Orange, Dr. Jessica Gray',
      'communication engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
      'industrial engineering': 'Instructors: Dr. Michael Cyan, Dr. Sandra Magenta',
      'pharmacy': 'Instructors: Dr. Larry Blue, Dr. Betty Black',
      'accounting information systems': 'Instructors: Dr. Henry White, Dr. Olivia Green',
      'economics': 'Instructors: Dr. Brian Black, Dr. Anna Brown',
      'banking & finance': 'Instructors: Dr. Sarah Clark, Dr. Michael Green',
      'hospitality management': 'Instructors: Dr. Lisa White, Dr. Eric Black',
      'business management': 'Instructors: Dr. George Brown, Dr. Emily White',
      'management information systems':'Dr. Lisa White, Dr. Eric Black'
    };
    Map<String, String> luInstructors = {
      'computer science': 'Instructors: Dr. Kevin Green, Dr. Rachel Black',
      'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Karen Clark, Dr. Gary White',
      'computer engineering': 'Instructors: Dr. Brenda White, Dr. Simon Blue',
      'electrical engineering': 'Instructors: Dr. Thomas Gray, Dr. Patricia Red',
      'electronics engineering': 'Instructors: Dr. Daniel Brown, Dr. Barbara Purple',
      'mechanical engineering': 'Instructors: Dr. Kenneth White, Dr. Theresa Yellow',
      'surveying engineering': 'Instructors: Dr. Donald Orange, Dr. Jessica Gray',
      'communication engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
      'industrial engineering': 'Instructors: Dr. Michael Cyan, Dr. Sandra Magenta',
      'pharmacy': 'Instructors: Dr. Larry Blue, Dr. Betty Black',
      'accounting information systems': 'Instructors: Dr. Henry White, Dr. Olivia Green',
      'economics': 'Instructors: Dr. Brian Black, Dr. Anna Brown',
      'banking & finance': 'Instructors: Dr. Sarah Clark, Dr. Michael Green',
      'hospitality management': 'Instructors: Dr. Lisa White, Dr. Eric Black',
      'business management': 'Instructors: Dr. George Brown, Dr. Emily White',
      'management information systems':'Dr. Lisa White, Dr. Eric Black'
    };
    Map<String, String> auInstructors = {
      'computer science': 'Instructors: Dr. Kevin Green, Dr. Rachel Black',
      'electronic engineering / emphasis on biomedical': 'Instructors: Dr. Karen Clark, Dr. Gary White',
      'computer engineering': 'Instructors: Dr. Brenda White, Dr. Simon Blue',
      'electrical engineering': 'Instructors: Dr. Thomas Gray, Dr. Patricia Red',
      'electronics engineering': 'Instructors: Dr. Daniel Brown, Dr. Barbara Purple',
      'mechanical engineering': 'Instructors: Dr. Kenneth White, Dr. Theresa Yellow',
      'surveying engineering': 'Instructors: Dr. Donald Orange, Dr. Jessica Gray',
      'communication engineering': 'Instructors: Dr. Charles Green, Dr. Susan Pink',
      'industrial engineering': 'Instructors: Dr. Michael Cyan, Dr. Sandra Magenta',
      'pharmacy': 'Instructors: Dr. Larry Blue, Dr. Betty Black',
      'accounting information systems': 'Instructors: Dr. Henry White, Dr. Olivia Green',
      'economics': 'Instructors: Dr. Brian Black, Dr. Anna Brown',
      'banking & finance': 'Instructors: Dr. Sarah Clark, Dr. Michael Green',
      'hospitality management': 'Instructors: Dr. Lisa White, Dr. Eric Black',
      'business management': 'Instructors: Dr. George Brown, Dr. Emily White',
      'management information systems':'Dr. Lisa White, Dr. Eric Black'
    };


    Map<String, Map<String, String>> allInstructors = {
      'LIU': liuInstructors,
      'LAU': lauInstructors,
      'AUB': aubInstructors,
      'AU': auInstructors,
      'LU': luInstructors,
      'LUA': luaInstructors,
    };
      // Add other universities' instructor mappings here...

      return allInstructors[selectedUniversity]?[major] ?? 'Instructors not available';


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
                updatePriceAndInstructors();
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
            onChanged: (value) {
              updatePriceAndInstructors();
            },
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












