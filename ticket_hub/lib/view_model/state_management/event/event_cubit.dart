import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.eventId) : super(EventInitial());

  String eventId;
  Map<String, dynamic>? event;
  List<Map<String, dynamic>>? events;

  Future fetchEventData() async {
    try {
      emit(EventLoading());
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('events')
          .doc(eventId)
          .get();

      if (document.exists) {
        // Get the document data
        event = document.data() as Map<String, dynamic>;

        // Add the document ID to the userData map
        event!['id'] = document.id;
        emit(EventLoaded());
      } else {
        print("Document does not exist");
        return null; // Returning null if no document with the provided ID is found
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null; // Returning null in case of an error
    }
  }

  Future<void> fetchAllEventsData() async {
    try {
      emit(EventLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('events').get();
      if (querySnapshot.docs.isNotEmpty) {
        events = []; // Initialize events list
        // Loop through all documents in the query snapshot
        querySnapshot.docs.forEach((document) {
          // Get the document data
          Map<String, dynamic> eventData =
              document.data() as Map<String, dynamic>;
          // Add the document ID to the eventData map
          eventData['id'] = document.id;
          // Add the eventData map to the events list
          events?.add(eventData);
        });
        emit(EventLoaded());
      } else {
        print("No documents found");
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
