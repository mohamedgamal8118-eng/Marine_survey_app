import 'package:flutter/material.dart';

void main() {
  runApp(const SeaFalconsApp());
}

class SeaFalconsApp extends StatelessWidget {
  const SeaFalconsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sea Falcons Marine Survey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sea Falcons - صقور البحار'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: _currentIndex == 0 ? const NewSurveyForm() : const AnalyticsDashboard(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'معاينة جديدة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'التحليلات والتقارير',
          ),
        ],
      ),
    );
  }
}

class NewSurveyForm extends StatelessWidget {
  const NewSurveyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'تسجيل طلب معاينة جديد',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'اسم العميل',
              border: OutlineInputBorder(),
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'موقع المعاينة / الميناء',
              border: OutlineInputBorder(),
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'التاريخ المتوقع للمعاينة',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'المبلغ المتفق عليه (SAR/USD)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload_file),
            label: const Text('إرفاق أوراق المركب (سند الملكية / الرخصة)'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حفظ بيانات المعاينة بنجاح!')),
              );
            },
            child: const Text('حفظ الطلب والتذكير السنوي', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class AnalyticsDashboard extends StatelessWidget {
  const AnalyticsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'تحليل البيانات والتقارير الدورية',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(label: const Text('أسبوعي'), onSelected: (_) {}),
              FilterChip(label: const Text('شهري'), selected: true, onSelected: (_) {}),
              FilterChip(label: const Text('ربع سنوي'), onSelected: (_) {}),
              FilterChip(label: const Text('سنوي'), onSelected: (_) {}),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.blue.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('ملخص الفترة المحددة', style: TextStyle(fontWeight: FontWeight.bold)),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('إجمالي المعاينات:'), Text('12 معاينة')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('أعلى سعر معاينة:'), Text('5,000 SAR')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('أقل سعر معاينة:'), Text('1,200 SAR')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('أقرب موقع معاينة:'), Text('ميناء الملك عبد الله')],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
