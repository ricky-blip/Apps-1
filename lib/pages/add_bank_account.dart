import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddBankAccountPages extends StatefulWidget {
  const AddBankAccountPages({Key? key}) : super(key: key);

  @override
  State<AddBankAccountPages> createState() => _AddBankAccountPagesState();
}

class _AddBankAccountPagesState extends State<AddBankAccountPages> {
  final List<String> nameBank = [
    'Bank Mandiri',
    'Bank BNI',
    'Bank BCA',
    'Bank Jago',
    'Paypal',
  ];

  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Bank Account",
              style: redTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Add Your New Bank Account",
              style: greyTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //NOTE DropDown Button
                CustomDropdownButton2(
                  hint: 'Choose Bank',
                  value: selectedBank,
                  dropdownItems: nameBank,
                  onChanged: (value) {
                    setState(() {
                      selectedBank = value;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 25,
                  ),
                  buttonWidth: MediaQuery.of(context).size.width,
                  itemHeight: 50,
                  buttonHeight: 50,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Number Bank Account",
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: TextField(
                          style: greyTextStyle.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Account Name",
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: TextField(
                          style: greyTextStyle.copyWith(fontSize: 16),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
