import 'package:flutter/material.dart';

class myHome extends StatelessWidget {
  const myHome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          
        ],
      ),
      appBar: AppBar(
      
      title: Text("Vitify"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.person),),
        ),
      ],
      toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for(int i = 0; i < 5; i++)
            contentCard()
          ],
        )
        ),
      );
  }
}
class contentCard extends StatelessWidget {
  const contentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 800,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.person),),
                  Text("Username"),
                  Spacer(
                    flex: 1,  
                  ),
                  
                  
                ],

              ),
              SizedBox(
                height: 10,),
              Text("I saw someone die in AB1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,),
              Text("MAN THAT IS SO CRINGE"),
              Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.comment),),
                  Spacer(
                    flex: 1,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share),),
                ],
              )
            
            ]),
            
          ),
        ),
    );
  }
}