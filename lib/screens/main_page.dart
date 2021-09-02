import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 10,
        title: Row(
          children: [
            Text(
              'Diary',
              style: TextStyle(fontSize: 30, color: Colors.green.shade400),
            ),
            Text(
              'Book',
              style: TextStyle(fontSize: 30, color: Colors.blue.shade400),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    items: <String>[
                      'Latest',
                      'Earliest',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ));
                    }).toList(),
                    hint: (_dropDownText == null)
                        ? Text('Select')
                        : Text(_dropDownText!),
                    onChanged: (value) {
                      if (value == 'Latest') {
                        setState(() {
                          _dropDownText = value;
                        });
                      } else if (value == 'Earliest') {
                        setState(() {
                          _dropDownText = value;
                        });
                      }
                    }),
              ),
              //Todo:   create profile
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://picsum.photos/200/300'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'James',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.green,
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border(
                  right: BorderSide(width: 0.5, color: Colors.green),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: SfDateRangePicker(
                      onSelectionChanged: (dateRangePickerSelection) {
                        print(dateRangePickerSelection.value.toString());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                      elevation: 10,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon:
                            Icon(Icons.add, size: 40, color: Colors.tealAccent),
                        label: Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Write New',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Card(
                                    elevation: 10,
                                    child: ListTile(
                                      title: Text('Hello'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
