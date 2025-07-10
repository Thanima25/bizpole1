import 'package:bizpole_one_user/presentation/screens/business_type_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BizpoleApp());

class BizpoleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bizpole One',
      home: Choose_Business_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Choose_Business_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              "Let’s talk business!",
              style: TextStyle(
                fontSize: 24,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "To begin this journey, tell us what type\nof account you’d be opening.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 32),
            AccountOptionCard(
              title: "New company",
              subtitle: "I’m starting a company.",
              icon: Icons.apartment,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusinessTypeScreen()),
                ); // Navigate to new company flow
              },
            ),
            SizedBox(height: 16),
            AccountOptionCard(
              title: "Existing company",
              subtitle: "Own or belong to a company, this is for you.",
              icon: Icons.home_work,
              onTap: () {
                // Navigate to existing company flow
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const AccountOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber.shade700),
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber.shade50,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber.shade800, size: 32),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 28, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}
