import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Controller/Tv_Cubit/tv_cubit.dart';
import '../Controller/Tv_Cubit/tv_state.dart';
import '../../../core/constans/app_string.dart';

import '../../../core/constans/api_constans.dart';
import '../../../core/modelErorr/enums.dart';

class TvOnTheAirComponent extends StatelessWidget {
  const TvOnTheAirComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvState>(
      buildWhen: (previous, current) =>
          previous.tvOnTheAirState != current.tvOnTheAirState,
      builder: (context, state) {
        print('TvOnTheAirComponent');

        switch (state.tvOnTheAirState) {
          case RequestState.loading:
            return const SizedBox(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.tvOnTheAirSlist.map(
                  (item) {
                    return Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 400.0,
                            imageUrl: ApiConstance.imageUrl(item.backdropPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.redAccent,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    AppString.onTheAir,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.erorr:
            return SizedBox(
                height: 400.0,
                child: Center(
                    child: Text(
                  state.tvOnTheAirSmessege,
                )));
        }
      },
    );
  }
}
