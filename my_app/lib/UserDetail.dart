import 'package:flutter/material.dart';

import 'models/user.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // จัดวางในแนวนอน (X-axis) ให้อยู่กึ่งกลาง
              crossAxisAlignment: CrossAxisAlignment
                  .center, // จัดวางในแนวตั้ง (Y-axis) ให้อยู่กึ่งกลาง
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        user.img,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(1),
                    child: Container(
                      width: 355,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Color(0xFFFF9800),
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Information",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 8), // Add some vertical spacing

                          // Use Flexible to allow text to wrap and expand vertically
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Username: ${user.username}',
                                  style: const TextStyle(fontSize: 16)),
                              Text('Email: ${user.email}',
                                  style: const TextStyle(fontSize: 16)),
                              Text('Phone: ${user.phone}',
                                  style: const TextStyle(fontSize: 16)),
                              Text('Website: ${user.website}',
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(1),
                    child: Container(
                      width: 355,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFFFF9800),
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 8), // Add some vertical spacing

                          // Use Flexible to allow text to wrap and expand vertically
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Street: ${user.address.street}'),
                              Text('Suite: ${user.address.suite}'),
                              Text('City: ${user.address.city}'),
                              Text('Zipcode: ${user.address.zipcode}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(1),
                    child: Container(
                      width: 355,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFFFF9800),
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Company",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 8), // Add some vertical spacing

                          // Use Flexible to allow text to wrap and expand vertically
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text('Name: ${user.company.name}'),
                          //     Text('Catch Phrase:: ${user.company.catchPhrase}'),
                          //     Text('Business: ${user.company.bs}'),
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${user.company.name}',
                                overflow: TextOverflow
                                    .ellipsis, // Use ellipsis to indicate overflow
                              ),
                              Text(
                                'Catch Phrase: ${user.company.catchPhrase}',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Business: ${user.company.bs}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
