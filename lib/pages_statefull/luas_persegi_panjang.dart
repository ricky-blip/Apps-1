import 'package:flutter/material.dart';

class LuasPersegiPanjang extends StatefulWidget {
  const LuasPersegiPanjang({Key? key}) : super(key: key);

  @override
  State<LuasPersegiPanjang> createState() => _LuasPersegiPanjangState();
}

class _LuasPersegiPanjangState extends State<LuasPersegiPanjang> {
  //buat variabel utk menampung hasil
  double? hasil = 0.0;

  // texteditingcontroller => utk menerima value di textfield / textformfield
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();

  //key utk form agar bisa di form itu ada statenya, misal validasi
  final formKey = GlobalKey<FormState>();

  // fungsi hitung luas
  void hitungLuas(double panjang, double lebar) {
    // variabel yg menampung proses hitung luas
    double luas = panjang * lebar;

    // gantikan / asign nilai dari variabel hasil yg ada di atas, dgn hasil dari
    // perhitungan luas yg diwadahkan pd variabek luas
    setState(() {
      hasil = luas;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LUAS PERSEGI PANJANG"),
        ),
        body: ListView(
          children: [
            Text("HITUNG L. PERSEGI PANJANG"),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukkan Panjang";
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: panjang,
                    decoration: InputDecoration(hintText: "Input Panjang"),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukkan Lebar";
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: lebar,
                    decoration: InputDecoration(hintText: "Input Lebar"),
                  ),
                  InkWell(
                    onTap: () {
                      // panggil validator
                      if (formKey.currentState!.validate()) {
                        // panggil function hitungLuas
                        hitungLuas(
                          double.parse(panjang.text),
                          double.parse(lebar.text),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.amber[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: Center(child: Text("HITUNG")),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("HASIL : "),
                Text(hasil.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
