import 'package:flutter/material.dart';
import 'package:flutter_internshala_1/Components/job_title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThreeHomePage extends StatefulWidget {
  const ThreeHomePage({super.key});

  @override
  State<ThreeHomePage> createState() => _ThreeHomePageState();
}

class _ThreeHomePageState extends State<ThreeHomePage> {
  late Future<Map<String, dynamic>> response;

  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  Future<Map<String, dynamic>> fetchUsers() async {
    var result = await http
        .get(Uri.parse("https://internshala.com/flutter_hiring/search"));
    print(jsonDecode(result.body)['internships_meta']);
    return jsonDecode(result.body)['internships_meta'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1, // Since you are returning a Map, set itemCount to 1
              itemBuilder: (BuildContext context, int index) {
                var internship = snapshot.data!;

//  leading: Text(internship['title']),
                return Column(
                  children: internship.keys
                      .map((id) => _buildJobTile(internship[id]))
                      .toList(),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildJobTile(Map<String, dynamic> internshipData) {
    return Container(
      height: 380,
      width: 400,
      child: JobTile(
        workFromHome: internshipData['work_from_home'] ?? false,
        jobRole: internshipData['title'].toString(),
        companyName: internshipData["company_name"].toString(),
        salary: internshipData['stipend']['salary'].toString(),
        jobType: internshipData['part_time'],
        jobLocation: internshipData['work_from_home']
            ? ""
            : internshipData["location_names"][0],
        duration: internshipData['duration'].toString(),
        incentive: internshipData['incentive'] ?? false,
        postedByLabel: internshipData['posted_by_label'].toString(),
      ),
    );
  }
}
