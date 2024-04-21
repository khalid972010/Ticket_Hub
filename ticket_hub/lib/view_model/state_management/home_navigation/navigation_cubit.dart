import 'package:bloc/bloc.dart';
import 'package:ticket_hub/screens/favorites/favorites.dart';
import 'package:ticket_hub/screens/home/home.dart';
import 'package:ticket_hub/screens/my_tickets/my_tickets.dart';
import 'package:ticket_hub/screens/profile/profile.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  var index = 0;

  List screenNames = [
    'Explore',
    'My Tickets',
    'Favorites',
    'Profile',
  ];

  List screens = const [
    HomeScreen(),
    MyTicketsScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void navigateBar(index) {
    this.index = index;
    emit(NavigationChangePage());
  }
}
