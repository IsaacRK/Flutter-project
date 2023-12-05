import 'package:flutter/material.dart';

class MyAccScreen extends StatelessWidget {
  const MyAccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: Text("Edit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
              )
            ], //button
          )
        ],
        backgroundColor: const Color(0xFF357AD4),
        title: const Align(
          alignment: Alignment.center,
          child: Text('Akun Saya',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20)),
        ),
        centerTitle: true,
        bottom: const Tab(
            height: 110,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fajrin Arrahman",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          'Sman 1 Kediri',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ]),
                  Column(children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(''),
                    ),
                  ]),
                ])),
      ),
      body: const SafeArea(child: ScreenBody()),
    );
  }
}

class ScreenBody extends StatefulWidget {
  const ScreenBody({super.key});

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Card(
            // main card
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Identitas Diri',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ))),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Nama Lengkap',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Muhammad Ali Topan',
                            style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('helloaltop@gmail.com',
                            style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Jenis Kelamin',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child:
                            Text('Laki laki', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Kelas',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('XII-IPA', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Sekolah',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('SMAN 1 Kediri',
                            style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            //card tombol keluar
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      color: Colors.red,
                      onPressed: () {
                        //do sometihng
                      },
                      icon: const Icon(Icons.exit_to_app)),
                  const Text(
                    'Keluar',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
