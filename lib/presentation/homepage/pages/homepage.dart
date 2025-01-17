import 'package:bilytica/core/constants/app_colors.dart';
import 'package:bilytica/presentation/custom_widgets/custom_text.dart';
import 'package:bilytica/presentation/homepage/pages/widgets/dinner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_widgets/custom_textfield.dart';
import '../blocs/user_bloc/user_bloc.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _scrollController.addListener(_onScroll);
    _userBloc.add(FetchUsers(1));
  }

  TextEditingController searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(''),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial ||
              (state is UserLoading && state is! UserLoaded)) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return Center(child: Text(state.error));
          }
          if (state is UserLoaded) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20.h,
                              ),
                              CustomText(
                                text: "Dating",
                                size: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              10.horizontalSpace,
                            ],
                          ),
                          20.verticalSpace,
                          CustomTextField(
                            hint: 'Search',
                            controller: searchController,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          state.users.length, // No extra count for the loader
                      itemBuilder: (context, index) {
                        var user = state.users[index];
                        return DinnerCardWidget(
                          name: user.firstName,
                          age: user.age,
                          date: user.date,
                          location: user.location,
                          profilePic: user.pictureUrl,
                        );

                      }, separatorBuilder: (BuildContext context, int index) {
                        return 10.verticalSpace;
                    },
                    ),
                    if (!state.hasReachedMax)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _userBloc.add(FetchUsers(_userBloc.currentPage + 1)); // Load next page
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
