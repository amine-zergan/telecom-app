import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RetourMaterial extends StatelessWidget {
  const RetourMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Demande Retour Material"),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: Get.height,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            children: [
              Container(
                height: 130,
                color: const Color.fromARGB(255, 84, 68, 17),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text("Ajouter code Site :"),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 5,
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date de retour",
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.date_range,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 100,
                child: const Text(
                  "operateur",
                ),
              ),
              Container(
                color: Colors.black38,
                width: double.infinity,
                height: 100,
                child: const Text(
                  "Fournisseur",
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    "Ajouter equipement demonté",
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.add_circle_outline_outlined,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
