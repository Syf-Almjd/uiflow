import 'package:flutter/material.dart';
import 'package:uiflow/uiflow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uiflow Showcase',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      darkTheme: getDarkApplicationTheme(),
      themeMode: ThemeMode.light,
      home: const ShowcaseHomeScreen(),
    );
  }
}

class ShowcaseHomeScreen extends StatefulWidget {
  const ShowcaseHomeScreen({super.key});

  @override
  State<ShowcaseHomeScreen> createState() => _ShowcaseHomeScreenState();
}

class _ShowcaseHomeScreenState extends State<ShowcaseHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isButtonLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _cardController = TextEditingController();
  final _currencyController = TextEditingController();
  final _customFieldController = TextEditingController();
  
  double _progressValue = 0.45;
  int _badgeCount = 5;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _cardController.dispose();
    _currencyController.dispose();
    _customFieldController.dispose();
    super.dispose();
  }

  void _showResultSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uiflow Components Showcase', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.appBarColor,
        elevation: 4,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.widgets), text: 'Widgets'),
            Tab(icon: Icon(Icons.input), text: 'Forms & Buttons'),
            Tab(icon: Icon(Icons.question_answer), text: 'Dialogs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWidgetsTab(),
          _buildFormsTab(),
          _buildDialogsTab(),
        ],
      ),
    );
  }

  Widget _buildWidgetsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Advanced Widgets',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkColor),
        ),
        const SizedBox(height: 8),
        const Text(
          'Clean, customizable layout widgets built for high performance and premium styling.',
          style: TextStyle(color: Colors.grey),
        ),
        const AppDivider(text: 'AppCard & Badges'),
        
        AppCard(
          elevation: 4,
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Card with Elevation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AppBadge(
                    text: _badgeCount > 9 ? '9+' : _badgeCount.toString(),
                    backgroundColor: AppColors.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text('This Card demonstrates the elevation and custom inner spacing helper layout in uiflow.'),
              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _badgeCount++),
                    child: const Text('Increment Badge'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => setState(() => _badgeCount = 0),
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const AppDivider(text: 'AppChips & Avatars'),
        
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            const AppAvatar(
              name: 'John Doe',
              size: 50,
            ),
            const AppAvatar(
              name: 'Saif Al Majd',
              size: 50,
              backgroundColor: AppColors.secondaryColor,
            ),
            AppChip(
              label: 'Selected Tag',
              selected: true,
              icon: Icons.check,
              onTap: () => _showResultSnackBar('Selected chip tapped!'),
            ),
            AppChip(
              label: 'Removable Tag',
              selected: false,
              icon: Icons.label,
              onDelete: () => _showResultSnackBar('Chip deleted!'),
            ),
          ],
        ),

        const AppDivider(text: 'AppProgress Indicators'),
        
        AppCard(
          child: Column(
            children: [
              AppProgress(
                value: _progressValue,
                label: 'Download Status',
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        _progressValue = (_progressValue - 0.1).clamp(0.0, 1.0);
                      });
                    },
                  ),
                  Text('${(_progressValue * 100).toInt()}%'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _progressValue = (_progressValue + 0.1).clamp(0.0, 1.0);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        const AppDivider(text: 'AppEmptyState'),
        const SizedBox(
          height: 240,
          child: AppEmptyState(
            icon: Icons.search_off,
            title: 'No Items Found',
            message: 'Try adjusting your filters or checking back later.',
          ),
        ),
      ],
    );
  }

  Widget _buildFormsTab() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Form Formatters & Validators',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkColor),
          ),
          const SizedBox(height: 8),
          const Text(
            'Advanced inputs, pre-built formatters, and validation helpers.',
            style: TextStyle(color: Colors.grey),
          ),
          const AppDivider(text: 'Pre-styled Text Field'),
          
          textFieldA(
            controller: _customFieldController,
            hintText: 'Enter random text',
            prefixIcon: const Icon(Icons.text_fields),
          ),
          
          const AppDivider(text: 'Input Formatters'),
          
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [AppFormatters.phone()],
            decoration: const InputDecoration(
              labelText: 'Phone Formatter',
              hintText: '(123) 456-7890',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
            validator: AppValidators.phone,
          ),
          const SizedBox(height: 16),
          
          TextFormField(
            controller: _cardController,
            keyboardType: TextInputType.number,
            inputFormatters: [AppFormatters.creditCard()],
            decoration: const InputDecoration(
              labelText: 'Credit Card Formatter',
              hintText: '1234 5678 1234 5678',
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
            ),
            validator: AppValidators.creditCard,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _currencyController,
            keyboardType: TextInputType.number,
            inputFormatters: [AppFormatters.currency()],
            decoration: const InputDecoration(
              labelText: 'Currency Formatter',
              hintText: '\$0.00',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
          ),
          
          const AppDivider(text: 'Buttons & Loaders'),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonA(
                buttonText: 'buttonA Simple',
                onPressed: () {
                  _showResultSnackBar('buttonA pressed!');
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          loadButton(
            context: context,
            buttonText: 'Submit Form (loadButton)',
            isLoading: _isButtonLoading,
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                setState(() => _isButtonLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                setState(() => _isButtonLoading = false);
                _showResultSnackBar('Form successfully submitted!');
              } else {
                _showResultSnackBar('Please fix errors in the form.');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDialogsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Interactive Dialog Helpers',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkColor),
        ),
        const SizedBox(height: 8),
        const Text(
          'Launch premium alert dialogs, confirmation dialogs, inputs, and selectors.',
          style: TextStyle(color: Colors.grey),
        ),
        const AppDivider(text: 'Action Dialogs'),
        
        ListTile(
          title: const Text('Confirmation Dialog'),
          subtitle: const Text('Asks user to accept or reject an action'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () async {
            final res = await AppDialogs.showConfirmation(
              context,
              title: 'Delete Item?',
              message: 'This process cannot be undone. Are you sure?',
              isDangerous: true,
            );
            _showResultSnackBar('Confirmation Dialog Result: $res');
          },
        ),
        const Divider(),
        
        ListTile(
          title: const Text('Success Dialog'),
          subtitle: const Text('Shows success status feedback'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () async {
            await AppDialogs.showSuccess(
              context,
              title: 'Success!',
              message: 'Your file has been uploaded successfully.',
            );
          },
        ),
        const Divider(),

        ListTile(
          title: const Text('Error Dialog'),
          subtitle: const Text('Shows error status feedback'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () async {
            await AppDialogs.showError(
              context,
              message: 'Could not connect to server. Please try again.',
            );
          },
        ),
        const Divider(),

        ListTile(
          title: const Text('Input Dialog'),
          subtitle: const Text('Collects text input dynamically'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () async {
            final val = await AppDialogs.showInput(
              context,
              title: 'New Project Name',
              hintText: 'Enter name',
            );
            if (val != null) {
              _showResultSnackBar('Project name entered: $val');
            }
          },
        ),
        const Divider(),

        ListTile(
          title: const Text('Selection Dialog'),
          subtitle: const Text('Presents options list to pick from'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () async {
            final val = await AppDialogs.showSelection<String>(
              context,
              title: 'Select Role',
              items: ['Administrator', 'Manager', 'Developer', 'Viewer'],
              itemBuilder: (item) => item,
              initialSelection: 'Developer',
            );
            if (val != null) {
              _showResultSnackBar('Selected role: $val');
            }
          },
        ),
      ],
    );
  }
}
