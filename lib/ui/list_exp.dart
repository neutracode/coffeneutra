import 'package:flutter/material.dart';
import 'package:portofolio/data/dummy/experience_data_dummy.dart';
import 'package:portofolio/static/navigation_route.dart';

class ListExp extends StatelessWidget {
  const ListExp({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return SizedBox(
      height: 250.0,
      child: Scrollbar(
        thickness: 15,
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: experienceList.length,
          itemBuilder: (context, index) {
            final experience = experienceList[index];

            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NavigationRoute.detailExp.name,
                  arguments: experienceList[index],
                );
              },
              child: Card(
                child: SizedBox(
                  width: 300.0,
                  height: 450.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            experience.imagePaths.isNotEmpty
                                ? experience.imagePaths[0]
                                : 'lib/assets/images/default.png',
                            width: 200,
                            height: 200.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          experience.title,
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        Expanded(
                            child: Text(
                          experience.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
