import 'package:cuentasqr/controllers/login_controller.dart';
import 'package:cuentasqr/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final mainController = Get.put(MainController());
  final userId = Get.parameters['userId'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                loginController.signOut();
              },
              child: const Text("Sign out"),
            );
          })
        ],
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<MainController>(
        builder: (main) {
          return FutureBuilder(
              future: main.getAmount(userId!),
              builder: (builder, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return new ListView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.amber.shade100,
                          child: ListTile(
                            leading: Text(snapshot.data![index].data().type!),
                            title: Text(snapshot.data![index].data().currency ==
                                    'Soles'
                                ? 'S/. ${snapshot.data![index].data().amount.toString()}'
                                : snapshot.data![index]
                                    .data()
                                    .amount
                                    .toString()),
                            subtitle:
                                Text(snapshot.data![index].data().currency),
                          ),
                        );
                      });
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () async {
            Get.toNamed('/weatherpage');
          }),
    );
  }
}
