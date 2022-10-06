import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  Widget contactTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'Lets Talk!',
        style: TextStyle(
          fontSize: 25,
          color: kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget enquiryForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: const BorderSide(color: Colors.black, width: 0.2),
            ),
            shadowColor: Colors.black,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 8, //or null
                decoration: InputDecoration.collapsed(
                    hintText: "Enter your text here.....",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 114, 114, 114),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.red)))),

        onPressed: () {},
        // onPressed: validateAndSave,
        child: const Center(
          child: Text(
            'Confirm',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget containerChatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SizedBox(
        height: 120,
        child: Card(
          color: Colors.white.withOpacity(0.85),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: kPrimaryColor.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const ListTile(
            title: Text(
              'New Quiz Swssion started',
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              'new quiz session has started, !!!!!!',
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }

  Widget containerCallus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SizedBox(
        height: 120,
        child: Card(
          color: Colors.white.withOpacity(0.85),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: kPrimaryColor.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const ListTile(
            title: Text(
              'New Quiz Swssion started',
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              'new quiz session has started, !!!!!!',
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        foregroundColor: kWhite,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Contact Us",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contactTitle(),
            enquiryForm(),
            submitButton(),
            containerChatus(),
            containerCallus(),
          ],
        ),
      ),
    );
  }
}
