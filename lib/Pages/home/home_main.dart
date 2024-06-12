import 'package:emr_m_app/Pages/home/home_route/prescriptions.dart';
import 'package:emr_m_app/Pages/home/home_route/profile.dart';
import 'package:emr_m_app/components/categoty_card.dart';
import 'package:emr_m_app/components/information_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    //profile button click function
    void profileRoute() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }

    void registerRoute() {}

    //the rest of the page
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8EB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //app bar
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Michael Uche",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      //profile pic
                      GestureDetector(
                        onTap: profileRoute,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF928490),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.person,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // card (How do you feel ?)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 196, 181, 185),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      //animation
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white54,
                        ),
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset('svg/appointment.svg'),
                      ),
                      const SizedBox(width: 20),
                      //How do you feel + get started
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "How do you feel?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Regular Check up Due...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Book an appointment now",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: registerRoute,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDBC1AD),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Click Here",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 196, 181, 185),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "How can we help you?",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // horizontal categories --> Request Ambulance etc...
              // ignore: sized_box_for_whitespace
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategotyCard(
                      categoryName: "View Medical Records",
                      svgPath: 'svg/drug.svg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrescriptionPage()),
                        );
                      },
                    ),
                    CategotyCard(
                      categoryName: "Treatment Log",
                      svgPath: "svg/appointment.svg",
                      onTap: () {},
                    ),
                    CategotyCard(
                      categoryName: "Lab Report",
                      svgPath: 'svg/microscope.svg',
                      onTap: () {},
                    ),
                    CategotyCard(
                      categoryName: "Request Ambulance",
                      svgPath: 'svg/ambulance.svg',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // HEALTH TIPS INFORMATION CAROUSEL
              const Text(
                "Health Tips ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 250,
                child: InfoCarousel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
