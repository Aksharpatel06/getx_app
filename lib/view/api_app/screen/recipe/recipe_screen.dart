import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/view/api_app/controller/recipe_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecipeController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Recipes app'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.card_travel_rounded,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: GetBuilder<RecipeController>(
        builder: (controller) => (controller.mainModal == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  itemCount: controller.mainModal!.recipesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 175,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: Text(
                                          controller
                                              .mainModal!.recipesList[index].name,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff303030)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Time',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller
                                                .mainModal!
                                                .recipesList[index]
                                                .prepTimeMinutes
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff303030)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child:
                                                const Icon(Icons.bookmark_border),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .mainModal!.recipesList[index].image))),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
            ),
      ),
    );
  }
}
