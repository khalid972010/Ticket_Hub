import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_hub/helpers/category_to_icon.dart';
import 'package:ticket_hub/view_model/state_management/event/event_cubit.dart';

class EventScreen extends StatelessWidget {
  EventScreen({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  final String eventId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(eventId)..fetchEventData(),
      child: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final eventCubit = BlocProvider.of<EventCubit>(context);
          final eventData = eventCubit.event;
          if (state is EventLoading) {
            return const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 72,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 100,
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.bookmark_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        addToFavourites(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 1140,
                    child: Stack(
                      children: [
                        // Image
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: Image(
                            image: NetworkImage(
                              eventData!["image"],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // White area
                        Positioned(
                          bottom: 170,
                          left: 0,
                          right: 0,
                          child: IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), // Shadow color
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: const Offset(0,
                                        3), // Offset in x and y axes from the center
                                  ),
                                ],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //First part
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              eventData["title"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              eventData["owner"],
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            shape: BoxShape.rectangle,
                                            color: const Color.fromARGB(
                                                255, 107, 97, 201),
                                          ),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              IconsHelpers.getCategoryIcon(
                                                  eventData['category']),
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //Buttons
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          addToFavourites(context);
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 24.0),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Colors.white,
                                          ),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 107, 97, 201),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 107, 97, 201),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          "I'm Interested",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          buyTicket(
                                              context, eventData["price"]);
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 24.0),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 107, 97, 201),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Buy - ${eventData["price"]}\$",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  //Time and date
                                  const SizedBox(height: 30),
                                  // Location
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: const Color(0xFFF3F0FE),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius:
                                              24, // Adjust the radius to change the size of the CircleAvatar
                                          child: Container(
                                            child: Icon(
                                              Icons.access_time,
                                              color: Color.fromARGB(
                                                  255, 107, 97, 201),
                                              size:
                                                  24, // Adjust the size of the icon to make it smaller
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            eventData["date"],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            eventData["time"],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 209, 209, 209),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          foregroundColor:
                                              Color.fromARGB(255, 107, 97, 201),
                                          child: FaIcon(
                                            EvaIcons.calendarOutline,
                                            color: Color.fromARGB(
                                                255, 107, 97, 201),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 16),
                                  //Location
                                  // Location
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: const Color(0xFFF3F0FE),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius:
                                              24, // Adjust the radius to change the size of the CircleAvatar
                                          child: Icon(
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 107, 97, 201),
                                              size: 26
                                              // Adjust the size of the icon to make it smaller
                                              ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            eventData["address"],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            eventData["location"],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 209, 209, 209),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          foregroundColor:
                                              Color.fromARGB(255, 107, 97, 201),
                                          child: FaIcon(
                                            EvaIcons.navigation2Outline,
                                            color: Color.fromARGB(
                                                255, 107, 97, 201),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //Place
                                  const SizedBox(height: 16),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 25.0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        "Place",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      //await launch("https://www.google.com");
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: 350,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust the radius as needed
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/map.JPG"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void addToFavourites(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    String newFavoriteId = eventId; // replace with your actual ID

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(user?.uid).set({
      'favorites': FieldValue.arrayUnion([newFavoriteId])
    }, SetOptions(merge: true));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Favorite added successfully")),
    );
  }

  void buyTicket(BuildContext context, eventData) async {
    User? user = FirebaseAuth.instance.currentUser;
    String newFavoriteId = eventId;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(user?.uid).set({
      'boughtTickets': FieldValue.arrayUnion([newFavoriteId])
    }, SetOptions(merge: true));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Ticket bought successfully")),
    );
  }
}
