import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/BaseView.dart';
import 'ProfileViewModel.dart';

class ProfileView extends BaseView<ProfileViewModel> {
  ProfileView() {
    controller.getUser();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/user1.png"),
              backgroundColor: Colors.white,
              maxRadius: 50,
              minRadius: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              surfaceTintColor: Colors.grey.shade50,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.user.value.Name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${controller.user.value.Age} Years Old",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 4,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${controller.user.value.Gender} ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "${controller.user.value.Address}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: SizedBox(
                //       width: MediaQuery.of(context).size.width,
                //       child: const Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text("View My Profile"),
                //             Icon(
                //               Icons.edit,
                //               size: 16,
                //             )
                //           ])),
                // ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Account Settings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  surfaceTintColor: Colors.grey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Row(children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.credit_card,
                                size: 22,
                              ),
                            ),
                            Expanded(flex: 8, child: Text("Payment Methods")),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Row(children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.notifications_outlined,
                                size: 22,
                              ),
                            ),
                            Expanded(flex: 8, child: Text("Notification")),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Legal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  surfaceTintColor: Colors.grey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Row(children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.feed_outlined,
                                size: 22,
                              ),
                            ),
                            Expanded(
                                flex: 8, child: Text("Terms and Services")),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Row(children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.feed_outlined,
                                size: 22,
                              ),
                            ),
                            Expanded(
                                flex: 8, child: Text("Privacy and Privacy")),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
