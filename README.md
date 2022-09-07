A Flutter plugin for showing country and language selection dialog

## Features

- Country dialog
- Language dialog

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage



```dart
 showDialog(
context: context,
builder: (BuildContext context) {
return CountrySelectionDialog(
onTap: (Country country) {
print("${country.name}---${country.isoCode}");
},
);
},
);
```


```dart
showDialog(
context: context,
builder: (BuildContext context) {
return LanguageSelector(
  onTap: (LanguageData item) {
    print("${item.name}---${item.locale}---${item.flag}---${item.nativeName}");
    // Navigator.pop(context);
  },
);
},
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
