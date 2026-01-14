import 'package:flutter/material.dart';
import 'package:pet_ui/Core/Constants/app_colours.dart';
import 'package:pet_ui/View/customers.dart';

class SitterServices extends StatefulWidget {
  const SitterServices({super.key});

  @override
  State<SitterServices> createState() => _SitterServicesState();
}

class _SitterServicesState extends State<SitterServices> {
  int _selectedIndex = 1;
  String _selectedTab = 'Services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'Sitter',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.yellow,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: AppColors.primaryBlue,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  // Service Tabs
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: ['PawPrints', 'Services', 'Customers'].map((tab) {
                        bool isSelected = _selectedTab == tab;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
  if (tab == 'PawPrints') {
    Navigator.pop(context);
  } else if (tab == 'Customers') {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SitterCustomers(),
      ),
    );
  } else {
    setState(() {
      _selectedTab = tab;
    });
  }
},
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.yellow : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                tab,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isSelected ? AppColors.textDark : AppColors.textGrey,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Main Content with curved top
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(21, 24, 21, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Day Care Service Card
                    _buildServiceCard(
                      title: 'Day Care',
                      description: 'Pet day care facility\nShort stays up to 12 hrs.',
                      statusLabel: 'Active',
                      isActive: true,
                    ),
                    const SizedBox(height: 24),
                    // Night Stay Service Card
                    _buildServiceCard(
                      title: 'Night Stay',
                      description: 'Pet night stay facility\nLonger overnight stays',
                      statusLabel: 'Inactive',
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.white,
        selectedItemColor: const Color.fromARGB(255, 0, 1, 5),
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Sitter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Earning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    required String statusLabel,
    required bool isActive,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(21),
      child: Row(
        children: [
          // Image Container
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/finaldr.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Title and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    height: 1.4,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Status Badge - Solid color
          Container(
            decoration: BoxDecoration(
              color: isActive ? AppColors.green : AppColors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              statusLabel,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}