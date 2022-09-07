import 'package:flutter/material.dart';
import 'package:selection_dialogs/models/country.dart';

import 'utils/general_const.dart';

class CountrySelectionDialog extends StatelessWidget {
  final Function onTap;
  const CountrySelectionDialog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchKey = '';
    List<Country> filteredCountry = countryList;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: TextField(
            onChanged: (value) {
              setState(() {
                filteredCountry = [];
                searchKey = value.toLowerCase();
                filteredCountry = countryList.where((element) => element.name.toLowerCase().contains(searchKey)).toList();
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
              itemCount: filteredCountry.length,
              itemBuilder: (BuildContext context, int index) {
                final item = filteredCountry[index];

                return InkWell(
                  onTap: () {
                    onTap(item);
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
                        height: 28,
                        width: 28,
                        child: Image.asset(
                          item.flagAsset,
                          package: "selection_dialogs",
                        ),
                      ),
                      // selected: isSelected,
                      title: Text(
                        item.name,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[800]),
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
