import 'package:flutter/material.dart';

void main() {
  runApp(const SeaFalconsApp());
}

class SeaFalconsApp extends StatelessWidget {
  const SeaFalconsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sea Falcons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003366),
          primary: const Color(0xFF003366),
          secondary: const Color(0xFF008080),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صقور البحر للنقل البحري | Sea Falcons'),
        backgroundColor: const Color(0xFF003366),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              color: Color(0xFFE6F0FA),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.directions_boat, size: 40, color: Color(0xFF003366)),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'نظام المعاينات والخدمات البحرية',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003366)),
                        ),
                        Text('Marine Survey & Inspection System'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'الخدمات السريعة / Quick Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildServiceCard(context, Icons.scale, 'Draft Survey', 'معاينة الغاطس'),
                  _buildServiceCard(context, Icons.local_fuel_station, 'Bunker Survey (BQS)', 'معاينة وقود السفن'),
                  _buildServiceCard(context, Icons.water_drop, 'VGP Sampling', 'أخذ عينات المياه'),
                  _buildServiceCard(context, Icons.photorack_outlined, 'UWILD & Hull', 'فحص القاع تحت الماء'),
                  _buildServiceCard(context, Icons.qr_code_scanner, 'ZATCA Invoices', 'الفواتير الإلكترونية'),
                  _buildServiceCard(context, Icons.folder_shared, 'Vessel Documents', 'مستندات وتراخيص السفن'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildServiceCard(BuildContext context, IconData icon, String titleEn, String titleAr) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم اختيار: $titleEn ($titleAr)')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color(0xFF008080)),
            const SizedBox(height: 8),
            Text(titleEn, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Text(titleAr, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
