import 'package:flutter/material.dart';
import 'package:pet_ui/Core/Constants/app_colours.dart';
import 'package:pet_ui/View/services.dart';
import 'package:pet_ui/View/customers.dart';

class PetSitterDashboard extends StatefulWidget {
  const PetSitterDashboard({super.key});

  @override
  State<PetSitterDashboard> createState() => _PetSitterDashboardState();
}

class _PetSitterDashboardState extends State<PetSitterDashboard> {
  int _selectedIndex = 0;
  String _selectedTab = 'PawPrints';
  String _selectedPeriod = 'This Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'Pet Sitter',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
                              if (tab == 'Services') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SitterServices(),
                                  ),
                                );
                              } else if (tab == 'Customers') {
                                Navigator.push(
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
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Period Tabs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['This Week', 'This Month', 'This Year', 'All Time']
                        .map((period) {
                      bool isSelected = _selectedPeriod == period;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPeriod = period;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected ? AppColors.white : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          child: Text(
                            period,
                            style: TextStyle(
                              color: isSelected ? AppColors.primaryBlue : AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // Main Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Your Pet Sitting Performance',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Performance Cards Grid - Responsive
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.4,
                    children: [
                      _buildPerformanceCard(
                        title: 'Views',
                        value: '999,000',
                        icon: Icons.visibility,
                        iconSize: 52,
                        iconColor: AppColors.primaryBlue,
                      ),
                      _buildPerformanceCard(
                        title: 'Likes',
                        value: '999,000',
                        icon: Icons.favorite,
                        iconSize: 41,
                        iconColor: AppColors.red,
                      ),
                      _buildPerformanceCard(
                        title: 'Bookings',
                        value: '999,000',
                        icon: Icons.calendar_today,
                        iconSize: 36,
                        iconColor: AppColors.primaryBlue,
                      ),
                      _buildPerformanceCard(
                        title: 'Earnings',
                        value: '999,000',
                        isEarnings: true,
                        iconColor: AppColors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Overall Ratings Section
                  Container(
                    width: double.infinity,
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Overall Ratings',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '4.8',
                              style: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return const Icon(
                                  Icons.star,
                                  color: AppColors.primaryBlue,
                                  size: 20,
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Recent Reviews Section
                  const Text(
                    'Recent Reviews',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.textGrey,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Avantika Agarwal',
                                    style: TextStyle(
                                      color: AppColors.textDark,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return const Icon(
                                        Icons.star,
                                        color: AppColors.orange,
                                        size: 16,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              '2 days ago',
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Michael is amazing with pets! He took exceptional care of my two cats while I was away. He took exceptional care of my two cats while I was away.',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
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
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
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

  Widget _buildPerformanceCard({
    required String title,
    required String value,
    required Color iconColor,
    IconData? icon,
    double iconSize = 24,
    bool isEarnings = false,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: isEarnings
                ? SizedBox(
                    width: 43,
                    height: 43,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Bigger circle - dark color
                        Container(
                          width: 43,
                          height: 43,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: iconColor,
                          ),
                        ),
                        // Smaller circle - white
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}