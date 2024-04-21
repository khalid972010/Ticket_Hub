import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_hub/constants.dart';

import '../../view_model/state_management/home_navigation/navigation_cubit.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Statics.background()),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocConsumer<NavigationCubit, NavigationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            NavigationCubit navigationCubit =
                BlocProvider.of<NavigationCubit>(context);
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  navigationCubit.screenNames[navigationCubit.index],
                  //style: GoogleFonts.poppins(fontSize: 20.sp),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: navigationCubit.screens[navigationCubit.index],
                  ),
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                onTap: (index) => navigationCubit.navigateBar(index),
                backgroundColor: Colors.transparent,
                color: Colors.white,
                animationDuration: const Duration(milliseconds: 200),
                items: const [
                  Icon(
                    Icons.explore,
                    color: Colors.deepPurple,
                  ),
                  Icon(
                    Icons.airplane_ticket,
                    color: Colors.deepPurple,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.deepPurple,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
