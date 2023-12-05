import 'package:flutter/material.dart';
import 'package:vanilla/widgets/custom_button.dart';

const List<String> kelas = <String>['kelas A', 'kelas B', 'Kelas C'];
const List<String> gender = <String>['Laki-laki', 'Perempuan'];

class EditAccScreen extends StatelessWidget {
  const EditAccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF357AD4),
        title: const Align(
            alignment: Alignment.center,
            child: Text('Edit Akun',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20))),
      ),
      body: const SafeArea(child: FormBody()),
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({super.key});

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = kelas.first;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          //column all
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(//column header
                children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Data Diri',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20))),
              )
            ]),
            Column(//column form
                children: [
              Column(
                //cloumn email
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama Lengkap",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Nama Lengkap';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      //border: OutlineInputBorder(),
                      hintText: "Nama lengkap",
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: false,
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
              Column(
                //column nama
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'masukkan email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "helloaltop@gmail.com",
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: false),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
              Column(
                //column jenis klamin
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Jenis Kelamin",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  // form drop down jenis kelamin
                  DropdownMenu<String>(
                    hintText: 'Pilih Jenis Kelamin',
                    width: (MediaQuery.of(context).size.width * 1) - 60,
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    ),
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        gender.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
              Column(
                //column kelas
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kelas",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Nama Sekolah';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        fillColor: Colors.white, filled: false),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
              Column(
                //column nama sekolah
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama Sekolah",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Maukkan Nama Sekolah';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        fillColor: Colors.white, filled: false),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ]),
            const Column(
              //column button
              children: [
                RounddedButton(
                    buttonColor: Color(0xFF357AD4),
                    textColor: Colors.white,
                    buttonTitle: 'Perbarui Data',
                    borderRadius: 10.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
