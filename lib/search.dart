import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Find Services'), centerTitle: true),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterButtons(),
          Expanded(child: _buildServiceProviderGrid(screenWidth)),
        ],
      ),
    );
  }

  // **Search Bar**
  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a service...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  // **Filter Buttons**
  Widget _buildFilterButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterChip(label: Text('Plumbing'), onSelected: (_) {}),
          FilterChip(label: Text('Electrical'), onSelected: (_) {}),
          FilterChip(label: Text('Cleaning'), onSelected: (_) {}),
          FilterChip(label: Text('Plumbing'), onSelected: (_) {}),
          
        ],
      ),
    );
  }

  // **Grid of Service Providers**
  Widget _buildServiceProviderGrid(double width) {
    List<Map<String, String>> providers = [
      {
        'name': 'Fix-It Plumbing',
        'location': 'New York',
        'image': 'assets/plumber.jpg',
      },
      {
        'name': 'Spark Electricians',
        'location': 'Los Angeles',
        'image': 'assets/electrician.jpg',
      },
      {
        'name': 'Fix-It Plumbing',
        'location': 'New York',
        'image': 'assets/plumber.jpg',
      },
      {
        'name': 'Spark Electricians',
        'location': 'Los Angeles',
        'image': 'assets/electrician.jpg',
      },
      {
        'name': 'Fix-It Plumbing',
        'location': 'New York',
        'image': 'assets/plumber.jpg',
      },
      {
        'name': 'Spark Electricians',
        'location': 'Los Angeles',
        'image': 'assets/electrician.jpg',
      },
      {
        'name': 'Fix-It Plumbing',
        'location': 'New York',
        'image': 'assets/plumber.jpg',
      },
      {
        'name': 'Spark Electricians',
        'location': 'Los Angeles',
        'image': 'assets/electrician.jpg',
      },
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 600 ? 3 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: providers.length,
      itemBuilder: (context, index) {
        var provider = providers[index];
        return Card(
          child: Column(
            children: [
              Image.asset(provider['image']!, fit: BoxFit.cover),
              Text(
                provider['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(provider['location']!),
              ElevatedButton(
                child: Text('View Profile'),
                onPressed: () {
                  // Open profile screen
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
