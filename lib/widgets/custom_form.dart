import 'package:flutter/material.dart';
import 'package:hogi_milk/models/order.dart';
import 'package:hogi_milk/models/option.dart';
import 'package:hogi_milk/providers/data_provider.dart';
import 'package:provider/provider.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  Option? _selectedOption;
  final _formKey = GlobalKey<FormState>(); // Add form key
  bool isNotSelected = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showOrderReceivedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Order Received',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          content: const Text(
              'Thank you for your order!\nYour order has been received successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _clearTextFields(); // Clear text fields
              },
              child: const Text('DONE'),
            ),
          ],
        );
      },
    );
  }

  void _clearTextFields() {
    setState(() {
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();
      _selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataManager = Provider.of<DataManager>(context, listen: true);
    final List<Option> options = dataManager.options;

    return Form(
      key: _formKey,
      child: Container(
        color: const Color.fromRGBO(0, 128, 55, 1),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'ယခုမှာယူပါ။\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow),
                  ),
                  TextSpan(
                    text: 'မှာယူလိုပါက အောက်\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'ပါဖောင်ကိုဖြည့်ပါ။',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delivery_dining, color: Colors.white),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      'အခမဲ့ပို့ဆောင်ခြင်းနှင့် COD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: _nameController,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'ပထမနှင့်နောက်ဆုံးနာမည်',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(
                  color: Colors.yellow,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ပထမနှင့်နောက်ဆုံးနာမည် လိုအပ်ပါသည်';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _phoneController,
              style: const TextStyle(fontSize: 12),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'ဖုန်းနံပါတ်',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(
                  color: Colors.yellow,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ဖုန်းနံပါတ် လိုအပ်ပါသည်';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _addressController,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'နေရပ်လိပ်စာ',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(
                  color: Colors.yellow,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'နေရပ်လိပ်စာ လိုအပ်ပါသည်';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: options
                    .map(
                      (option) => RadioListTile<Option>(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 4),
                        title: Text(
                          '${option.count}ဘူးကို ${option.price} ကျပ် (${option.price / 2} ကျပ်/ဘူးကို) + free shipping',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              height: 1.5),
                        ),
                        value: option,
                        groupValue: _selectedOption,
                        onChanged: (selectedOption) {
                          setState(() {
                            _selectedOption = selectedOption;
                            isNotSelected = false;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            if (isNotSelected)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'အရေအတွက်ကို ရွေးချယ်ပါ',
                  style: TextStyle(color: Colors.yellow, fontSize: 12),
                ),
              ),
            const SizedBox(height: 24.0),
            const Text(
              'သင့်ကုန်ပစ္စည်းများကို တတ်နိုင်သမျှ အမြန်ဆုံး ပို့ဆောင်ပြီး အခမဲ့ ပို့ဆောင်ကြောင်း သေချာစေရန် သင့်အချက်အလက်များကို ပြည့်စုံစွာဖြည့်ပါ။',
              style:
                  TextStyle(fontSize: 14.0, color: Colors.white, height: 1.8),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: const Color.fromARGB(255, 255, 33, 17),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 40)),
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _selectedOption != null) {
                    // Handle form submission here
                    setState(() {
                      _isLoading = true;
                    });
                    Order order = Order(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      address: _addressController.text,
                      count: _selectedOption!.count
                          .toString(), // Use selected option count
                      totalPrice: _selectedOption!.price
                          .toString(), // Use selected option price
                      date: DateTime.now().toIso8601String(),
                    );
                    await dataManager.submitOrder(order);
                    setState(() {
                      _isLoading = false;
                    });
                    _showOrderReceivedDialog();
                  }
                  if (_selectedOption == null) {
                    setState(() {
                      isNotSelected = true;
                    });
                  }
                },
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'မှာယူရန်နှိပ်ပါ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
