import 'package:flutter/material.dart';

class Career2 extends StatefulWidget {
  const Career2({super.key});

  @override
  State<Career2> createState() => _Career2State();
}

class _Career2State extends State<Career2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Career Opportunities',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Software Engineering Careers',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Software engineering is a dynamic and rewarding field that offers a variety of career paths. From developing cutting-edge applications to managing complex systems, software engineers...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(width: 16.0),
                    Text(
                      'Software Engineer',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Why Choose Software Engineering?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Choosing a career in software engineering offers numerous benefits. It provides a high level of job security and competitive salaries. The field is constantly evolving, offering continuous learning...',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Top Companies Hiring',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    CompanyCard(
                        companyImage: 'assets/google.png',
                        companyName: 'Google',
                        companyDescription:
                            'Innovative tech giant known for its...'),
                    CompanyCard(
                        companyImage: 'assets/microsoft.png',
                        companyName: 'Microsoft',
                        companyDescription:
                            'Leading software company with a wid...'),
                    CompanyCard(
                        companyImage: 'assets/amazon.png',
                        companyName: 'Amazon',
                        companyDescription:
                            'E-commerce and cloud computing...'),
                    CompanyCard(
                        companyImage: 'assets/facebook.png',
                        companyName: 'Facebook',
                        companyDescription:
                            'Social media giant with a focus on...'),
                    CompanyCard(
                        companyImage: 'assets/apple.png',
                        companyName: 'Apple',
                        companyDescription:
                            'Pioneering tech company known for it...'),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48.0, vertical: 16.0),
                  ),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work),
                    label: 'Jobs',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: 0,
                onTap: (index) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final String companyImage;
  final String companyName;
  final String companyDescription;

  const CompanyCard({
    Key? key,
    required this.companyImage,
    required this.companyName,
    required this.companyDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Image.asset(companyImage, height: 48.0, width: 48.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    companyDescription,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
