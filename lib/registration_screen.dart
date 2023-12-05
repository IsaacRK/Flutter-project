// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:vanilla/widgets/custom_button.dart';

const List<String> kelas = <String>['kelas A', 'kelas B', 'Kelas C'];

enum Gender { lakilaki, perempuan }

class RegistScreen extends StatelessWidget {
  const RegistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yuk isi data diri',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(child: FormBody()),
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
  Gender? _character = Gender.lakilaki;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          //column all
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(//column form
                children: [
              Column(
                //cloumn email
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Maukkan Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "contoh: ihsan@gmail.com",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
              Column(
                //column nama
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama lengkap",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Maukkan Nama Lengkap';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "contoh: Ihsan Adireja",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
              Column(
                //column jenis klamin
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Jenis Kelamin",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  // form pilih jenis klamin
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Laki-laki'),
                          leading: Radio<Gender>(
                            value: Gender.lakilaki,
                            groupValue: _character,
                            onChanged: (Gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Perempuan'),
                          leading: Radio<Gender>(
                            value: Gender.perempuan,
                            groupValue: _character,
                            onChanged: (Gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
              Column(
                //column kelas
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kelas",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ),
                  // form drop down kelas
                  DropdownMenu<String>(
                    hintText: 'Kelas',
                    width: (MediaQuery.of(context).size.width * 1) - 60,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        kelas.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  SizedBox(height: 20)
                ],
              ),
              Column(
                //column nama sekolah
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama Sekolah",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                        border: OutlineInputBorder(),
                        hintText: "Nama Sekolah",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ]),
            const Column(
              //column button
              children: [
                LoginButton(
                  buttonColor: Color(0xFF357AD4),
                  buttonTitle: "Daftar",
                  textColor: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
