import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/constants/app_assets.dart';
import 'package:flutter_exam/core/constants/app_colors.dart';
import 'package:flutter_exam/features/bloc/global_bloc.dart';
import 'package:flutter_exam/features/routes/routes.dart';
import 'package:flutter_exam/features/ui/components/app_icons.dart';
import 'package:flutter_exam/features/ui/components/app_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialsScreen extends StatelessWidget {
  const SocialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _SocialHomeWidget(),
      ),
    );
  }
}

class _SocialHomeWidget extends StatelessWidget {
  const _SocialHomeWidget();

  @override
  Widget build(BuildContext context) {

    context.read<GlobalBloc>().add(GetSocialDataEvent());

    return BlocConsumer<GlobalBloc, GlobalState>(
      listener: (context, state) {
        switch (state.socialStatus) {
          case SocialStatus.initial:
            break;
          case SocialStatus.loading:
            break;
          case SocialStatus.fetch:
            break;
          case SocialStatus.error:
            break;
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                const _UserHeaderWidget(),
                SizedBox(height: 30.h),
                const _IconView(),
              ],
            ),
            if(context.watch<GlobalBloc>().state.socialStatus == SocialStatus.loading)
              AppLoading(message: AppLocalizations.of(context)!.msgFetchData)
          ],
        );
      },
    );
  }
}

class _UserHeaderWidget extends StatelessWidget {
  const _UserHeaderWidget();

  void _showActions(BuildContext context) {
    // final bloc = context.read<MainBloc>();
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  context.pushNamed(Routes.login);
                },
                child: Container(
                  height: 20.h,
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.logout,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textRedColor,
                    ),
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                context.pop();
              },
              child: Container(
                height: 20.h,
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textBlueColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            _showActions(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Container(
                    color: Colors.blueAccent,
                    height: 40.h,
                    width: 40.h,
                    child: CachedNetworkImage(
                      imageUrl: state.userModel.imgUrl,
                      width: 40.h,
                      height: 40.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 13.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.userModel.username,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      state.userModel.userId,
                      style: TextStyle(
                        color: AppColors.textGrayColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IconView extends StatelessWidget {
  const _IconView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Expanded(
          child: GridView(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              mainAxisSpacing: 60.h, // Spacing between rows
              crossAxisSpacing: 50.w, // Spacing between columns
            ),
            children: [
              AppIcon(iconString: AppAssets.youtube),
              AppIcon(iconString: AppAssets.spotify),
              AppIcon(iconString: AppAssets.facebook),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  color: AppColors.yellowIconColor,
                  width: 50.h,
                  height: 50.h,
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 40.h,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
