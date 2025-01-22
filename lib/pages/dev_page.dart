import 'package:flowx/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as launcher;

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                width: MediaQuery.of(context).size.width * 1.5,
                right: MediaQuery.of(context).size.height * -0.03,
                bottom: MediaQuery.of(context).size.height * 0.165,
                child: Image.asset(
                  "assets/lotte/user.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.18,
                left: MediaQuery.of(context).size.height * 0.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You can join \nwith us !",
                      style: AppTextStyles.topicStyle.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 1,
                      "( Developer : Tharindu Nirmal )",
                      style: AppTextStyles.topicStyle.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.redAccent,
                          Colors.blueAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Learn \n design \n   & code",
                          style: AppTextStyles.topicStyle.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launcher.launchUrl(
                                    Uri.parse(
                                        'https://github.com/THARINDUnirmal'),
                                    mode: launcher
                                        .LaunchMode.externalApplication);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.53,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.amber,
                                      Colors.red,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Join with GitHub",
                                    style: AppTextStyles.subTopicStyle.copyWith(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Or",
                              style: AppTextStyles.buttonStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                launcher.launchUrl(
                                  Uri.parse(
                                      "mailto:tharindunirmal1111@gmail.com?subject=Hi&body=Hello"),
                                );
                              },
                              icon: const Icon(
                                Icons.mail,
                                size: 35,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
