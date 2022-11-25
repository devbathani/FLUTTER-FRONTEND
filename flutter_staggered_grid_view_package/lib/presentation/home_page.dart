import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_grid_view_package/repo/image_entity.dart';
import 'package:flutter_staggered_grid_view_package/repo/image_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImageEntity? imageEntity;
  @override
  void initState() {
    super.initState();
    getImages();
  }

  getImages() async {
    imageEntity = await ImageRepo.getImage();
    setState(() {});
  }

  Widget buildImage(Hit image) {
    var r = Random();
    int h = 180 + r.nextInt(200);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          image.largeImageUrl!,
          errorBuilder: (context, error, stackTrace) {
            return Container();
          },
          height: h.toDouble(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff004e92),
              Color(0xff000428),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Staggered View",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              imageEntity == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          imageEntity!.hits.length,
                          (index) {
                            final image = imageEntity!.hits[index];
                            return buildImage(image);
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
