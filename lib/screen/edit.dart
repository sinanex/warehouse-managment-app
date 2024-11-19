import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse/databases/functions/function.dart';
import 'package:warehouse/databases/model/model.dart';
import 'package:warehouse/screen/liststock.dart';
import 'package:warehouse/widgets/widget.dart';

class EditPage extends StatefulWidget {
  final String? name;
  final String? color;
  final String? catogary;
  final String? quantity;
  final String? date;
  final String? price;
  final String? decs;
  final int index;
  final String? image;

  const EditPage({
    super.key,
    required this.name,
    required this.color,
    required this.catogary,
    required this.date,
    required this.price,
    required this.decs,
    required this.quantity,
    required this.index,
    required this.image,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController nameCtrl;
  late TextEditingController colorCtrl;
  late TextEditingController quantityCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController descCtrl;
  late TextEditingController dateCtrl;
  String? _selectedImagePath;
  String? newValue;

  final List<String> items = [
    'Laptop',
    'Mobile',
    'Headphone',
    'Television',
    'Speaker',
    'Smart Watches'
  ];

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.name);
    colorCtrl = TextEditingController(text: widget.color);
    quantityCtrl = TextEditingController(text: widget.quantity);
    priceCtrl = TextEditingController(text: widget.price);
    descCtrl = TextEditingController(text: widget.decs);
    dateCtrl = TextEditingController(text: widget.date);
    _selectedImagePath = widget.image;
    newValue = widget.catogary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Edit Item",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 200,
                    child: _selectedImagePath != null
                        ? Image.file(File(_selectedImagePath!))
                        : Image.asset('assets/images/image-3.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: imageEdit,
                child: const Text(
                  "Edit Image",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              contextfeild(hindtext: 'Product Name', controllertext: nameCtrl),
              contextfeild(hindtext: 'Colour', controllertext: colorCtrl),
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
                      hint: const Text('Category'),
                      value: newValue,
                      items: items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              contextfeild(hindtext: 'Quantity', controllertext: quantityCtrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: dateCtrl,
                  onTap: date,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Date',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Iconsax.calendar_1),
                  ),
                ),
              ),
              contextfeild(hindtext: 'Price', controllertext: priceCtrl),
              contextfeild(hindtext: 'Description', controllertext: descCtrl),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: submitBtn,
                  child: const Text(
                    "Submit",
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
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      setState(() {
        dateCtrl.text = selectedDate.toString().split(" ")[0];
      });
    }
  }

  void imageEdit() async {
    final imageEdit =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (imageEdit != null) {
        _selectedImagePath = imageEdit.path;
      }
    });
  }

  void submitBtn() {
    final name = nameCtrl.text.trim();
    final color = colorCtrl.text.trim();
    final catogary = newValue ?? '';
    final quantity = quantityCtrl.text.trim();
    final date = dateCtrl.text.trim();
    final price = priceCtrl.text.trim();
    final desc = descCtrl.text.trim();

    if (name.isEmpty ||
        color.isEmpty ||
        catogary.isEmpty ||
        quantity.isEmpty ||
        date.isEmpty ||
        price.isEmpty ||
        desc.isEmpty) {
      return;
    }

    final edit = StockModel(
      name: name,
      color: color,
      catogary: catogary,
      quantity: quantity,
      date: date,
      price: price,
      description: desc,
      image: _selectedImagePath,
    );

    editData(widget.index, edit);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListPage()),
    );
  }
}
