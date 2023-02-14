# third_kopo

This package is a rewritten Korean postal code search service based on the [kopo](https://pub.dev/packages/kopo) package.


## Setup
```yaml
#Android App Gradle
defaultConfig {
  minSdkVersion 19
  ...
```

## Getting Started

You should ensure that you add the router as a dependency in your flutter project.
```yaml
dependencies:
 third_kopo: ^0.0.1
```

## Example

```dart
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_kopo/third_kopo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopo Demo',
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kopo Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('find Korea Postal address'),
              onPressed: () async {
                KopoModel model = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ThirdKopo(),
                  ),
                );
                print(model.toJson());
                setState(() {
                  addressJSON =
                  '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''} ${model.zonecode} ';
                });
              },
            ),
            Text('$addressJSON'),
          ],
        ),
      ),
    );
  }
}

```