import 'package:fastfood/names/recalculation/bloc/recalculation_bloc.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Search extends StatefulWidget {
  const Search({
    super.key,
    required this.heightRow,
    required this.invertColor,
  });

  final double heightRow;
  final Color invertColor;
  
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchCont = TextEditingController();
  final TextEditingController _quantityCont = TextEditingController();
  late final RecalculationBloc _bloc;

  @override
  void initState() {
    super.initState();
    // context.read<RecalculationBloc>().startListening();
    _bloc = context.read<RecalculationBloc>();
    // context.read<RecalculationBloc>().add(LoadFromSQL());
    // context.read<RecalculationBloc>().add(GetLists());
    _searchCont.addListener(() {});
    _quantityCont.addListener(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final blocRecalculation = context.watch<RecalculationBloc>();
    // Обновляем контроллер при изменении состояния
    final String search = blocRecalculation.state.search;
    if (_searchCont.text != search) {
      _searchCont.value = TextEditingValue(
        text: search,
        selection: TextSelection.collapsed(offset: search.length),
      );
    }
    final String quantity = blocRecalculation.state.quantity;
    if (_quantityCont.text != quantity) {
      _quantityCont.value = TextEditingValue(
        text: quantity,
        selection: TextSelection.collapsed(offset: quantity.length),
      );
    }
  }

  @override
  void dispose() {
    // _bloc.cancelListening();
    // context.read<RecalculationBloc>().cancelListening();
    _searchCont.dispose();
    _quantityCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myColor = CustomTheme(context: context);
    return Column(
      children: [
        Container(
          // decoration: BoxDecoration(
          //     border: Border.all(color: lineBorderColor)),
          height: widget.heightRow,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Expanded(
              //   child:
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      // margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          // border:
                          //     Border.all(color: Colors.black)
                          ),
                      child: Text(
                        'Количество',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 8.0),
                    width: 120,
                    height: 200,
                    child: Center(
                      child: TextField(
                        onChanged: (value) => context
                            .read<RecalculationBloc>()
                            .add(QuantityInput(value)),
                        controller: _quantityCont,
                        cursorColor: widget.invertColor,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.invertColor, width: 1.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: widget.invertColor, width: 1.5)),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly, // С таким фильтром могут быть введены только числа
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ),
              Expanded(
                child: SizedBox(
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: lineBorderColor)),
                  // height: widget.heightRow,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 40),
                        child: Container(
                          // margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              // border:
                              //     Border.all(color: Colors.black)
                              ),
                          child: Text(
                            'Поиск',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          // width: double.infinity,
                          height: 200,
                          child: Center(
                            child: TextField(
                              onChanged: (value) {
                                // print(context.read();
                                // print(context.read<RecalculationBloc>().state.product);
                                context
                                    .read<RecalculationBloc>()
                                    .add(SearchByInput(value));
                              },
                              controller: _searchCont,
                              // cursorColor: widget.invertColor,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: widget.invertColor, width: 1.5)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: widget.invertColor, width: 1.5)),
                              ),
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter
                              //       .digitsOnly, // С таким фильтром могут быть введены только числа
                              // ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        /* Выпадающий список */
        BlocBuilder<RecalculationBloc, RecalculationState>(
            builder: (context, state) {
          return SizedBox(
            height: state.heightTable, //90,//state.heightTable,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, right: 40),
                  child: SizedBox(
                    width: 125,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.filterList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 45.0),
                            width: double.infinity,
                            height: state.heightContainer,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(7)),
                            child: TextButton(
                              onPressed: () {
                                context.read<RecalculationBloc>().add(
                                      PressDropList(
                                          foundItem: state.filterList[index],
                                          sData: state.tableRecalculation),
                                    );
                                // foundItem = filterList[index];
                                // func();
                                // heightTable = 0;
                              },
                              child: Text(
                                state.filterList[index],
                                style: TextStyle(
                                    fontSize: 20, color: myColor.colorText),
                              ),
                            ),
                          );
                        })
                    //     dropList.dropDownFunc(myColor.colorText, () {
                    //   StorageData searchItem =
                    //       blocStorage.state.storageList.firstWhere(
                    //     (it) => it.product == dropList.foundItem,
                    //     orElse: () => StorageData(id: 0, product: 'Не найдено!'),
                    //   );

                    //   if (double.tryParse(blocSales.state.course) != null) {
                    //     String result = ((searchItem.priceOfSom ?? 0) /
                    //             double.parse(blocSales.state.course))
                    //         .toString();
                    //     blocSales.updateState(
                    //       blocSales.state.copyWith(
                    //           heightTable: 0,
                    //           product: searchItem.product,
                    //           barcode: searchItem.barcode,
                    //           priceOfSome: searchItem.priceOfSom.toString(),
                    //           priceOfRubles: result,
                    //           quantity: '1',
                    //           total: searchItem.quantity.toString()),
                    //     );
                    //   }
                    //   dropList.heightTable = 0;
                    //   // blocSales.updateState(
                    //   //   blocSales.state.copyWith(
                    //   //       heightTable: 0,
                    //   //       product: searchItem.product,
                    //   //       barcode: searchItem.barcode,
                    //   //       priceOfSome: searchItem.priceOfSom.toString(),
                    //   //       quantity: '1',
                    //   //       total: searchItem.quantity.toString()),
                    //   // );
                    // })
                    )
              ],
            ),
          );
        }),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
