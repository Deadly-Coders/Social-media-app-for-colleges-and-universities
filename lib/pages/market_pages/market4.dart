import 'package:flutter/material.dart';

class Market4 extends StatefulWidget {
  const Market4({super.key});

  @override
  State<Market4> createState() => _Market4State();
}

class _Market4State extends State<Market4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: const Text(
          'Purchase Scientific Calculator',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/calculator.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Advanced Scientific Calculator',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_half, color: Colors.amber),
                      SizedBox(width: 16),
                      Text(
                        '150 Reviews',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Advanced Scientific Calculator is designed for students and professionals. It features a multi-line display, graphing capability, and comes with a battery included. The calculator is lightweight and portable...',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Features & Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          const Text('1'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Related Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset('assets/calculator2.jpg'),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Basic Calculator',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star_half,
                                            color: Colors.amber),
                                        SizedBox(width: 8),
                                        Text('(120)'),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$19.99',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$24.99',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
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
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset('assets/calculator3.jpg'),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Graphing Calculator',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        Icon(Icons.star, color: Colors.amber),
                                        SizedBox(width: 8),
                                        Text('(200)'),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$59.99',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$69.99',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'User Reviews',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ReviewCard(
                    name: 'Alice Smith',
                    review:
                        'This calculator is fantastic for my engineering classes. The graphing feature is very helpful.',
                    rating: 5,
                    likes: 10,
                    dislikes: 0,
                  ),
                  const SizedBox(height: 16),
                  const ReviewCard(
                    name: 'John Doe',
                    review:
                        'Great value for the price. It has all the functions I need for my math courses.',
                    rating: 4,
                    likes: 8,
                    dislikes: 1,
                  ),
                  const SizedBox(height: 16),
                  const ReviewCard(
                    name: 'Emily Johnson',
                    review:
                        'I love the multi-line display. It makes calculations so much easier to follow.',
                    rating: 5,
                    likes: 12,
                    dislikes: 0,
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      child: const Text('Write a Review'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final int rating;
  final int likes;
  final int dislikes;

  const ReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.rating,
    required this.likes,
    required this.dislikes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(
                        rating,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              review,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    Text('$likes'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      onPressed: () {},
                    ),
                    Text('$dislikes'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
