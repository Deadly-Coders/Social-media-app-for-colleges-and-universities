import 'package:flutter/material.dart';

class Resources3 extends StatefulWidget {
  const Resources3({super.key});

  @override
  State<Resources3> createState() => _Resources3State();
}

class _Resources3State extends State<Resources3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UT PYQS'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by Subject, Year, or Topic',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select Year Range:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '2015',
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '2023',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select Subject:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        DropdownButton<String>(
                          value: 'Mathematics',
                          items: <String>['Mathematics', 'Physics', 'Chemistry']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              // Update the selected subject
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Available Papers',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _PaperCard(
                      year: '2022',
                      subject: 'Mathematics',
                      questions: '50',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _PaperCard(
                      year: '2021',
                      subject: 'Physics',
                      questions: '45',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _PaperCard(
                      year: '2020',
                      subject: 'Chemistry',
                      questions: '40',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recent Papers',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2023',
                      subject: 'Math',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2023',
                      subject: 'Physics',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Featured Papers for Quick Revision',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2022',
                      subject: 'Math',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2021',
                      subject: 'Physics',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('[Subject] - [Year]',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Overview',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text('Questions List',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text('Solutions',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Additional Resources',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2019',
                      subject: 'Math',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _RecentPaperCard(
                      year: '2018',
                      subject: 'Physics',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                  ),
                  child: Text('Need Help or Have Feedback?',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.contact_support),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.file_copy),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PaperCard extends StatelessWidget {
  final String year;
  final String subject;
  final String questions;

  _PaperCard(
      {required this.year, required this.subject, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('$subject $year',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Number of Questions: $questions',
                style: TextStyle(fontSize: 12.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                child: Text('Download/Preview',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentPaperCard extends StatelessWidget {
  final String year;
  final String subject;

  _RecentPaperCard({required this.year, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('$subject $year',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Number of Questions...',
                style: TextStyle(fontSize: 12.0)),
          ),
        ],
      ),
    );
  }
}
