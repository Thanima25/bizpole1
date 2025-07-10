import 'package:flutter/material.dart';

class BusinessTypeScreen extends StatefulWidget {
  const BusinessTypeScreen({super.key});

  @override
  State<BusinessTypeScreen> createState() => _BusinessTypeScreenState();
}

class _BusinessTypeScreenState extends State<BusinessTypeScreen> {
  String? selectedBusinessType;

  final List<String> businessTypes = [
    'Pvt Ltd',
    'LLP',
    'Partnership',
    'OPC',
    'Sole proprietor',
    'Trust',
  ];

  void _onNextPressed() {
    if (selectedBusinessType != null) {
      // Navigate or save selection
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected: $selectedBusinessType')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a business type')),
      );
    }
  }

  Widget _buildBusinessOption(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: title,
          groupValue: selectedBusinessType,
          activeColor: Colors.orange,
          onChanged: (value) => setState(() => selectedBusinessType = value),
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 8),

              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Bizpo',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(radius: 5, backgroundColor: Colors.orange),
                  Text(
                    'e',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                'Type of Business',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Business Type Options in 2 columns
              Wrap(
                spacing: 32,
                runSpacing: 12,
                children: businessTypes.map(_buildBusinessOption).toList(),
              ),

              const SizedBox(height: 40),

              // Next Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Next', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              const Spacer(),

              // Bottom Message with arrow
              Column(
                children: [
                  const Text(
                    '"Confused? We’re here to help! Your solution’s just a page away."',
                    style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
