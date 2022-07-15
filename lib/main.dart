import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/models/Product_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60,),
          searchBarRow(),
          const SizedBox(height: 30,),
          shareButton(),
          const SizedBox(height: 10,),
          productImages(),
          const SizedBox(height: 30,),
          otherButtons(),
          const SizedBox(height: 29.2,),
          productDetails(),
        ],
      ),
    );
  }

   searchBarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(14),
          child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(15)),
              ),
              child: ListTile(
                onTap: () {},
                title: Text('Phone',
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),),
                leading: const Icon(Icons.search, size: 28,),
              )
          ),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(14),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.display_settings_outlined)),
        ),
      ],
    );
  }

   shareButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, size: 14, color: Colors.grey[400],)),
            ),
          ),
        ),
        const SizedBox(width: 24,),
      ],
    );
  }

   productImages() {

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 190,
          child: PageView.builder(
            onPageChanged: (index){
              setState((){
                _selectedIndex = index;
              });
            },
            controller: PageController(viewportFraction: 0.5),
              itemCount: productBannerList.length,
              itemBuilder: (context, index){
              var _scale = _selectedIndex == index? 1.0 : 0.7;
                return TweenAnimationBuilder(
                  duration: const Duration(microseconds: 350),
                  tween: Tween(begin: _scale, end: _scale),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(productBannerList[index].urlImage),
                        fit: BoxFit.cover
                      )
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            alignment: Alignment.topRight,
                            child: Text(productBannerList[index].size),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ...List.generate(productBannerList.length, (index) => DotsRow(
             isActive: _selectedIndex == index ? true : false
           ))
          ],
        )

      ],

    );
  }


   otherButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.currency_exchange, color: Colors.blueAccent,)),
                  ),
                  const SizedBox(height: 16,),
                  const Expanded(
                      child: Text('Exchange', style: TextStyle(fontSize: 10),))
                ],
              ),
            ),
          ),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.heart_broken, color: Colors.red,)),
                  ),
                  const SizedBox(height: 16,),
                  const Expanded(
                      child: Text('Like', style: TextStyle(fontSize: 10),))
                ],
              ),
            ),
          ),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat, color: Colors.yellow,)),
                  ),
                  const SizedBox(height: 16,),
                  const Expanded(
                      child: Text('Chat', style: TextStyle(fontSize: 10),))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

   productDetails() {
    return Expanded(
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
        child: Container(
          height: 250,
          decoration:  BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(width: 20,),
                const Text('Iphone 11', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
                  const SizedBox(width: 165,),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(14),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person)),
                ),
              ],),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20,),
                  const Text('Location - ', style: TextStyle( fontSize: 15),),
                  const Text('Baghdad', style: TextStyle(color: Colors.grey, fontSize: 15),),
                  const SizedBox(width: 135,),
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 18.0,
                    direction: Axis.horizontal,
                  ),
                ],),
              const SizedBox(height: 10,),
              Row(
                children: const [
                   SizedBox(width: 20,),
                   Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                   SizedBox(width: 175,),
                  Material(
                    elevation: 5,
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Text('\$ 500', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                    ),
              ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: const [
                  SizedBox(width: 20,),
                   Text('Lorem ipsum dolor sit amet consectetur ', style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),
              Row(
                children: const [
                  SizedBox(width: 20,),
                  Text('numquam blanditiis harum quisquam eius', style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),
              Row(
                children: const [
                  SizedBox(width: 20,),
                  Text('dolor sit amet consectetur adipisicing elit. ', style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),
              Row(
                children: const [
                  SizedBox(width: 20,),
                  Text('excepturi expedita sint? Sed quibusdam. ', style: TextStyle(color: Colors.grey, fontSize: 15),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
class DotsRow extends StatelessWidget {
   DotsRow({Key? key, required this.isActive}) : super(key: key);
   final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: isActive? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}


