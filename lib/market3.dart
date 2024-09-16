import 'package:flutter/material.dart';

class Market3 extends StatefulWidget {
  final String title;
  const Market3({
    super.key,
    required this.title,
  });

  @override
  State<Market3> createState() => _Market3State();
}

class _Market3State extends State<Market3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset('assets/calculator.jpg'),
            // Product Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Advanced Scientific Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star_half, color: Colors.amber),
                  SizedBox(width: 16.0),
                  Text(
                    '150 Reviews',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Quality, Value, Case, Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRatingInfo('Quality', '4'),
                  _buildRatingInfo('Value', '5'),
                  _buildRatingInfo('Case', '4'),
                  _buildRatingInfo('Rating', '91%'),
                ],
              ),
            ),
            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'The Advanced Scientific Calculator is designed for students and professionals. It features a multi-line display, graphing capability, and comes with a battery included. The calculator is lightweight and portable.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Features & Specifications
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Features & Specifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Quantity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text('Quantity'),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  Text('1'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Add to Cart & Buy Now Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add to Cart'),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ),
            // Related Products
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Related Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Related Products Grid
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildRelatedProduct(index);
                },
              ),
            ),
            // User Reviews
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'User Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // User Reviews List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildUserReview(index);
              },
            ),
            // Write a Review Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text('Write a Review'),
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
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildRatingInfo(String label, String value) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 4.0),
        Text(value),
      ],
    );
  }

  Widget _buildRelatedProduct(int index) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/calculator.jpg'),
          SizedBox(height: 8.0),
          Text('Basic Calculator'),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star_half, color: Colors.amber),
              SizedBox(width: 4.0),
              Text('(120)'),
            ],
          ),
          SizedBox(height: 4.0),
          Text('\$19.99', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4.0),
          Text('\$24.99',
              style: TextStyle(decoration: TextDecoration.lineThrough)),
        ],
      ),
    );
  }

  Widget _buildUserReview(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user.jpg'),
                ),
                SizedBox(width: 8.0),
                Text('Alice Smith'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4.0),
                Text('2023-01-15'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'This calculator is fantastic for my engineering classes. The graphing feature is very helpful.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                Text('10'),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  onPressed: () {},
                ),
                Text('0'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
