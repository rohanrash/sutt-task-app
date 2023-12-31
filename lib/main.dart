import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> countryNames = [
      'Afghanistan',
      'Albania',
      'Algeria',
      'Andorra',
      'Angola',
    ];

    List<String> prefixTexts = [
      'AF',
      'AL',
      'DZ',
      'AD',
      'AO',
    ];

    List<IconData> suffixIcons = [
      Icons.star_border,
      Icons.star_border,
      Icons.star_border,
      Icons.star_border,
      Icons.star_border,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome!',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 11),
            child: CarouselSlider(
              items: [
                Image.asset('assets/image 2.png'),
                Image.asset('assets/image.png'),
                Image.asset('assets/Carousel 3.png'),
              ],
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 5000),
                enlargeCenterPage: true,
                height: 250.0,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/Group 1764.png',
              width: 390,
              height: 182,
              alignment: Alignment.centerLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(21.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search country',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.0),
                ),
              ),
              onChanged: (text) {},
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: countryNames.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  title: countryNames[index],
                  prefixText: prefixTexts[index],
                  suffixIcon: suffixIcons[index],
                );
              },
            ),
          ),
          // You can add more widgets here as needed
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String prefixText;
  final IconData suffixIcon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.prefixText,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8.0),
            Text(prefixText),
          ],
        ),
        title: Text(title),
        trailing: Icon(suffixIcon),
        // Other card content goes here
      ),
    );
  }
}
