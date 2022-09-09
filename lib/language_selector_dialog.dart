import 'package:flutter/material.dart';
import 'package:selection_dialogs/models/language.dart';

import 'utils/general_const.dart';

/// Language Selector
class LanguageSelector extends StatelessWidget {
  final Function onTap;
  const LanguageSelector({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchKey = '';
    List<LanguageData> filteredLanguage = getModelItems();
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: TextField(
            onChanged: (value) {
              setState(() {
                filteredLanguage = [];
                searchKey = value.toLowerCase();
                filteredLanguage = getModelItems().where((element) => element.name.toLowerCase().contains(searchKey)).toList();
              });
            },
            decoration: InputDecoration(
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.grey[800]),
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  color: Color(0xffE2E8F0),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  color: Color(0xffE2E8F0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  color: Color(0xffE2E8F0),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xff94A3B8),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredLanguage.length,
              itemBuilder: (BuildContext context, int index) {
                final item = filteredLanguage[index];

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
                      leading: SizedBox(
                        height: 45,
                        width: 45,
                        child: Image.asset(
                          item.flag,
                          package: "selection_dialogs",
                        ),
                      ),
                      // selected: isSelected,
                      title: Text(
                        item.name,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[800]),
                      ),
                      subtitle: Text(
                        item.nativeName,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey[800]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
