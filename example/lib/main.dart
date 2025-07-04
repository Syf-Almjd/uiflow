<h3 align="center">🚀 Access All Components Example (The Easy Way) 🚀</h3>

```dart

import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart'
    as components;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('uiflow Components Example'),
        ),
        body: Center(
          child: Text(
            'Welcome to uiflow Components!',
            style: components.getRegularStyle(
                color: Colors
                    .black), //This (components.) allows you to access all components
          ),
        ),
      ),
    );
  }
}
```





<h3 align="center">🎨 Access Components Individually Examples (The Traditional Way) 🎨</h3>

### App Colors 🍭

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Colors Example'),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Container(
          color: AppColors.backgroundColor,
          child: Center(
            child: Text(
              'This is an example of using App Colors',
              style: TextStyle(color: AppColors.textColor),
            ),
          ),
        ),
      ),
    ),
  );
}
```

### App Fonts 📝

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Fonts Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using App Fonts',
            style: getBoldStyle(),
          ),
        ),
      ),
    ),
  );
}
```

### App Text Styles ✨

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Text Styles Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using App Text Styles',
            style: getSemiBoldStyle(),
          ),
        ),
      ),
    ),
  );
}
```

### App Local Assets 🖼️

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Local Assets Example'),
        ),
        body: Center(
          child: Image.asset(
            AppAssets.logo,
            width: 150,
            height: 150,
          ),
        ),
      ),
    ),
  );
}
```

### App Local Constants 📌

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Local Constants Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using App Local Constants: ${AppConstants.appName}',
          ),
        ),
      ),
    ),
  );
}
```

### App Enums 🔢

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Enums Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using App Enums: ${AppAxis.horizontal}',
          ),
        ),
      ),
    ),
  );
}
```

### App Extensions 🚀

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Extensions Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using App Extensions: ${'Hello'.capitalize()}',
          ),
        ),
      ),
    ),
  );
}
```

### App Values 📏

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Values Example'),
        ),
        body: Padding(
          padding: AppPadding.all,
          child: Container(
            width: AppSize.large,
            height: AppSize.medium,
            color: AppColors.primaryColor,
            child: Center(
              child: Text(
                'This is an example of using App Values',
                style: getMediumStyle(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
```

### Buttons 🛍️

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buttons Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textFieldA(),
              SizedBox(height: AppMargin.small),
              loadButton(),
              SizedBox(height: AppMargin.small),
              buttonA(),
            ],
          ),
        ),
      ),
    ),
  );
}
```

### Fonts 🎀

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fonts Example'),
        ),
        body: Center(
          child: Text(
            'This is an example of using Fonts',
            style: fontPoppins(),
          ),
        ),
      ),
    ),
  );
}
```

### MultipleItemSelect ✅

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MultipleItemSelect Example'),
        ),
        body: MultipleItemSelect(
          items: ['Item 1', 'Item 2', 'Item 3'],
          onSelectionChanged: (selectedItems) {
            print('Selected Items: $selectedItems');
          },
        ),
      ),
    ),
  );
}
```

### Toast Show 🍞

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toast Show Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showToast('This is a toast message!');
            },
            child: Text('Show Toast'),
          ),
        ),
      ),
    ),
  );
}
```

### Widgets Display 🧩

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widgets Display Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columnHomeItems(),
            itemsList(),
            simpleCard(),
            rowHomeItems(),
            socialMediaItem(),
          ],
        ),
      ),
    ),
  );
}
```

### Responsiveness 📱

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsiveness Example'),
        ),
        body: Container(
          height: getHeight(50),
          width: getWidth(80),
          color: AppColors.primaryColor,
          child: Center(
            child: Text(


              'This is an example of using Responsiveness',
              style: getMediumStyle(),
            ),
          ),
        ),
      ),
    ),
  );
}
```

### Images Preview 🖼️

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Images Preview Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoContainer(),
              previewProductImage(),
              buildProductDetails(),
              socialMediaItems(),
              previewBase64Image(),
              chooseFile(),
            ],
          ),
        ),
      ),
    ),
  );
}
```

### General ⚙️

```dart
import 'package:flutter/material.dart';
import 'package:uiflow_components/uiflow_components.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('General Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              generateCode();
              validateForm();
              openUrl('https://example.com');
              assetToUint8List('assets/image.png');
              getWidgetByIndex(0);
              getDateTimeToDay(DateTime.now());
            },
            child: Text('General Functions'),
          ),
        ),
      ),
    ),
  );
}

```

<p align="center">Happy Fluttering! 💙</p>
