import 'package:dr_office_management/presentation/widgets/custom_speciality.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            Text(
              'Doctor Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Find your doctor'),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Special Doctors'),
              TextButton(
                onPressed: () {
                  // Implement view all action
                },
                child: Text('View All'),
              ),
            ],
          ),
          SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Consultation',
                color: Colors.blue,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Dental',
                color: Colors.purple,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Heart',
                color: Colors.orange,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Hospitals',
                color: Colors.green,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Medicines',
                color: Colors.red,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Physician',
                color: Colors.yellow,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Skin',
                color: Colors.teal,
              ),
              Customspeciality(
                icon: Icons.local_hospital,
                text: 'Surgeon',
                color: Colors.deepOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
