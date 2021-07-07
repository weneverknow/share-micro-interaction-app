import 'package:example_tutorial/dribble/YesYouStudio/share_micro_interaction/models/food.dart';
import 'package:example_tutorial/dribble/YesYouStudio/share_micro_interaction/models/user.dart';
import 'package:example_tutorial/dribble/YesYouStudio/share_micro_interaction/ui/widget/circle_sending_progress.dart';
import 'package:example_tutorial/dribble/YesYouStudio/share_micro_interaction/ui/widget/sending_page.dart';
import 'package:flutter/material.dart';
import 'widget/save_item_header.dart';
import 'package:intl/intl.dart';

class SaveItem extends StatefulWidget {
  const SaveItem({Key? key}) : super(key: key);

  @override
  _SaveItemState createState() => _SaveItemState();
}

class _SaveItemState extends State<SaveItem> {
  @override
  void initState() {
    super.initState();
  }

  User? selectedUser;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SaveItemHeader(size: size),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF7F0EE)),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFE04F23),
                        ),
                        hintText: 'Find in your saved items'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFE4582E),
                              shape: StadiumBorder()),
                          onPressed: () {},
                          icon: Icon(
                            Icons.bike_scooter,
                            color: Color(0xFF792207),
                          ),
                          label: Text('Compare')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFEE9E42),
                              shape: StadiumBorder()),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('By Recent'),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF0EFEF),
                              shape: StadiumBorder()),
                          onPressed: () {},
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.black45),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: foodies.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 13),
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/${foodies[index].image}'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        foodies[index].name.trim(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                locale: 'id_ID',
                                                symbol: 'IDR ',
                                                decimalDigits: 0)
                                            .format(foodies[index].price),
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        selectedUser = null;
                                        _showModal(context);
                                      },
                                      icon: Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.black45,
                                      )),
                                )
                              ],
                            ),
                          )),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(Icons.home_outlined,
                                    color: Colors.black45),
                                Text('Home')
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(Icons.search, color: Colors.black45),
                                Text('Search')
                              ],
                            ),
                          ),
                          Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade400,
                                  border: Border.all(
                                      color: Colors.white, width: 5)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                                size: 35,
                              )),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(Icons.favorite,
                                    color: Colors.red.shade400),
                                Text('Favorite')
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(Icons.person, color: Colors.black45),
                                Text('Contact')
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: ,
    );
  }

  _showModal(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Container(
                  height: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: selectedUser == null
                      ? Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 5,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black26),
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Share this to',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    //width: double.infinity,
                                    height: 90,

                                    child: ListView.builder(
                                        itemCount: users.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (context, index) => Container(
                                                  height: 90,
                                                  width: 75,
                                                  margin: EdgeInsets.only(
                                                      left: 18,
                                                      right: index >=
                                                              users.length - 1
                                                          ? 18
                                                          : 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          //_showModal(context);
                                                          selectedUser =
                                                              users[index];

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 75,
                                                          height: 60,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 60,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(users[index]
                                                                            .imageUrl),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              users[index]
                                                                      .isOnline
                                                                  ? Positioned(
                                                                      right: 2,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            18,
                                                                        height:
                                                                            18,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border: Border.all(color: Colors.white, width: 2),
                                                                            color: Colors.green.shade300),
                                                                      ))
                                                                  : const SizedBox
                                                                      .shrink()
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        users[index].name,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                  ),
                                  InkWell(
                                    splashColor: Color(0xFFE4582E),
                                    onTap: () {},
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xFFE4582E),
                                              width: 1.5)),
                                      child: Text(
                                        'Copy Link',
                                        style:
                                            TextStyle(color: Color(0xFFE4582E)),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Color(0xFFE4582E),
                                    onTap: () {},
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFFE4582E),
                                      ),
                                      child: Text(
                                        'Send',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : SendingPage(selectedUser: selectedUser!)
                  // Column(
                  //     children: [
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       Align(
                  //         alignment: Alignment.topCenter,
                  //         child: Container(
                  //           height: 5,
                  //           width: 40,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Colors.black26),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             CustomPaint(
                  //               foregroundPainter:
                  //                   CircleSendingProgress((progress!)),
                  //               child: Container(
                  //                 width: 140,
                  //                 height: 140,
                  //                 padding: EdgeInsets.all(20),
                  //                 decoration: BoxDecoration(
                  //                     shape: BoxShape.circle,
                  //                     // border: Border.all(
                  //                     //     color: Color(0xFFE4582E), width: 8),
                  //                     color: Colors.transparent),
                  //                 child: Container(
                  //                   width: 120,
                  //                   height: 120,
                  //                   decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       image: DecorationImage(
                  //                           image: NetworkImage(
                  //                               selectedUser!.imageUrl),
                  //                           fit: BoxFit.cover)),
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             Text(
                  //               'Sending to',
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.w700,
                  //                   fontSize: 18),
                  //             ),
                  //             const SizedBox(
                  //               height: 5,
                  //             ),
                  //             Text(
                  //               selectedUser!.name.replaceAll('\n', ' '),
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  ),
            ));
  }
}
