import 'package:flutter/material.dart';

import 'utils/general_const.dart';

/// Language Selector
class GenderSelector extends StatelessWidget {
  final Function onTap;
  const GenderSelector({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Gender",
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: genderList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = genderList[index];

            return InkWell(
              onTap: () {
                onTap.call(item);
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xffC2C2C2,
                      ).withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ListTile(
                  // selected: isSelected,
                  title: Text(
                    item,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[800]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
