import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est votre Poste Actuel ?",
        ),
        ...List.generate(occupations.length, (index) {
          String occupation = occupations[index];
          return CardChoix(
            index: index,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            title: occupation,
          );
        }),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
