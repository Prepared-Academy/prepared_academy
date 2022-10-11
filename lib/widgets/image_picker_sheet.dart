import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModalImageSelector extends StatelessWidget {
  const ModalImageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        enableDrag: false,
        onClosing: () {
          return;
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (_) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Select:", style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 1.2 / 2,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(ImageSource.camera);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.camera,
                                  size: 40,
                                  color: Theme.of(context).primaryColor),
                              Text("camera",
                                  style: Theme.of(context).textTheme.overline)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(ImageSource.gallery);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.collections,
                                  size: 40,
                                  color: Theme.of(context).primaryColor),
                              Text("gallery",
                                  style: Theme.of(context).textTheme.overline)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ));
  }
}
