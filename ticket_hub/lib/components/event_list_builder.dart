import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/components/event_card_components.dart';
import 'package:ticket_hub/view_model/state_management/event/event_cubit.dart';

class EventListBuilder extends StatelessWidget {
  const EventListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: BlocProvider(
        create: (context) => EventCubit("eventId")..fetchAllEventsData(),
        child: BlocConsumer<EventCubit, EventState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final eventCubit = BlocProvider.of<EventCubit>(context);
            final eventsData = eventCubit.events;
            if (state is EventLoading) {
              return const Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  itemCount: eventsData?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return EventCardComponent(
                      eventCard: eventsData?[index],
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
