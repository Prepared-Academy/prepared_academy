import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../../themes/color_theme.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  Widget feedImag() {
    return Center(
      child: Image.asset(
        AppConstants.FEED1,
        width: 400,
      ),
    );
  }

  Widget feedTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        'Rate your feedback',
        style: TextStyle(
          fontSize: 20,
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget feedDesc() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        'Set the new feedback for better understandings of your account.',
        style: TextStyle(
          fontSize: 13,
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget dropdownFeed() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: kBlack, spreadRadius: 0.3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const [
              "All",
              "Videos",
              "Subjects",
              "Sliders",
              "Images",
              "Quiz Preparing",
            ],
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Please select any bookmark",
                hintText: "menu mode",
              ),
            ),
            onChanged: print,
            selectedItem: "All",
          ),
        ),
      ),
    );
  }

  Widget feedForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
      height: 55,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        foregroundColor: kWhite,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          "Feedback",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          feedImag(),
          feedTitle(),
          const SizedBox(
            height: 5,
          ),
          feedDesc(),
          dropdownFeed(),
          feedForm(),
          submitButton(),
        ],
      ),
    );
  }
}
