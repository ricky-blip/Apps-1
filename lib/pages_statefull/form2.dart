import 'package:flutter/material.dart';

class Form2 extends StatelessWidget {
  // const Form2(
  //     {Key? key, required this.panjangYgDiterima, this.lebarYgDiterima = ""})
  //     : super(key: key);

  // ignore: use_key_in_widget_constructors
  const Form2({
    required this.panjangYgDiterima,
    required this.lebarYgDiterima,
    required this.hasilYgDiterima,
  });

  // menrima inputan dari form 1
  // buat wadah untuk menampung nilai yg dikirim dari form lain
  final String panjangYgDiterima;
  final String lebarYgDiterima;
  final double hasilYgDiterima;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FORM 2"),
      ),
      body: ListView(
        children: [
          Text("Data yg diterima adalah sebagai berikut : "),
          Text("Panjang : " + panjangYgDiterima),
          Text("Lebar : " + lebarYgDiterima),
          Text("Hasil : " + hasilYgDiterima.toString()),
        ],
      ),
    );
  }
}
