import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"image": "assets/burger.jpg", "text": "Burger"},
      {"image": "assets/default-pasta.jpg", "text": "Pasta"},
      {"image": "assets/burger.jpg", "text": "Salat"},
    ];

    List<String> restaurants = [
      "assets/restaurant1.jpeg",
      "assets/restaurant2.jpg",
      "assets/restaurant3.jpg",
      "assets/restaurant4.jpg"
    ];

    return Scaffold(
      appBar: appBar(),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Foods",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            listViewFood(items),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Featured Restaurants: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Image.asset(
                        restaurants[index],
                        width: 300,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox listViewFood(List<Map<String, dynamic>> items) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  items[index]["image"],
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 8),
                Text(
                  items[index]["text"],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container searchBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 5,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Image.asset("assets/left.png"),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 215, 215),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
