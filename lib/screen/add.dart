import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storeit/databases/functions/function.dart';
import 'package:storeit/databases/model/model.dart';
import 'package:storeit/screen/bottomNavigation.dart';
import 'package:storeit/screen/profile.dart';
import 'package:storeit/widgets/widget.dart';


class AddstockPage extends StatefulWidget {
  const AddstockPage({super.key});

  @override
  State<AddstockPage> createState() => _AddstockPageState();
}

TextEditingController _pnameController = TextEditingController();
TextEditingController datecontroller = TextEditingController();
// TextEditingController _catogary = TextEditingController();
TextEditingController _quantity = TextEditingController();
TextEditingController _price = TextEditingController();
TextEditingController _colorController = TextEditingController();
TextEditingController _description = TextEditingController();
File? _selectedImage;

String? cat;

class _AddstockPageState extends State<AddstockPage> {
  final List<String> items = [
    'Laptop',
    'Mobile',
    'Headphone',
    'Television',
    'Speakers',
    'Smart Watches',
  ];
  String? newValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "add stock",
          style: style(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: _selectedImage !=null? 
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(File(_selectedImage?.path ?? ''),width: 150,),
                ):
                Image.asset('assets/images/image-3.png',width: 150,),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  addimage();
                },
                child: const Text(
                  "Add image",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              contextfeild(
                  hindtext: 'product name', controllertext: _pnameController),
              contextfeild(
                  hindtext: 'colour', controllertext: _colorController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 390,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: const Text('Catogary'),
                      value: newValue,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        cat = value;
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              contextfeild(hindtext: 'Quantity', controllertext: _quantity),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: datecontroller,
                  onTap: () {
                    date();
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: 'date',
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Iconsax.calendar_1)),
                ),
              ),
              contextfeild(hindtext: 'Price', controllertext: _price),
              contextfeild(
                  hindtext: 'description', controllertext: _description),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    addBtn();
                  },
                  child: const Text(
                    "Conform",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> date() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (selectedDate != null) {
      setState(() {
        datecontroller.text = selectedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> addBtn() async {
    final name = _pnameController.text.trim();
    final color = _colorController.text.trim();
    final catogary = cat;
    final quantity = _quantity.text.trim();
    final date = datecontroller.text.trim();
    final price = _price.text.trim();
    final description = _description.text.trim();

    if (name.isNotEmpty &&
        color.isNotEmpty &&
        catogary != null &&
        quantity.isNotEmpty &&
        date.isNotEmpty &&
        price.isNotEmpty &&
        description.isNotEmpty &&
        _selectedImage != null) {
      final stockdata = StockModel(
        name: name,
        color: color,
        catogary: catogary,
        quantity: quantity,
        date: date,
        price: price,
        description: description,
        image: _selectedImage?.path,
      );
      addData(stockdata);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavigationPage(initialState: 0,)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("fill all feild")));
    }
  }

  Future<void> addimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _selectedImage = File(image.path);
      }
    });
  }
}
