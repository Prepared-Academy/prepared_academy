import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

// ignore: non_constant_identifier_names
Widget gridViewBookMark() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 500,
      child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          childAspectRatio: 1.15,
          children: List.generate(
              6,
              (index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.black,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: 10),
                          // width: 180,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x48969696),
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 108,
                                    width: 200,
                                    // width: MediaQuery.of(context).size.width,
                                    child: Image.asset(
                                      'assets/images/teach1.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          " Biology",
                                          // style: Text16,
                                          style: TextStyle(
                                            color: kBlack,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: SizedBox(
                                  width: 150,
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    " Habitat of the living",
                                    style: TextStyle(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
    ),
  );
}

Widget qwerty() {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 180,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Color(0x48969696), spreadRadius: 1, blurRadius: 1)
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              // width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/teach1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    " Biology",
                    // style: Text16,
                    style: TextStyle(
                      color: kBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: 150,
            // ignore: prefer_const_constructors
            child: Text(
              " Habitat of the living",
              style: TextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget dropdownBookMark() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: kWhite, spreadRadius: 1),
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

//   DropdownSearch<String>.multiSelection(
//     items: ["All", "Videos", "Subjects", 'Sliders'],
//     popupProps: PopupPropsMultiSelection.menu(
//       showSelectedItems: true,
//       disabledItemFn: (String s) => s.startsWith('I'),
//     ),
//     onChanged: print,
//     selectedItems: ["All"],
//   );
}

class _BookmarkState extends State<Bookmark> {
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
          "Bookmarks",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kWhite,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          dropdownBookMark(),
          gridViewBookMark(),
          // qwerty(),
        ],
      )),
    );
  }
}
