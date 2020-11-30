import 'package:cc_app/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cc_app/screens/home/components/body.dart';
import 'package:cc_app/screens/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        // when users want to add cards.
        FlatButton(
          onPressed: () => {_navigateToNextScreen(context)},
          color: Colors.orange,
          child: Column(
            children: <Widget>[Icon(Icons.add), Text("add")],
          ),
        ),
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      ],
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NewScreen()));
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Which credit cards do you have?')),
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn =
        await firestore.collection("credit_cards").getDocuments();

    return qn.documents;

    // Future getPosts() async {
    //   var firestore = Firestore.instance;
    //   Query q = firestore.collection("credit_cards");
    //   QuerySnapshot querySnapshot = await q.getDocuments();

    //   return querySnapshot.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      String space = " ";
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        title: Text(snapshot.data[index].data['bank'] +
                            space +
                            snapshot.data[index].data['name']),
                        trailing: Image(
                            image:
                                NetworkImage(snapshot.data[index].data['img'])),
                        onTap: () {},
                      );
                    });
              }
            }));
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
