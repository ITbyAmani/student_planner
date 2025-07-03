import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

//Screen number_1

class Student {
  String name;
  String field;
  String image;

  Student({required this.name, required this.field, required this.image});
}

class HomeScreen extends StatelessWidget {
  List students = [
    Student(name: 'أماني الدوسري', field: 'Flutter', image: 'student_girl.png'),

    Student(
      name: 'محمد أحمد',
      field: 'Web Development',
      image: 'student_boy.png',
    ),
    Student(
      name: 'سامي القاسم',
      field: 'Cybersecurity',
      image: 'student_boy.png',
    ),

    Student(
      name: 'ود التويجري',
      field: 'Artificial Intelligence',
      image: 'student_girl.png',
    ),

    Student(name: 'ليان عبدالله', field: 'UI/UX', image: 'student_girl.png'),

    Student(name: 'خالد الزهراني', field: 'Java', image: 'student_boy.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 34, 49, 59),
        title: Text(
          'إشراف تقني',
          style: TextStyle(
            color: const Color.fromARGB(255, 249, 249, 249),
            fontSize: 24,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: students.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),

          itemBuilder: (context, index) {
            final student = students[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanScreen(student: student),
                  ),
                );
              },

              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.asset(student.image, fit: BoxFit.cover),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 227, 222),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            student.name,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 34, 49, 59),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            student.field,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 34, 49, 59),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//Screen number_2

class PlanScreen extends StatefulWidget {
  Student student;

  PlanScreen({required this.student});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List weeks = [
    'الأسبوع الأول',
    'الأسبوع الثاني',
    'الأسبوع الثالث',
    'الأسبوع الرابع',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 49, 59),
        title: Text(
          'خطة ${widget.student.name}',
          style: TextStyle(
            color: const Color.fromARGB(255, 249, 249, 249),
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 249, 249, 249),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children:
                weeks.map((week) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 227, 222),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        title: Text(
                          week,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 49, 59),
                            fontSize: 18,
                          ),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: const Color.fromARGB(255, 34, 49, 59),
                          size: 20,
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => WeekScreen(
                                    studentName: widget.student.name,
                                    weekName: week,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}

//Screen number_3

class WeekScreen extends StatefulWidget {
  String studentName;
  String weekName;

  WeekScreen({required this.studentName, required this.weekName});

  @override
  _WeekScreen createState() => _WeekScreen();
}

class _WeekScreen extends State<WeekScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 49, 59),
        title: Text(
          '${widget.weekName}',
          style: TextStyle(
            color: const Color.fromARGB(255, 249, 249, 249),
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 249, 249, 249),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // الزوايا الدائرية
                image: DecorationImage(
                  image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/004/599/636/large_2x/hand-holding-tab-with-touch-pen-drawing-and-writing-use-tablet-and-pen-portable-gadget-for-office-and-hobbies-mockup-template-in-flat-illustration-editable-vector.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 10),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: const Color.fromARGB(255, 34, 49, 59),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'أهداف الأسبوع',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 49, 59),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_outlined,
                          color: const Color.fromARGB(255, 34, 49, 59),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'جدول الأسبوع',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 49, 59),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.link_outlined,
                          color: const Color.fromARGB(255, 34, 49, 59),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'مصادر موثوقة',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 49, 59),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
