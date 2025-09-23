import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.heightRow,
  });

  final double heightRow;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecalculationBloc, RecalculationState>(
      builder: (context, state) {
        return SizedBox(
          height: heightRow - 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Подсчитано : ',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                    children: [
                      TextSpan(
                        text: state.calculated,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Всего : ',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                    children: [
                      TextSpan(
                        text: state.total,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Осталось : ',
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                    children: [
                      TextSpan(
                        text: state.remainder,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}