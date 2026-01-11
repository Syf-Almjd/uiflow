### Form Validation

```dart
// Using validators in a form
TextFormField(
  validator: AppValidators.email,
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email',
  ),
)

// Password with custom requirements
TextFormField(
  validator: (value) => AppValidators.password(
    value,
    minLength: 8,
    requireUppercase: true,
    requireDigit: true,
  ),
  obscureText: true,
)

// Combining validators
TextFormField(
  validator: AppValidators.combine([
    (value) => AppValidators.required(value, fieldName: 'Username'),
    (value) => AppValidators.minLength(value, 3, fieldName: 'Username'),
    AppValidators.username,
  ]),
)
```

### Text Formatters

```dart
// Phone number formatting
TextField(
  inputFormatters: [AppFormatters.phone()],
  keyboardType: TextInputType.phone,
  decoration: InputDecoration(labelText: 'Phone'),
)

// Credit card formatting
TextField(
  inputFormatters: [AppFormatters.creditCard()],
  keyboardType: TextInputType.number,
  decoration: InputDecoration(labelText: 'Card Number'),
)

// Currency formatting
TextField(
  inputFormatters: [AppFormatters.currency(symbol: '\$')],
  keyboardType: TextInputType.number,
  decoration: InputDecoration(labelText: 'Amount'),
)
```

### Dialogs

```dart
// Confirmation dialog
final confirmed = await AppDialogs.showConfirmation(
  context,
  title: 'Delete Item',
  message: 'Are you sure you want to delete this item?',
  isDangerous: true,
  icon: Icons.delete,
);

if (confirmed == true) {
  // Delete item
}

// Success dialog
await AppDialogs.showSuccess(
  context,
  message: 'Your profile has been updated successfully!',
);

// Input dialog
final name = await AppDialogs.showInput(
  context,
  title: 'Enter Name',
  hintText: 'Your name',
  validator: (value) => AppValidators.required(value, fieldName: 'Name'),
);
```

### Advanced Widgets

```dart
// Badge
Stack(
  children: [
    Icon(Icons.notifications),
    Positioned(
      right: 0,
      top: 0,
      child: AppBadge.count(count: 5),
    ),
  ],
)

// Chip
AppChip(
  label: 'Flutter',
  icon: Icons.flutter_dash,
  selected: true,
  onTap: () {},
  onDelete: () {},
)

// Avatar
AppAvatar(
  name: 'John Doe',
  imageUrl: 'https://example.com/avatar.jpg',
  size: 50,
  onTap: () {},
)

// Empty State
AppEmptyState(
  icon: Icons.inbox,
  title: 'No Messages',
  message: 'You don\'t have any messages yet',
  actionLabel: 'Refresh',
  onAction: () {},
)
```

### Animations

```dart
// Fade in animation
AnimatedFadeIn(
  duration: Duration(milliseconds: 500),
  delay: Duration(milliseconds: 200),
  child: YourWidget(),
)

// Shimmer loading effect
ShimmerLoading(
  child: Container(
    width: 200,
    height: 100,
    color: Colors.white,
  ),
)
```

### String Extensions

```dart
// Capitalize
'hello world'.capitalize(); // 'Hello world'
'hello world'.capitalizeWords(); // 'Hello World'

// Validation
'test@example.com'.isValidEmail; // true

// Truncate
'This is a long text'.truncate(10); // 'This is a...'

// Mask sensitive data
'john@example.com'.maskEmail(); // 'j***@example.com'
```

### DateTime Extensions

```dart
final date = DateTime.now();

// Format
date.formattedDate; // 'Jan 11, 2026'
date.formattedTime; // '3:45 PM'

// Time ago
date.timeAgo; // 'just now', '5 minutes ago', etc.
```

### Number Extensions

```dart
// Currency formatting
1234.toCurrency(); // '$1,234'

// Ordinals
1.ordinal; // '1st'
2.ordinal; // '2nd'
```
