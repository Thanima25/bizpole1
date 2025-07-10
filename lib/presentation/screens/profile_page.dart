import 'package:flutter/material.dart';

import 'choose_business.dart';

void main() {
  runApp(const BizpoleApp());
}

class BizpoleApp extends StatelessWidget {
  const BizpoleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bizpole',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const ProfileCompletionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileCompletionScreen extends StatefulWidget {
  const ProfileCompletionScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCompletionScreen> createState() => _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  String _selectedCountry = 'United States';
  String _selectedLanguage = 'Select language';
  String _selectedReferralSource = 'How did you spot us?';

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'India',
    'Germany',
    'France',
  ];

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Hindi',
  ];

  final List<String> _referralSources = [
    'Search Engine',
    'Social Media',
    'Friend Referral',
    'Advertisement',
    'Website',
    'App Store',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              'Bizpole',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [SizedBox(width: 48)], // Balance the leading icon
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tagline
              const Center(
                child: Text(
                  'Start. Run. Grow.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Title
              const Center(
                child: Text(
                  'Complete Your Profile!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Full Name field
              _buildTextField(
                controller: _fullNameController,
                hintText: 'Full name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              // Email field
              _buildTextField(
                controller: _emailController,
                hintText: 'Email id',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              // Country and Phone row
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildDropdownField(
                      value: _selectedCountry,
                      items: _countries,
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      controller: _phoneController,
                      hintText: 'Phone number',
                      icon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Address field
              _buildTextField(
                controller: _addressController,
                hintText: 'Address',
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 16),

              // Pin code and State row
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _pinCodeController,
                      hintText: 'Pin code',
                      icon: Icons.pin_drop_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      controller: _stateController,
                      hintText: 'State',
                      icon: Icons.location_city_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Language dropdown
              _buildDropdownField(
                value: _selectedLanguage,
                items: _languages,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                hint: 'Select language',
              ),
              const SizedBox(height: 16),

              // Referral source dropdown
              _buildDropdownField(
                value: _selectedReferralSource,
                items: _referralSources,
                onChanged: (value) {
                  setState(() {
                    _selectedReferralSource = value!;
                  });
                },
                hint: 'How did you spot us?',
              ),
              const SizedBox(height: 40),

              // Save button
              Center(
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save profile
                      _saveProfile();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Choose_Business_Screen()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Security notice
              const Center(
                child: Text(
                  'Your info is safely secured',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Light beige color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey.shade600,
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? hint,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Light beige color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: (hint != null && value == hint) ? null : value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint ?? value,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey.shade600,
        ),
        dropdownColor: const Color(0xFFF5F5DC),
      ),
    );
  }

  void _saveProfile() {
    // Validate and save profile data
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _pinCodeController.text.isEmpty ||
        _stateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Here you would typically save to a database or API
    print('Profile saved:');
    print('Full Name: ${_fullNameController.text}');
    print('Email: ${_emailController.text}');
    print('Country: $_selectedCountry');
    print('Phone: ${_phoneController.text}');
    print('Address: ${_addressController.text}');
    print('Pin Code: ${_pinCodeController.text}');
    print('State: ${_stateController.text}');
    print('Language: $_selectedLanguage');
    print('Referral Source: $_selectedReferralSource');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _pinCodeController.dispose();
    _stateController.dispose();
    super.dispose();
  }
}