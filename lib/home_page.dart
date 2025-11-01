import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "Lorem ipsum dolor sit amet",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "assets/images/illustration1.png",
    ),
    OnboardingItem(
      title: "Ut minim nostrud exercitation",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.",
      image: "assets/images/illustration2.png",
    ),
    OnboardingItem(
      title: "Duis aute dolor in reprehenderit",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.",
      image: "assets/images/illustration3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Color(0xff004b23),
        onPressed: () {
          if (currentIndex == onboardingItems.length - 1) {
            // your logic here often used to navigate to the next screen
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Icon(Icons.arrow_forward_rounded, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    elevation: 2,
                    foregroundColor: Color(0xff004b23),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),

              // PopupMenuButton<String>(
              //   onSelected: (String value) {
              //     print('Selected: $value');
              //   },
              //   itemBuilder: (BuildContext context) {
              //     return ['Option 1', 'Option 2', 'Option 3'].map((
              //       String choice,
              //     ) {
              //       return PopupMenuItem<String>(
              //         value: choice,
              //         child: Text(choice),
              //       );
              //     }).toList();
              //   },
              // ),
              const SizedBox(height: 25),

              Expanded(
                child: PageView.builder(
                  itemCount: onboardingItems.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingItems[index];
                    return Column(
                      children: [
                        Image.asset(item.image),
                        // SizedBox(height: 25),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                fontFamily: 'Baloo',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Row(
                children: List.generate(onboardingItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentIndex == index ? 30 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Color(0xff004b23)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
