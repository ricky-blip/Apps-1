import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages_statefull/form2.dart';

class Form1 extends StatefulWidget {
  Form1({Key? key}) : super(key: key);

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  // texteditingcontroller => utk menerima value di textfield / textformfield
  TextEditingController panjang = TextEditingController();

  TextEditingController lebar = TextEditingController();

  double hasil = 0.0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("FORM 1"),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => Form2(
                            panjangYgDiterima: panjang.text,
                            lebarYgDiterima: lebar.text,
                            hasilYgDiterima: hasil,
                          ),
                        ),
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
                    child: Center(child: Text("KIRIM DATA")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
