import 'package:flutter/material.dart';

class DataEntryPage extends StatefulWidget {
  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  final TextEditingController pharmacyController = TextEditingController();
  List<MedicineEntry> medicines = [MedicineEntry()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacist Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: pharmacyController,
              decoration: InputDecoration(
                labelText: 'Pharmacy Name',
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: medicines[index].medicineController,
                          decoration: InputDecoration(
                            labelText: 'Medicine Name',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: medicines[index].quantityController,
                          decoration: InputDecoration(
                            labelText: 'Quantity',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            medicines.add(MedicineEntry());
                          });
                        },
                      ),
                      if (medicines.length > 1)
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              medicines.removeAt(index);
                            });
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for submission
              },
              child: Text('Add Medicine Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineEntry {
  TextEditingController medicineController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
}