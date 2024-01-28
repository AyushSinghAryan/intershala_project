// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class JobTile extends StatelessWidget {
  String jobRole;
  String companyName;
  String salary;
  bool jobType;
  String jobLocation;
  String duration;
  bool incentive;
  String postedByLabel;
  bool workFromHome;

  JobTile({
    Key? key,
    required this.jobRole,
    required this.companyName,
    required this.salary,
    required this.jobType,
    required this.jobLocation,
    required this.duration,
    required this.incentive,
    required this.postedByLabel,
    required this.workFromHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade400, // Color of the border
                    width: 2, // Width of the border
                  ),
                ),
                child: Container(
                  width: 120,
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Colors.blue,
                      ),
                      Text("Actively hiring"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobRole,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        addEllipsisIfNeeded(companyName),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Icon(
                    Icons.photo,
                    size: 40,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              workFromHome
                  ? Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Work from Home",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          jobLocation,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.play_circle_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Starts Immediately",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    duration,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.money_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    salary,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  incentive
                      ? Row(
                          children: [
                            Text(
                              "+",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Incentives",
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(
                              Icons.question_mark_rounded,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        )
                      : Text(""),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        // blurRadius: 10,
                      ),
                    ],
                  ),
                  child: jobType
                      ? Text(
                          "FullTime",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      : Text(
                          "Internship",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      // blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  width: 100,
                  child: Row(
                    children: [
                      Icon(Icons.access_time_rounded),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        postedByLabel,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                width: double.infinity,
                child: Text(
                  "View details",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String addEllipsisIfNeeded(String text) {
    List<String> words = text.split(' ');

    if (words.length > 4) {
      // Join the first 4 words and add ellipsis
      return words.sublist(0, 4).join(' ') + '...';
    }

    return text;
  }
}
