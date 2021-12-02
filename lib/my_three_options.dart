import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyThreeOptions extends StatefulWidget {
  const MyThreeOptions({Key? key}) : super(key: key);

  // const MyThreeOptions( {Key? key}) : super(key: key)


  @override
  State<MyThreeOptions> createState() => _MyThreeOptionsState();


}


/// We are using `withConverter` to ensure that interactions with the collection
/// are type-safe.
final db = FirebaseFirestore.instance;

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int? _value = 1;
  int? _size=10;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: const Text("Y Tube"),
        ),
        body: SizedBox(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,

          child:  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              alignment:Alignment.topLeft,

              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:    Column(
                    children: <Widget>[
                      SingleChildScrollView(

                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List<Widget>.generate(
                            _size!,
                                (int index) {
                              return ChoiceChip(
                                label: Text('Item $index'),
                                selected: _value == index,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected ? index : null;

                                    db.collection("videolist").get().then((querySnapshot) {
                                      querySnapshot.docs.forEach((result) {
                                        print(result.data());
                                      });
                                    });
                                  });
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                              stream: db.collection('videolist').snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView(
                                    shrinkWrap: true, // use this
                                    children: snapshot.data!.docs.map((doc) {
                                       var videoDesc=(doc.data() as Map)["videoDesc"].toString();
                                      return const Card(
                                        child: ListTile(
                                          title:  Text('Item '),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }
                              },

                      ),
                  ]









          ),
        ),
      ),
    ),
    ),
    );


  }
}
