// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'recalculation_bloc.dart';

class RecalculationState extends Equatable {
  final String messageBloc;
  final String search;
  final String quantity;
  final String barcode;
  final String product;
  final String calculated;
  final String total;
  final String remainder;
  final Map<String, StorageData> barcodeList;
  final StorageData lastInput;
  final List <StorageData>tableRecalculation;
  /// для выпадающего списка
  final double heightContainer; // Высота строки
  final double heightTable; // Высота таблицы
  final List<String> filterList; // Отфильтрованный список
  final String foundItem; // Искомый объект

  const RecalculationState(this.lastInput, this.tableRecalculation, this.heightContainer, this.heightTable, this.filterList, this.foundItem, this.barcodeList, {
    /// для выпадающего списка
    this.messageBloc = '',
    this.search = '',
    this.quantity = '',
    this.barcode = '',
    this.product = '',
    this.calculated = '',
    this.total = '',
    this.remainder = '',
    // this.barcodeList = {'': StorageData(
    //   product: '', 
    //   id: 0, 
    //   quantity: 0, 
    //   barcode: '', 
    //   price: 0, 
    //   found: 0, 
    //   measuring: '', 
    //   visibility : true, 
    //   inDishes : false)},
    // this.lastInput = const StorageData(product: '', id: 0, quantity: 0, barcode: '', priceOfSom: 0, found: 0),
    // this.tableRecalculation = const [StorageData(product: '', id: 0, quantity: 0, barcode: '', priceOfSom: 0, found: 0),],
    // required this.heightContainer,
    // this.heightTable = 0,
    // this.filterList = const [],
    // this.foundItem = '',
  });
  @override
  List<Object> get props {
    return [
      messageBloc,
      search,
      quantity,
      barcode,
      product,
      calculated,
      total,
      remainder,
      barcodeList,
      lastInput,
      tableRecalculation,
      heightContainer,
      heightTable,
      filterList,
      foundItem,
    ];
  }

  

  @override
  bool get stringify => true;








  // RecalculationState copyWith({
  //   String? messageBloc,
  //   String? search,
  //   String? quantity,
  //   String? barcode,
  //   String? product,
  //   String? calculated,
  //   String? total,
  //   String? remainder,
  //   Map<String, StorageData>? barcodeList,
  //   StorageData? lastInput,
  //   List <StorageData>?tableRecalculation,
  //   double? heightContainer,
  //   double? heightTable,
  //   List<String>? filterList,
  //   String? foundItem,
  // }) {
  //   // return RecalculationState(
  //   //   // messageBloc: messageBloc ?? this.messageBloc,
  //   //   // search: search ?? this.search,
  //   //   // quantity: quantity ?? this.quantity,
  //   //   // barcode: barcode ?? this.barcode,
  //   //   // product: product ?? this.product,
  //   //   // calculated: calculated ?? this.calculated,
  //   //   // total: total ?? this.total,
  //   //   // remainder: remainder ?? this.remainder,
  //   //   // barcodeList: barcodeList ?? this.barcodeList,
  //   //   // lastInput: lastInput ?? this.lastInput,
  //   //   // tableRecalculation: tableRecalculation ?? this.tableRecalculation,
  //   //   // heightContainer: heightContainer ?? this.heightContainer,
  //   //   // heightTable: heightTable ?? this.heightTable,
  //   //   // filterList: filterList ?? this.filterList,
  //   //   // foundItem: foundItem ?? this.foundItem,
  //   // );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageBloc': messageBloc,
      'search': search,
      'quantity': quantity,
      'barcode': barcode,
      'product': product,
      'calculated': calculated,
      'total': total,
      'remainder': remainder,
      'barcodeList': barcodeList,
      // 'lastInput': lastInput.toMap(),
      '<StorageData>tableRecalculation': tableRecalculation,
      'heightContainer': heightContainer,
      'heightTable': heightTable,
      'filterList': filterList,
      'foundItem': foundItem,
    };
  }

  }

