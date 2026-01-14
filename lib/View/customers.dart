import 'package:flutter/material.dart';
import 'package:pet_ui/Core/Constants/app_colours.dart';
import 'package:pet_ui/View/services.dart';

class SitterCustomers extends StatefulWidget {
  const SitterCustomers({super.key});

  @override
  State<SitterCustomers> createState() => _SitterCustomersState();
}

class _SitterCustomersState extends State<SitterCustomers> {
  int _selectedIndex = 1;
  String _selectedTab = 'Customers';

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
  } else if (tab == 'Services') {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SitterServices(),
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
                  const SizedBox(height: 16),
                  // Search Bar with Icons in same row
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.textGrey,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle: const TextStyle(
                                      color: AppColors.textGrey,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.tune,
                          color: AppColors.primaryBlue,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.textGrey,
                            width: 1.5,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.pink,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Main Content - Customers List
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildCustomerCard(
                    name: 'Carlitta Pusso',
                    petInfo: 'Lora | Sheltie',
                    gender: 'Female',
                    petType: 'Guinea Pig',
                    petTypeColor: AppColors.pink,
                  ),
                  const SizedBox(height: 12),
                  _buildCustomerCard(
                    name: 'Carlitta Pusso',
                    petInfo: 'Lora | Sheltie',
                    gender: 'Female',
                    petType: 'Dog',
                    petTypeColor: AppColors.textDark,
                  ),
                  const SizedBox(height: 12),
                  _buildCustomerCard(
                    name: 'Carlitta Pusso',
                    petInfo: 'Lora | Sheltie',
                    gender: 'Female',
                    petType: 'Hamster',
                    petTypeColor: AppColors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildCustomerCard(
                    name: 'Carlitta Pusso',
                    petInfo: 'Lora | Sheltie',
                    gender: 'Female',
                    petType: 'Cat',
                    petTypeColor: AppColors.textDark,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.white,
        selectedItemColor: const Color.fromARGB(255, 0, 1, 3),
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

  Widget _buildCustomerCard({
    required String name,
    required String petInfo,
    required String gender,
    required String petType,
    required Color petTypeColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Customer Avatar with Image
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/girl.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Customer Info - All in Black with Poppins
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  petInfo,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  gender,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          // Pet Type Badge - Fixed width
          Container(
            width: 90,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: petTypeColor,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              petType,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: petTypeColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}