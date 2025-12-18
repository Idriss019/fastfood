// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StorageTableDBTable extends StorageTableDB
    with TableInfo<$StorageTableDBTable, StorageTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _inDishesMeta = const VerificationMeta(
    'inDishes',
  );
  @override
  late final GeneratedColumn<bool> inDishes = GeneratedColumn<bool>(
    'in_dishes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("in_dishes" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measuringMeta = const VerificationMeta(
    'measuring',
  );
  @override
  late final GeneratedColumn<String> measuring = GeneratedColumn<String>(
    'measuring',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 5,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPriceMeta = const VerificationMeta(
    'costPrice',
  );
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
    'cost_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _foundMeta = const VerificationMeta('found');
  @override
  late final GeneratedColumn<int> found = GeneratedColumn<int>(
    'found',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => 0,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    inDishes,
    barcode,
    product,
    quantity,
    measuring,
    costPrice,
    price,
    found,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('in_dishes')) {
      context.handle(
        _inDishesMeta,
        inDishes.isAcceptableOrUnknown(data['in_dishes']!, _inDishesMeta),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('measuring')) {
      context.handle(
        _measuringMeta,
        measuring.isAcceptableOrUnknown(data['measuring']!, _measuringMeta),
      );
    } else if (isInserting) {
      context.missing(_measuringMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(
        _costPriceMeta,
        costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('found')) {
      context.handle(
        _foundMeta,
        found.isAcceptableOrUnknown(data['found']!, _foundMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      inDishes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}in_dishes'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      measuring: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}measuring'],
      )!,
      costPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
      found: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}found'],
      ),
    );
  }

  @override
  $StorageTableDBTable createAlias(String alias) {
    return $StorageTableDBTable(attachedDatabase, alias);
  }
}

class StorageTableDBData extends DataClass
    implements Insertable<StorageTableDBData> {
  final int id;
  final bool inDishes;
  final String? barcode;
  final String product;
  final int quantity;
  final String measuring;
  final double? costPrice;
  final double? price;
  final int? found;
  const StorageTableDBData({
    required this.id,
    required this.inDishes,
    this.barcode,
    required this.product,
    required this.quantity,
    required this.measuring,
    this.costPrice,
    this.price,
    this.found,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['in_dishes'] = Variable<bool>(inDishes);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    map['measuring'] = Variable<String>(measuring);
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || found != null) {
      map['found'] = Variable<int>(found);
    }
    return map;
  }

  StorageTableDBCompanion toCompanion(bool nullToAbsent) {
    return StorageTableDBCompanion(
      id: Value(id),
      inDishes: Value(inDishes),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      quantity: Value(quantity),
      measuring: Value(measuring),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      found: found == null && nullToAbsent
          ? const Value.absent()
          : Value(found),
    );
  }

  factory StorageTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageTableDBData(
      id: serializer.fromJson<int>(json['id']),
      inDishes: serializer.fromJson<bool>(json['inDishes']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      measuring: serializer.fromJson<String>(json['measuring']),
      costPrice: serializer.fromJson<double?>(json['costPrice']),
      price: serializer.fromJson<double?>(json['price']),
      found: serializer.fromJson<int?>(json['found']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inDishes': serializer.toJson<bool>(inDishes),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'measuring': serializer.toJson<String>(measuring),
      'costPrice': serializer.toJson<double?>(costPrice),
      'price': serializer.toJson<double?>(price),
      'found': serializer.toJson<int?>(found),
    };
  }

  StorageTableDBData copyWith({
    int? id,
    bool? inDishes,
    Value<String?> barcode = const Value.absent(),
    String? product,
    int? quantity,
    String? measuring,
    Value<double?> costPrice = const Value.absent(),
    Value<double?> price = const Value.absent(),
    Value<int?> found = const Value.absent(),
  }) => StorageTableDBData(
    id: id ?? this.id,
    inDishes: inDishes ?? this.inDishes,
    barcode: barcode.present ? barcode.value : this.barcode,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    measuring: measuring ?? this.measuring,
    costPrice: costPrice.present ? costPrice.value : this.costPrice,
    price: price.present ? price.value : this.price,
    found: found.present ? found.value : this.found,
  );
  StorageTableDBData copyWithCompanion(StorageTableDBCompanion data) {
    return StorageTableDBData(
      id: data.id.present ? data.id.value : this.id,
      inDishes: data.inDishes.present ? data.inDishes.value : this.inDishes,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      measuring: data.measuring.present ? data.measuring.value : this.measuring,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      price: data.price.present ? data.price.value : this.price,
      found: data.found.present ? data.found.value : this.found,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableDBData(')
          ..write('id: $id, ')
          ..write('inDishes: $inDishes, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('measuring: $measuring, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price, ')
          ..write('found: $found')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    inDishes,
    barcode,
    product,
    quantity,
    measuring,
    costPrice,
    price,
    found,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableDBData &&
          other.id == this.id &&
          other.inDishes == this.inDishes &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.measuring == this.measuring &&
          other.costPrice == this.costPrice &&
          other.price == this.price &&
          other.found == this.found);
}

class StorageTableDBCompanion extends UpdateCompanion<StorageTableDBData> {
  final Value<int> id;
  final Value<bool> inDishes;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<int> quantity;
  final Value<String> measuring;
  final Value<double?> costPrice;
  final Value<double?> price;
  final Value<int?> found;
  const StorageTableDBCompanion({
    this.id = const Value.absent(),
    this.inDishes = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.measuring = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.price = const Value.absent(),
    this.found = const Value.absent(),
  });
  StorageTableDBCompanion.insert({
    this.id = const Value.absent(),
    this.inDishes = const Value.absent(),
    this.barcode = const Value.absent(),
    required String product,
    required int quantity,
    required String measuring,
    this.costPrice = const Value.absent(),
    this.price = const Value.absent(),
    this.found = const Value.absent(),
  }) : product = Value(product),
       quantity = Value(quantity),
       measuring = Value(measuring);
  static Insertable<StorageTableDBData> custom({
    Expression<int>? id,
    Expression<bool>? inDishes,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<String>? measuring,
    Expression<double>? costPrice,
    Expression<double>? price,
    Expression<int>? found,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inDishes != null) 'in_dishes': inDishes,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (measuring != null) 'measuring': measuring,
      if (costPrice != null) 'cost_price': costPrice,
      if (price != null) 'price': price,
      if (found != null) 'found': found,
    });
  }

  StorageTableDBCompanion copyWith({
    Value<int>? id,
    Value<bool>? inDishes,
    Value<String?>? barcode,
    Value<String>? product,
    Value<int>? quantity,
    Value<String>? measuring,
    Value<double?>? costPrice,
    Value<double?>? price,
    Value<int?>? found,
  }) {
    return StorageTableDBCompanion(
      id: id ?? this.id,
      inDishes: inDishes ?? this.inDishes,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
      found: found ?? this.found,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inDishes.present) {
      map['in_dishes'] = Variable<bool>(inDishes.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (measuring.present) {
      map['measuring'] = Variable<String>(measuring.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (found.present) {
      map['found'] = Variable<int>(found.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableDBCompanion(')
          ..write('id: $id, ')
          ..write('inDishes: $inDishes, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('measuring: $measuring, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price, ')
          ..write('found: $found')
          ..write(')'))
        .toString();
  }
}

class $SalesTableDBTable extends SalesTableDB
    with TableInfo<$SalesTableDBTable, SalesTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
    'order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sumOrderMeta = const VerificationMeta(
    'sumOrder',
  );
  @override
  late final GeneratedColumn<double> sumOrder = GeneratedColumn<double>(
    'sum_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ndsMeta = const VerificationMeta('nds');
  @override
  late final GeneratedColumn<double> nds = GeneratedColumn<double>(
    'nds',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _soldMeta = const VerificationMeta('sold');
  @override
  late final GeneratedColumn<bool> sold = GeneratedColumn<bool>(
    'sold',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sold" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<bool> paid = GeneratedColumn<bool>(
    'paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("paid" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    order,
    date,
    sumOrder,
    barcode,
    product,
    quantity,
    price,
    nds,
    sold,
    paid,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
        _orderMeta,
        order.isAcceptableOrUnknown(data['order']!, _orderMeta),
      );
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('sum_order')) {
      context.handle(
        _sumOrderMeta,
        sumOrder.isAcceptableOrUnknown(data['sum_order']!, _sumOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sumOrderMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('nds')) {
      context.handle(
        _ndsMeta,
        nds.isAcceptableOrUnknown(data['nds']!, _ndsMeta),
      );
    } else if (isInserting) {
      context.missing(_ndsMeta);
    }
    if (data.containsKey('sold')) {
      context.handle(
        _soldMeta,
        sold.isAcceptableOrUnknown(data['sold']!, _soldMeta),
      );
    }
    if (data.containsKey('paid')) {
      context.handle(
        _paidMeta,
        paid.isAcceptableOrUnknown(data['paid']!, _paidMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      order: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      ),
      sumOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sum_order'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      nds: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nds'],
      )!,
      sold: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sold'],
      )!,
      paid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}paid'],
      )!,
    );
  }

  @override
  $SalesTableDBTable createAlias(String alias) {
    return $SalesTableDBTable(attachedDatabase, alias);
  }
}

class SalesTableDBData extends DataClass
    implements Insertable<SalesTableDBData> {
  final int id;
  final int order;
  final int? date;
  final double sumOrder;
  final String? barcode;
  final String product;
  final int quantity;
  final double price;
  final double nds;
  final bool sold;
  final bool paid;
  const SalesTableDBData({
    required this.id,
    required this.order,
    this.date,
    required this.sumOrder,
    this.barcode,
    required this.product,
    required this.quantity,
    required this.price,
    required this.nds,
    required this.sold,
    required this.paid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order'] = Variable<int>(order);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<int>(date);
    }
    map['sum_order'] = Variable<double>(sumOrder);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    map['nds'] = Variable<double>(nds);
    map['sold'] = Variable<bool>(sold);
    map['paid'] = Variable<bool>(paid);
    return map;
  }

  SalesTableDBCompanion toCompanion(bool nullToAbsent) {
    return SalesTableDBCompanion(
      id: Value(id),
      order: Value(order),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      sumOrder: Value(sumOrder),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      quantity: Value(quantity),
      price: Value(price),
      nds: Value(nds),
      sold: Value(sold),
      paid: Value(paid),
    );
  }

  factory SalesTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesTableDBData(
      id: serializer.fromJson<int>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      date: serializer.fromJson<int?>(json['date']),
      sumOrder: serializer.fromJson<double>(json['sumOrder']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      nds: serializer.fromJson<double>(json['nds']),
      sold: serializer.fromJson<bool>(json['sold']),
      paid: serializer.fromJson<bool>(json['paid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'order': serializer.toJson<int>(order),
      'date': serializer.toJson<int?>(date),
      'sumOrder': serializer.toJson<double>(sumOrder),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
      'nds': serializer.toJson<double>(nds),
      'sold': serializer.toJson<bool>(sold),
      'paid': serializer.toJson<bool>(paid),
    };
  }

  SalesTableDBData copyWith({
    int? id,
    int? order,
    Value<int?> date = const Value.absent(),
    double? sumOrder,
    Value<String?> barcode = const Value.absent(),
    String? product,
    int? quantity,
    double? price,
    double? nds,
    bool? sold,
    bool? paid,
  }) => SalesTableDBData(
    id: id ?? this.id,
    order: order ?? this.order,
    date: date.present ? date.value : this.date,
    sumOrder: sumOrder ?? this.sumOrder,
    barcode: barcode.present ? barcode.value : this.barcode,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    nds: nds ?? this.nds,
    sold: sold ?? this.sold,
    paid: paid ?? this.paid,
  );
  SalesTableDBData copyWithCompanion(SalesTableDBCompanion data) {
    return SalesTableDBData(
      id: data.id.present ? data.id.value : this.id,
      order: data.order.present ? data.order.value : this.order,
      date: data.date.present ? data.date.value : this.date,
      sumOrder: data.sumOrder.present ? data.sumOrder.value : this.sumOrder,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      nds: data.nds.present ? data.nds.value : this.nds,
      sold: data.sold.present ? data.sold.value : this.sold,
      paid: data.paid.present ? data.paid.value : this.paid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableDBData(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('date: $date, ')
          ..write('sumOrder: $sumOrder, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('nds: $nds, ')
          ..write('sold: $sold, ')
          ..write('paid: $paid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    order,
    date,
    sumOrder,
    barcode,
    product,
    quantity,
    price,
    nds,
    sold,
    paid,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesTableDBData &&
          other.id == this.id &&
          other.order == this.order &&
          other.date == this.date &&
          other.sumOrder == this.sumOrder &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.nds == this.nds &&
          other.sold == this.sold &&
          other.paid == this.paid);
}

class SalesTableDBCompanion extends UpdateCompanion<SalesTableDBData> {
  final Value<int> id;
  final Value<int> order;
  final Value<int?> date;
  final Value<double> sumOrder;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<int> quantity;
  final Value<double> price;
  final Value<double> nds;
  final Value<bool> sold;
  final Value<bool> paid;
  const SalesTableDBCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.date = const Value.absent(),
    this.sumOrder = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.nds = const Value.absent(),
    this.sold = const Value.absent(),
    this.paid = const Value.absent(),
  });
  SalesTableDBCompanion.insert({
    this.id = const Value.absent(),
    required int order,
    this.date = const Value.absent(),
    required double sumOrder,
    this.barcode = const Value.absent(),
    required String product,
    required int quantity,
    required double price,
    required double nds,
    this.sold = const Value.absent(),
    this.paid = const Value.absent(),
  }) : order = Value(order),
       sumOrder = Value(sumOrder),
       product = Value(product),
       quantity = Value(quantity),
       price = Value(price),
       nds = Value(nds);
  static Insertable<SalesTableDBData> custom({
    Expression<int>? id,
    Expression<int>? order,
    Expression<int>? date,
    Expression<double>? sumOrder,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<double>? nds,
    Expression<bool>? sold,
    Expression<bool>? paid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (date != null) 'date': date,
      if (sumOrder != null) 'sum_order': sumOrder,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (nds != null) 'nds': nds,
      if (sold != null) 'sold': sold,
      if (paid != null) 'paid': paid,
    });
  }

  SalesTableDBCompanion copyWith({
    Value<int>? id,
    Value<int>? order,
    Value<int?>? date,
    Value<double>? sumOrder,
    Value<String?>? barcode,
    Value<String>? product,
    Value<int>? quantity,
    Value<double>? price,
    Value<double>? nds,
    Value<bool>? sold,
    Value<bool>? paid,
  }) {
    return SalesTableDBCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      date: date ?? this.date,
      sumOrder: sumOrder ?? this.sumOrder,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      nds: nds ?? this.nds,
      sold: sold ?? this.sold,
      paid: paid ?? this.paid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (sumOrder.present) {
      map['sum_order'] = Variable<double>(sumOrder.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (nds.present) {
      map['nds'] = Variable<double>(nds.value);
    }
    if (sold.present) {
      map['sold'] = Variable<bool>(sold.value);
    }
    if (paid.present) {
      map['paid'] = Variable<bool>(paid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableDBCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('date: $date, ')
          ..write('sumOrder: $sumOrder, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('nds: $nds, ')
          ..write('sold: $sold, ')
          ..write('paid: $paid')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTableDBTable extends PurchasesTableDB
    with TableInfo<$PurchasesTableDBTable, PurchasesTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasesTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measuringMeta = const VerificationMeta(
    'measuring',
  );
  @override
  late final GeneratedColumn<String> measuring = GeneratedColumn<String>(
    'measuring',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 5,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceOfPurchasesMeta = const VerificationMeta(
    'priceOfPurchases',
  );
  @override
  late final GeneratedColumn<double> priceOfPurchases = GeneratedColumn<double>(
    'price_of_purchases',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    barcode,
    product,
    quantity,
    measuring,
    priceOfPurchases,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchases_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchasesTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('measuring')) {
      context.handle(
        _measuringMeta,
        measuring.isAcceptableOrUnknown(data['measuring']!, _measuringMeta),
      );
    } else if (isInserting) {
      context.missing(_measuringMeta);
    }
    if (data.containsKey('price_of_purchases')) {
      context.handle(
        _priceOfPurchasesMeta,
        priceOfPurchases.isAcceptableOrUnknown(
          data['price_of_purchases']!,
          _priceOfPurchasesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_priceOfPurchasesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchasesTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchasesTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      measuring: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}measuring'],
      )!,
      priceOfPurchases: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_of_purchases'],
      )!,
    );
  }

  @override
  $PurchasesTableDBTable createAlias(String alias) {
    return $PurchasesTableDBTable(attachedDatabase, alias);
  }
}

class PurchasesTableDBData extends DataClass
    implements Insertable<PurchasesTableDBData> {
  final int id;
  final int? date;
  final String? barcode;
  final String product;
  final int quantity;
  final String measuring;
  final double priceOfPurchases;
  const PurchasesTableDBData({
    required this.id,
    this.date,
    this.barcode,
    required this.product,
    required this.quantity,
    required this.measuring,
    required this.priceOfPurchases,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<int>(date);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['product'] = Variable<String>(product);
    map['quantity'] = Variable<int>(quantity);
    map['measuring'] = Variable<String>(measuring);
    map['price_of_purchases'] = Variable<double>(priceOfPurchases);
    return map;
  }

  PurchasesTableDBCompanion toCompanion(bool nullToAbsent) {
    return PurchasesTableDBCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      product: Value(product),
      quantity: Value(quantity),
      measuring: Value(measuring),
      priceOfPurchases: Value(priceOfPurchases),
    );
  }

  factory PurchasesTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchasesTableDBData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int?>(json['date']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      product: serializer.fromJson<String>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      measuring: serializer.fromJson<String>(json['measuring']),
      priceOfPurchases: serializer.fromJson<double>(json['priceOfPurchases']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int?>(date),
      'barcode': serializer.toJson<String?>(barcode),
      'product': serializer.toJson<String>(product),
      'quantity': serializer.toJson<int>(quantity),
      'measuring': serializer.toJson<String>(measuring),
      'priceOfPurchases': serializer.toJson<double>(priceOfPurchases),
    };
  }

  PurchasesTableDBData copyWith({
    int? id,
    Value<int?> date = const Value.absent(),
    Value<String?> barcode = const Value.absent(),
    String? product,
    int? quantity,
    String? measuring,
    double? priceOfPurchases,
  }) => PurchasesTableDBData(
    id: id ?? this.id,
    date: date.present ? date.value : this.date,
    barcode: barcode.present ? barcode.value : this.barcode,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    measuring: measuring ?? this.measuring,
    priceOfPurchases: priceOfPurchases ?? this.priceOfPurchases,
  );
  PurchasesTableDBData copyWithCompanion(PurchasesTableDBCompanion data) {
    return PurchasesTableDBData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      measuring: data.measuring.present ? data.measuring.value : this.measuring,
      priceOfPurchases: data.priceOfPurchases.present
          ? data.priceOfPurchases.value
          : this.priceOfPurchases,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesTableDBData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('measuring: $measuring, ')
          ..write('priceOfPurchases: $priceOfPurchases')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    barcode,
    product,
    quantity,
    measuring,
    priceOfPurchases,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchasesTableDBData &&
          other.id == this.id &&
          other.date == this.date &&
          other.barcode == this.barcode &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.measuring == this.measuring &&
          other.priceOfPurchases == this.priceOfPurchases);
}

class PurchasesTableDBCompanion extends UpdateCompanion<PurchasesTableDBData> {
  final Value<int> id;
  final Value<int?> date;
  final Value<String?> barcode;
  final Value<String> product;
  final Value<int> quantity;
  final Value<String> measuring;
  final Value<double> priceOfPurchases;
  const PurchasesTableDBCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.barcode = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.measuring = const Value.absent(),
    this.priceOfPurchases = const Value.absent(),
  });
  PurchasesTableDBCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.barcode = const Value.absent(),
    required String product,
    required int quantity,
    required String measuring,
    required double priceOfPurchases,
  }) : product = Value(product),
       quantity = Value(quantity),
       measuring = Value(measuring),
       priceOfPurchases = Value(priceOfPurchases);
  static Insertable<PurchasesTableDBData> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<String>? barcode,
    Expression<String>? product,
    Expression<int>? quantity,
    Expression<String>? measuring,
    Expression<double>? priceOfPurchases,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (barcode != null) 'barcode': barcode,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (measuring != null) 'measuring': measuring,
      if (priceOfPurchases != null) 'price_of_purchases': priceOfPurchases,
    });
  }

  PurchasesTableDBCompanion copyWith({
    Value<int>? id,
    Value<int?>? date,
    Value<String?>? barcode,
    Value<String>? product,
    Value<int>? quantity,
    Value<String>? measuring,
    Value<double>? priceOfPurchases,
  }) {
    return PurchasesTableDBCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      barcode: barcode ?? this.barcode,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      measuring: measuring ?? this.measuring,
      priceOfPurchases: priceOfPurchases ?? this.priceOfPurchases,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (measuring.present) {
      map['measuring'] = Variable<String>(measuring.value);
    }
    if (priceOfPurchases.present) {
      map['price_of_purchases'] = Variable<double>(priceOfPurchases.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesTableDBCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('barcode: $barcode, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('measuring: $measuring, ')
          ..write('priceOfPurchases: $priceOfPurchases')
          ..write(')'))
        .toString();
  }
}

class $DishesTableDBTable extends DishesTableDB
    with TableInfo<$DishesTableDBTable, DishesTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishesTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameDishesMeta = const VerificationMeta(
    'nameDishes',
  );
  @override
  late final GeneratedColumn<String> nameDishes = GeneratedColumn<String>(
    'name_dishes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measuringMeta = const VerificationMeta(
    'measuring',
  );
  @override
  late final GeneratedColumn<String> measuring = GeneratedColumn<String>(
    'measuring',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPriceProductMeta = const VerificationMeta(
    'costPriceProduct',
  );
  @override
  late final GeneratedColumn<double> costPriceProduct = GeneratedColumn<double>(
    'cost_price_product',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceDishesMeta = const VerificationMeta(
    'priceDishes',
  );
  @override
  late final GeneratedColumn<double> priceDishes = GeneratedColumn<double>(
    'price_dishes',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nameDishes,
    product,
    measuring,
    quantity,
    costPriceProduct,
    priceDishes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dishes_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<DishesTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_dishes')) {
      context.handle(
        _nameDishesMeta,
        nameDishes.isAcceptableOrUnknown(data['name_dishes']!, _nameDishesMeta),
      );
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('measuring')) {
      context.handle(
        _measuringMeta,
        measuring.isAcceptableOrUnknown(data['measuring']!, _measuringMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('cost_price_product')) {
      context.handle(
        _costPriceProductMeta,
        costPriceProduct.isAcceptableOrUnknown(
          data['cost_price_product']!,
          _costPriceProductMeta,
        ),
      );
    }
    if (data.containsKey('price_dishes')) {
      context.handle(
        _priceDishesMeta,
        priceDishes.isAcceptableOrUnknown(
          data['price_dishes']!,
          _priceDishesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DishesTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishesTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nameDishes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_dishes'],
      ),
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      measuring: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}measuring'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      costPriceProduct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price_product'],
      ),
      priceDishes: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_dishes'],
      ),
    );
  }

  @override
  $DishesTableDBTable createAlias(String alias) {
    return $DishesTableDBTable(attachedDatabase, alias);
  }
}

class DishesTableDBData extends DataClass
    implements Insertable<DishesTableDBData> {
  final int id;
  final String? nameDishes;
  final String product;
  final String? measuring;
  final int quantity;
  final double? costPriceProduct;
  final double? priceDishes;
  const DishesTableDBData({
    required this.id,
    this.nameDishes,
    required this.product,
    this.measuring,
    required this.quantity,
    this.costPriceProduct,
    this.priceDishes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nameDishes != null) {
      map['name_dishes'] = Variable<String>(nameDishes);
    }
    map['product'] = Variable<String>(product);
    if (!nullToAbsent || measuring != null) {
      map['measuring'] = Variable<String>(measuring);
    }
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || costPriceProduct != null) {
      map['cost_price_product'] = Variable<double>(costPriceProduct);
    }
    if (!nullToAbsent || priceDishes != null) {
      map['price_dishes'] = Variable<double>(priceDishes);
    }
    return map;
  }

  DishesTableDBCompanion toCompanion(bool nullToAbsent) {
    return DishesTableDBCompanion(
      id: Value(id),
      nameDishes: nameDishes == null && nullToAbsent
          ? const Value.absent()
          : Value(nameDishes),
      product: Value(product),
      measuring: measuring == null && nullToAbsent
          ? const Value.absent()
          : Value(measuring),
      quantity: Value(quantity),
      costPriceProduct: costPriceProduct == null && nullToAbsent
          ? const Value.absent()
          : Value(costPriceProduct),
      priceDishes: priceDishes == null && nullToAbsent
          ? const Value.absent()
          : Value(priceDishes),
    );
  }

  factory DishesTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishesTableDBData(
      id: serializer.fromJson<int>(json['id']),
      nameDishes: serializer.fromJson<String?>(json['nameDishes']),
      product: serializer.fromJson<String>(json['product']),
      measuring: serializer.fromJson<String?>(json['measuring']),
      quantity: serializer.fromJson<int>(json['quantity']),
      costPriceProduct: serializer.fromJson<double?>(json['costPriceProduct']),
      priceDishes: serializer.fromJson<double?>(json['priceDishes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameDishes': serializer.toJson<String?>(nameDishes),
      'product': serializer.toJson<String>(product),
      'measuring': serializer.toJson<String?>(measuring),
      'quantity': serializer.toJson<int>(quantity),
      'costPriceProduct': serializer.toJson<double?>(costPriceProduct),
      'priceDishes': serializer.toJson<double?>(priceDishes),
    };
  }

  DishesTableDBData copyWith({
    int? id,
    Value<String?> nameDishes = const Value.absent(),
    String? product,
    Value<String?> measuring = const Value.absent(),
    int? quantity,
    Value<double?> costPriceProduct = const Value.absent(),
    Value<double?> priceDishes = const Value.absent(),
  }) => DishesTableDBData(
    id: id ?? this.id,
    nameDishes: nameDishes.present ? nameDishes.value : this.nameDishes,
    product: product ?? this.product,
    measuring: measuring.present ? measuring.value : this.measuring,
    quantity: quantity ?? this.quantity,
    costPriceProduct: costPriceProduct.present
        ? costPriceProduct.value
        : this.costPriceProduct,
    priceDishes: priceDishes.present ? priceDishes.value : this.priceDishes,
  );
  DishesTableDBData copyWithCompanion(DishesTableDBCompanion data) {
    return DishesTableDBData(
      id: data.id.present ? data.id.value : this.id,
      nameDishes: data.nameDishes.present
          ? data.nameDishes.value
          : this.nameDishes,
      product: data.product.present ? data.product.value : this.product,
      measuring: data.measuring.present ? data.measuring.value : this.measuring,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      costPriceProduct: data.costPriceProduct.present
          ? data.costPriceProduct.value
          : this.costPriceProduct,
      priceDishes: data.priceDishes.present
          ? data.priceDishes.value
          : this.priceDishes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DishesTableDBData(')
          ..write('id: $id, ')
          ..write('nameDishes: $nameDishes, ')
          ..write('product: $product, ')
          ..write('measuring: $measuring, ')
          ..write('quantity: $quantity, ')
          ..write('costPriceProduct: $costPriceProduct, ')
          ..write('priceDishes: $priceDishes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nameDishes,
    product,
    measuring,
    quantity,
    costPriceProduct,
    priceDishes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishesTableDBData &&
          other.id == this.id &&
          other.nameDishes == this.nameDishes &&
          other.product == this.product &&
          other.measuring == this.measuring &&
          other.quantity == this.quantity &&
          other.costPriceProduct == this.costPriceProduct &&
          other.priceDishes == this.priceDishes);
}

class DishesTableDBCompanion extends UpdateCompanion<DishesTableDBData> {
  final Value<int> id;
  final Value<String?> nameDishes;
  final Value<String> product;
  final Value<String?> measuring;
  final Value<int> quantity;
  final Value<double?> costPriceProduct;
  final Value<double?> priceDishes;
  const DishesTableDBCompanion({
    this.id = const Value.absent(),
    this.nameDishes = const Value.absent(),
    this.product = const Value.absent(),
    this.measuring = const Value.absent(),
    this.quantity = const Value.absent(),
    this.costPriceProduct = const Value.absent(),
    this.priceDishes = const Value.absent(),
  });
  DishesTableDBCompanion.insert({
    this.id = const Value.absent(),
    this.nameDishes = const Value.absent(),
    required String product,
    this.measuring = const Value.absent(),
    required int quantity,
    this.costPriceProduct = const Value.absent(),
    this.priceDishes = const Value.absent(),
  }) : product = Value(product),
       quantity = Value(quantity);
  static Insertable<DishesTableDBData> custom({
    Expression<int>? id,
    Expression<String>? nameDishes,
    Expression<String>? product,
    Expression<String>? measuring,
    Expression<int>? quantity,
    Expression<double>? costPriceProduct,
    Expression<double>? priceDishes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameDishes != null) 'name_dishes': nameDishes,
      if (product != null) 'product': product,
      if (measuring != null) 'measuring': measuring,
      if (quantity != null) 'quantity': quantity,
      if (costPriceProduct != null) 'cost_price_product': costPriceProduct,
      if (priceDishes != null) 'price_dishes': priceDishes,
    });
  }

  DishesTableDBCompanion copyWith({
    Value<int>? id,
    Value<String?>? nameDishes,
    Value<String>? product,
    Value<String?>? measuring,
    Value<int>? quantity,
    Value<double?>? costPriceProduct,
    Value<double?>? priceDishes,
  }) {
    return DishesTableDBCompanion(
      id: id ?? this.id,
      nameDishes: nameDishes ?? this.nameDishes,
      product: product ?? this.product,
      measuring: measuring ?? this.measuring,
      quantity: quantity ?? this.quantity,
      costPriceProduct: costPriceProduct ?? this.costPriceProduct,
      priceDishes: priceDishes ?? this.priceDishes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameDishes.present) {
      map['name_dishes'] = Variable<String>(nameDishes.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (measuring.present) {
      map['measuring'] = Variable<String>(measuring.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (costPriceProduct.present) {
      map['cost_price_product'] = Variable<double>(costPriceProduct.value);
    }
    if (priceDishes.present) {
      map['price_dishes'] = Variable<double>(priceDishes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishesTableDBCompanion(')
          ..write('id: $id, ')
          ..write('nameDishes: $nameDishes, ')
          ..write('product: $product, ')
          ..write('measuring: $measuring, ')
          ..write('quantity: $quantity, ')
          ..write('costPriceProduct: $costPriceProduct, ')
          ..write('priceDishes: $priceDishes')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableDBTable extends HistoryTableDB
    with TableInfo<$HistoryTableDBTable, HistoryTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, action, login, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoryTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
    );
  }

  @override
  $HistoryTableDBTable createAlias(String alias) {
    return $HistoryTableDBTable(attachedDatabase, alias);
  }
}

class HistoryTableDBData extends DataClass
    implements Insertable<HistoryTableDBData> {
  final int id;
  final int? date;
  final String action;
  final String? login;
  final String? position;
  const HistoryTableDBData({
    required this.id,
    this.date,
    required this.action,
    this.login,
    this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<int>(date);
    }
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    return map;
  }

  HistoryTableDBCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableDBCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      action: Value(action),
      login: login == null && nullToAbsent
          ? const Value.absent()
          : Value(login),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
    );
  }

  factory HistoryTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryTableDBData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int?>(json['date']),
      action: serializer.fromJson<String>(json['action']),
      login: serializer.fromJson<String?>(json['login']),
      position: serializer.fromJson<String?>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int?>(date),
      'action': serializer.toJson<String>(action),
      'login': serializer.toJson<String?>(login),
      'position': serializer.toJson<String?>(position),
    };
  }

  HistoryTableDBData copyWith({
    int? id,
    Value<int?> date = const Value.absent(),
    String? action,
    Value<String?> login = const Value.absent(),
    Value<String?> position = const Value.absent(),
  }) => HistoryTableDBData(
    id: id ?? this.id,
    date: date.present ? date.value : this.date,
    action: action ?? this.action,
    login: login.present ? login.value : this.login,
    position: position.present ? position.value : this.position,
  );
  HistoryTableDBData copyWithCompanion(HistoryTableDBCompanion data) {
    return HistoryTableDBData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      action: data.action.present ? data.action.value : this.action,
      login: data.login.present ? data.login.value : this.login,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableDBData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('action: $action, ')
          ..write('login: $login, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, action, login, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryTableDBData &&
          other.id == this.id &&
          other.date == this.date &&
          other.action == this.action &&
          other.login == this.login &&
          other.position == this.position);
}

class HistoryTableDBCompanion extends UpdateCompanion<HistoryTableDBData> {
  final Value<int> id;
  final Value<int?> date;
  final Value<String> action;
  final Value<String?> login;
  final Value<String?> position;
  const HistoryTableDBCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.action = const Value.absent(),
    this.login = const Value.absent(),
    this.position = const Value.absent(),
  });
  HistoryTableDBCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required String action,
    this.login = const Value.absent(),
    this.position = const Value.absent(),
  }) : action = Value(action);
  static Insertable<HistoryTableDBData> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<String>? action,
    Expression<String>? login,
    Expression<String>? position,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (action != null) 'action': action,
      if (login != null) 'login': login,
      if (position != null) 'position': position,
    });
  }

  HistoryTableDBCompanion copyWith({
    Value<int>? id,
    Value<int?>? date,
    Value<String>? action,
    Value<String?>? login,
    Value<String?>? position,
  }) {
    return HistoryTableDBCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      action: action ?? this.action,
      login: login ?? this.login,
      position: position ?? this.position,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableDBCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('action: $action, ')
          ..write('login: $login, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }
}

class $StaffTableDBTable extends StaffTableDB
    with TableInfo<$StaffTableDBTable, StaffTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _powersMeta = const VerificationMeta('powers');
  @override
  late final GeneratedColumn<String> powers = GeneratedColumn<String>(
    'powers',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, login, password, position, powers];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<StaffTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('powers')) {
      context.handle(
        _powersMeta,
        powers.isAcceptableOrUnknown(data['powers']!, _powersMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
      powers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}powers'],
      ),
    );
  }

  @override
  $StaffTableDBTable createAlias(String alias) {
    return $StaffTableDBTable(attachedDatabase, alias);
  }
}

class StaffTableDBData extends DataClass
    implements Insertable<StaffTableDBData> {
  final int id;
  final String? login;
  final String? password;
  final String? position;
  final String? powers;
  const StaffTableDBData({
    required this.id,
    this.login,
    this.password,
    this.position,
    this.powers,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    if (!nullToAbsent || powers != null) {
      map['powers'] = Variable<String>(powers);
    }
    return map;
  }

  StaffTableDBCompanion toCompanion(bool nullToAbsent) {
    return StaffTableDBCompanion(
      id: Value(id),
      login: login == null && nullToAbsent
          ? const Value.absent()
          : Value(login),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      powers: powers == null && nullToAbsent
          ? const Value.absent()
          : Value(powers),
    );
  }

  factory StaffTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffTableDBData(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String?>(json['login']),
      password: serializer.fromJson<String?>(json['password']),
      position: serializer.fromJson<String?>(json['position']),
      powers: serializer.fromJson<String?>(json['powers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String?>(login),
      'password': serializer.toJson<String?>(password),
      'position': serializer.toJson<String?>(position),
      'powers': serializer.toJson<String?>(powers),
    };
  }

  StaffTableDBData copyWith({
    int? id,
    Value<String?> login = const Value.absent(),
    Value<String?> password = const Value.absent(),
    Value<String?> position = const Value.absent(),
    Value<String?> powers = const Value.absent(),
  }) => StaffTableDBData(
    id: id ?? this.id,
    login: login.present ? login.value : this.login,
    password: password.present ? password.value : this.password,
    position: position.present ? position.value : this.position,
    powers: powers.present ? powers.value : this.powers,
  );
  StaffTableDBData copyWithCompanion(StaffTableDBCompanion data) {
    return StaffTableDBData(
      id: data.id.present ? data.id.value : this.id,
      login: data.login.present ? data.login.value : this.login,
      password: data.password.present ? data.password.value : this.password,
      position: data.position.present ? data.position.value : this.position,
      powers: data.powers.present ? data.powers.value : this.powers,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffTableDBData(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('position: $position, ')
          ..write('powers: $powers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, login, password, position, powers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffTableDBData &&
          other.id == this.id &&
          other.login == this.login &&
          other.password == this.password &&
          other.position == this.position &&
          other.powers == this.powers);
}

class StaffTableDBCompanion extends UpdateCompanion<StaffTableDBData> {
  final Value<int> id;
  final Value<String?> login;
  final Value<String?> password;
  final Value<String?> position;
  final Value<String?> powers;
  const StaffTableDBCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.position = const Value.absent(),
    this.powers = const Value.absent(),
  });
  StaffTableDBCompanion.insert({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.position = const Value.absent(),
    this.powers = const Value.absent(),
  });
  static Insertable<StaffTableDBData> custom({
    Expression<int>? id,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? position,
    Expression<String>? powers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (position != null) 'position': position,
      if (powers != null) 'powers': powers,
    });
  }

  StaffTableDBCompanion copyWith({
    Value<int>? id,
    Value<String?>? login,
    Value<String?>? password,
    Value<String?>? position,
    Value<String?>? powers,
  }) {
    return StaffTableDBCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      position: position ?? this.position,
      powers: powers ?? this.powers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (powers.present) {
      map['powers'] = Variable<String>(powers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffTableDBCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('position: $position, ')
          ..write('powers: $powers')
          ..write(')'))
        .toString();
  }
}

class $OrderTableDBTable extends OrderTableDB
    with TableInfo<$OrderTableDBTable, OrderTableDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTableDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<String> product = GeneratedColumn<String>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPriceMeta = const VerificationMeta(
    'costPrice',
  );
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
    'cost_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    quantity,
    product,
    costPrice,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_table_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderTableDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(
        _costPriceMeta,
        costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderTableDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderTableDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product'],
      )!,
      costPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_price'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
    );
  }

  @override
  $OrderTableDBTable createAlias(String alias) {
    return $OrderTableDBTable(attachedDatabase, alias);
  }
}

class OrderTableDBData extends DataClass
    implements Insertable<OrderTableDBData> {
  final int id;
  final int quantity;
  final String product;
  final double? costPrice;
  final double? price;
  const OrderTableDBData({
    required this.id,
    required this.quantity,
    required this.product,
    this.costPrice,
    this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quantity'] = Variable<int>(quantity);
    map['product'] = Variable<String>(product);
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  OrderTableDBCompanion toCompanion(bool nullToAbsent) {
    return OrderTableDBCompanion(
      id: Value(id),
      quantity: Value(quantity),
      product: Value(product),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
    );
  }

  factory OrderTableDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderTableDBData(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<int>(json['quantity']),
      product: serializer.fromJson<String>(json['product']),
      costPrice: serializer.fromJson<double?>(json['costPrice']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<int>(quantity),
      'product': serializer.toJson<String>(product),
      'costPrice': serializer.toJson<double?>(costPrice),
      'price': serializer.toJson<double?>(price),
    };
  }

  OrderTableDBData copyWith({
    int? id,
    int? quantity,
    String? product,
    Value<double?> costPrice = const Value.absent(),
    Value<double?> price = const Value.absent(),
  }) => OrderTableDBData(
    id: id ?? this.id,
    quantity: quantity ?? this.quantity,
    product: product ?? this.product,
    costPrice: costPrice.present ? costPrice.value : this.costPrice,
    price: price.present ? price.value : this.price,
  );
  OrderTableDBData copyWithCompanion(OrderTableDBCompanion data) {
    return OrderTableDBData(
      id: data.id.present ? data.id.value : this.id,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      product: data.product.present ? data.product.value : this.product,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableDBData(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('product: $product, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantity, product, costPrice, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderTableDBData &&
          other.id == this.id &&
          other.quantity == this.quantity &&
          other.product == this.product &&
          other.costPrice == this.costPrice &&
          other.price == this.price);
}

class OrderTableDBCompanion extends UpdateCompanion<OrderTableDBData> {
  final Value<int> id;
  final Value<int> quantity;
  final Value<String> product;
  final Value<double?> costPrice;
  final Value<double?> price;
  const OrderTableDBCompanion({
    this.id = const Value.absent(),
    this.quantity = const Value.absent(),
    this.product = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.price = const Value.absent(),
  });
  OrderTableDBCompanion.insert({
    this.id = const Value.absent(),
    required int quantity,
    required String product,
    this.costPrice = const Value.absent(),
    this.price = const Value.absent(),
  }) : quantity = Value(quantity),
       product = Value(product);
  static Insertable<OrderTableDBData> custom({
    Expression<int>? id,
    Expression<int>? quantity,
    Expression<String>? product,
    Expression<double>? costPrice,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
      if (product != null) 'product': product,
      if (costPrice != null) 'cost_price': costPrice,
      if (price != null) 'price': price,
    });
  }

  OrderTableDBCompanion copyWith({
    Value<int>? id,
    Value<int>? quantity,
    Value<String>? product,
    Value<double?>? costPrice,
    Value<double?>? price,
  }) {
    return OrderTableDBCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
      costPrice: costPrice ?? this.costPrice,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (product.present) {
      map['product'] = Variable<String>(product.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableDBCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('product: $product, ')
          ..write('costPrice: $costPrice, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StorageTableDBTable storageTableDB = $StorageTableDBTable(this);
  late final $SalesTableDBTable salesTableDB = $SalesTableDBTable(this);
  late final $PurchasesTableDBTable purchasesTableDB = $PurchasesTableDBTable(
    this,
  );
  late final $DishesTableDBTable dishesTableDB = $DishesTableDBTable(this);
  late final $HistoryTableDBTable historyTableDB = $HistoryTableDBTable(this);
  late final $StaffTableDBTable staffTableDB = $StaffTableDBTable(this);
  late final $OrderTableDBTable orderTableDB = $OrderTableDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    storageTableDB,
    salesTableDB,
    purchasesTableDB,
    dishesTableDB,
    historyTableDB,
    staffTableDB,
    orderTableDB,
  ];
}

typedef $$StorageTableDBTableCreateCompanionBuilder =
    StorageTableDBCompanion Function({
      Value<int> id,
      Value<bool> inDishes,
      Value<String?> barcode,
      required String product,
      required int quantity,
      required String measuring,
      Value<double?> costPrice,
      Value<double?> price,
      Value<int?> found,
    });
typedef $$StorageTableDBTableUpdateCompanionBuilder =
    StorageTableDBCompanion Function({
      Value<int> id,
      Value<bool> inDishes,
      Value<String?> barcode,
      Value<String> product,
      Value<int> quantity,
      Value<String> measuring,
      Value<double?> costPrice,
      Value<double?> price,
      Value<int?> found,
    });

class $$StorageTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $StorageTableDBTable> {
  $$StorageTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inDishes => $composableBuilder(
    column: $table.inDishes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get found => $composableBuilder(
    column: $table.found,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StorageTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageTableDBTable> {
  $$StorageTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inDishes => $composableBuilder(
    column: $table.inDishes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get found => $composableBuilder(
    column: $table.found,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StorageTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageTableDBTable> {
  $$StorageTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get inDishes =>
      $composableBuilder(column: $table.inDishes, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get measuring =>
      $composableBuilder(column: $table.measuring, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get found =>
      $composableBuilder(column: $table.found, builder: (column) => column);
}

class $$StorageTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StorageTableDBTable,
          StorageTableDBData,
          $$StorageTableDBTableFilterComposer,
          $$StorageTableDBTableOrderingComposer,
          $$StorageTableDBTableAnnotationComposer,
          $$StorageTableDBTableCreateCompanionBuilder,
          $$StorageTableDBTableUpdateCompanionBuilder,
          (
            StorageTableDBData,
            BaseReferences<
              _$AppDatabase,
              $StorageTableDBTable,
              StorageTableDBData
            >,
          ),
          StorageTableDBData,
          PrefetchHooks Function()
        > {
  $$StorageTableDBTableTableManager(
    _$AppDatabase db,
    $StorageTableDBTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> inDishes = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> measuring = const Value.absent(),
                Value<double?> costPrice = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<int?> found = const Value.absent(),
              }) => StorageTableDBCompanion(
                id: id,
                inDishes: inDishes,
                barcode: barcode,
                product: product,
                quantity: quantity,
                measuring: measuring,
                costPrice: costPrice,
                price: price,
                found: found,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> inDishes = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                required String product,
                required int quantity,
                required String measuring,
                Value<double?> costPrice = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<int?> found = const Value.absent(),
              }) => StorageTableDBCompanion.insert(
                id: id,
                inDishes: inDishes,
                barcode: barcode,
                product: product,
                quantity: quantity,
                measuring: measuring,
                costPrice: costPrice,
                price: price,
                found: found,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StorageTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StorageTableDBTable,
      StorageTableDBData,
      $$StorageTableDBTableFilterComposer,
      $$StorageTableDBTableOrderingComposer,
      $$StorageTableDBTableAnnotationComposer,
      $$StorageTableDBTableCreateCompanionBuilder,
      $$StorageTableDBTableUpdateCompanionBuilder,
      (
        StorageTableDBData,
        BaseReferences<_$AppDatabase, $StorageTableDBTable, StorageTableDBData>,
      ),
      StorageTableDBData,
      PrefetchHooks Function()
    >;
typedef $$SalesTableDBTableCreateCompanionBuilder =
    SalesTableDBCompanion Function({
      Value<int> id,
      required int order,
      Value<int?> date,
      required double sumOrder,
      Value<String?> barcode,
      required String product,
      required int quantity,
      required double price,
      required double nds,
      Value<bool> sold,
      Value<bool> paid,
    });
typedef $$SalesTableDBTableUpdateCompanionBuilder =
    SalesTableDBCompanion Function({
      Value<int> id,
      Value<int> order,
      Value<int?> date,
      Value<double> sumOrder,
      Value<String?> barcode,
      Value<String> product,
      Value<int> quantity,
      Value<double> price,
      Value<double> nds,
      Value<bool> sold,
      Value<bool> paid,
    });

class $$SalesTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $SalesTableDBTable> {
  $$SalesTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sumOrder => $composableBuilder(
    column: $table.sumOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nds => $composableBuilder(
    column: $table.nds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sold => $composableBuilder(
    column: $table.sold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTableDBTable> {
  $$SalesTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get order => $composableBuilder(
    column: $table.order,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sumOrder => $composableBuilder(
    column: $table.sumOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nds => $composableBuilder(
    column: $table.nds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sold => $composableBuilder(
    column: $table.sold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTableDBTable> {
  $$SalesTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get sumOrder =>
      $composableBuilder(column: $table.sumOrder, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get nds =>
      $composableBuilder(column: $table.nds, builder: (column) => column);

  GeneratedColumn<bool> get sold =>
      $composableBuilder(column: $table.sold, builder: (column) => column);

  GeneratedColumn<bool> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);
}

class $$SalesTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesTableDBTable,
          SalesTableDBData,
          $$SalesTableDBTableFilterComposer,
          $$SalesTableDBTableOrderingComposer,
          $$SalesTableDBTableAnnotationComposer,
          $$SalesTableDBTableCreateCompanionBuilder,
          $$SalesTableDBTableUpdateCompanionBuilder,
          (
            SalesTableDBData,
            BaseReferences<_$AppDatabase, $SalesTableDBTable, SalesTableDBData>,
          ),
          SalesTableDBData,
          PrefetchHooks Function()
        > {
  $$SalesTableDBTableTableManager(_$AppDatabase db, $SalesTableDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> order = const Value.absent(),
                Value<int?> date = const Value.absent(),
                Value<double> sumOrder = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> nds = const Value.absent(),
                Value<bool> sold = const Value.absent(),
                Value<bool> paid = const Value.absent(),
              }) => SalesTableDBCompanion(
                id: id,
                order: order,
                date: date,
                sumOrder: sumOrder,
                barcode: barcode,
                product: product,
                quantity: quantity,
                price: price,
                nds: nds,
                sold: sold,
                paid: paid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int order,
                Value<int?> date = const Value.absent(),
                required double sumOrder,
                Value<String?> barcode = const Value.absent(),
                required String product,
                required int quantity,
                required double price,
                required double nds,
                Value<bool> sold = const Value.absent(),
                Value<bool> paid = const Value.absent(),
              }) => SalesTableDBCompanion.insert(
                id: id,
                order: order,
                date: date,
                sumOrder: sumOrder,
                barcode: barcode,
                product: product,
                quantity: quantity,
                price: price,
                nds: nds,
                sold: sold,
                paid: paid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesTableDBTable,
      SalesTableDBData,
      $$SalesTableDBTableFilterComposer,
      $$SalesTableDBTableOrderingComposer,
      $$SalesTableDBTableAnnotationComposer,
      $$SalesTableDBTableCreateCompanionBuilder,
      $$SalesTableDBTableUpdateCompanionBuilder,
      (
        SalesTableDBData,
        BaseReferences<_$AppDatabase, $SalesTableDBTable, SalesTableDBData>,
      ),
      SalesTableDBData,
      PrefetchHooks Function()
    >;
typedef $$PurchasesTableDBTableCreateCompanionBuilder =
    PurchasesTableDBCompanion Function({
      Value<int> id,
      Value<int?> date,
      Value<String?> barcode,
      required String product,
      required int quantity,
      required String measuring,
      required double priceOfPurchases,
    });
typedef $$PurchasesTableDBTableUpdateCompanionBuilder =
    PurchasesTableDBCompanion Function({
      Value<int> id,
      Value<int?> date,
      Value<String?> barcode,
      Value<String> product,
      Value<int> quantity,
      Value<String> measuring,
      Value<double> priceOfPurchases,
    });

class $$PurchasesTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $PurchasesTableDBTable> {
  $$PurchasesTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceOfPurchases => $composableBuilder(
    column: $table.priceOfPurchases,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchasesTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchasesTableDBTable> {
  $$PurchasesTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceOfPurchases => $composableBuilder(
    column: $table.priceOfPurchases,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchasesTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchasesTableDBTable> {
  $$PurchasesTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get measuring =>
      $composableBuilder(column: $table.measuring, builder: (column) => column);

  GeneratedColumn<double> get priceOfPurchases => $composableBuilder(
    column: $table.priceOfPurchases,
    builder: (column) => column,
  );
}

class $$PurchasesTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchasesTableDBTable,
          PurchasesTableDBData,
          $$PurchasesTableDBTableFilterComposer,
          $$PurchasesTableDBTableOrderingComposer,
          $$PurchasesTableDBTableAnnotationComposer,
          $$PurchasesTableDBTableCreateCompanionBuilder,
          $$PurchasesTableDBTableUpdateCompanionBuilder,
          (
            PurchasesTableDBData,
            BaseReferences<
              _$AppDatabase,
              $PurchasesTableDBTable,
              PurchasesTableDBData
            >,
          ),
          PurchasesTableDBData,
          PrefetchHooks Function()
        > {
  $$PurchasesTableDBTableTableManager(
    _$AppDatabase db,
    $PurchasesTableDBTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchasesTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchasesTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchasesTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> date = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> measuring = const Value.absent(),
                Value<double> priceOfPurchases = const Value.absent(),
              }) => PurchasesTableDBCompanion(
                id: id,
                date: date,
                barcode: barcode,
                product: product,
                quantity: quantity,
                measuring: measuring,
                priceOfPurchases: priceOfPurchases,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> date = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                required String product,
                required int quantity,
                required String measuring,
                required double priceOfPurchases,
              }) => PurchasesTableDBCompanion.insert(
                id: id,
                date: date,
                barcode: barcode,
                product: product,
                quantity: quantity,
                measuring: measuring,
                priceOfPurchases: priceOfPurchases,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchasesTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchasesTableDBTable,
      PurchasesTableDBData,
      $$PurchasesTableDBTableFilterComposer,
      $$PurchasesTableDBTableOrderingComposer,
      $$PurchasesTableDBTableAnnotationComposer,
      $$PurchasesTableDBTableCreateCompanionBuilder,
      $$PurchasesTableDBTableUpdateCompanionBuilder,
      (
        PurchasesTableDBData,
        BaseReferences<
          _$AppDatabase,
          $PurchasesTableDBTable,
          PurchasesTableDBData
        >,
      ),
      PurchasesTableDBData,
      PrefetchHooks Function()
    >;
typedef $$DishesTableDBTableCreateCompanionBuilder =
    DishesTableDBCompanion Function({
      Value<int> id,
      Value<String?> nameDishes,
      required String product,
      Value<String?> measuring,
      required int quantity,
      Value<double?> costPriceProduct,
      Value<double?> priceDishes,
    });
typedef $$DishesTableDBTableUpdateCompanionBuilder =
    DishesTableDBCompanion Function({
      Value<int> id,
      Value<String?> nameDishes,
      Value<String> product,
      Value<String?> measuring,
      Value<int> quantity,
      Value<double?> costPriceProduct,
      Value<double?> priceDishes,
    });

class $$DishesTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $DishesTableDBTable> {
  $$DishesTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameDishes => $composableBuilder(
    column: $table.nameDishes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPriceProduct => $composableBuilder(
    column: $table.costPriceProduct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceDishes => $composableBuilder(
    column: $table.priceDishes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DishesTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $DishesTableDBTable> {
  $$DishesTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameDishes => $composableBuilder(
    column: $table.nameDishes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measuring => $composableBuilder(
    column: $table.measuring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPriceProduct => $composableBuilder(
    column: $table.costPriceProduct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceDishes => $composableBuilder(
    column: $table.priceDishes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DishesTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $DishesTableDBTable> {
  $$DishesTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameDishes => $composableBuilder(
    column: $table.nameDishes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<String> get measuring =>
      $composableBuilder(column: $table.measuring, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get costPriceProduct => $composableBuilder(
    column: $table.costPriceProduct,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceDishes => $composableBuilder(
    column: $table.priceDishes,
    builder: (column) => column,
  );
}

class $$DishesTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DishesTableDBTable,
          DishesTableDBData,
          $$DishesTableDBTableFilterComposer,
          $$DishesTableDBTableOrderingComposer,
          $$DishesTableDBTableAnnotationComposer,
          $$DishesTableDBTableCreateCompanionBuilder,
          $$DishesTableDBTableUpdateCompanionBuilder,
          (
            DishesTableDBData,
            BaseReferences<
              _$AppDatabase,
              $DishesTableDBTable,
              DishesTableDBData
            >,
          ),
          DishesTableDBData,
          PrefetchHooks Function()
        > {
  $$DishesTableDBTableTableManager(_$AppDatabase db, $DishesTableDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DishesTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DishesTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DishesTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nameDishes = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<String?> measuring = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double?> costPriceProduct = const Value.absent(),
                Value<double?> priceDishes = const Value.absent(),
              }) => DishesTableDBCompanion(
                id: id,
                nameDishes: nameDishes,
                product: product,
                measuring: measuring,
                quantity: quantity,
                costPriceProduct: costPriceProduct,
                priceDishes: priceDishes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> nameDishes = const Value.absent(),
                required String product,
                Value<String?> measuring = const Value.absent(),
                required int quantity,
                Value<double?> costPriceProduct = const Value.absent(),
                Value<double?> priceDishes = const Value.absent(),
              }) => DishesTableDBCompanion.insert(
                id: id,
                nameDishes: nameDishes,
                product: product,
                measuring: measuring,
                quantity: quantity,
                costPriceProduct: costPriceProduct,
                priceDishes: priceDishes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DishesTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DishesTableDBTable,
      DishesTableDBData,
      $$DishesTableDBTableFilterComposer,
      $$DishesTableDBTableOrderingComposer,
      $$DishesTableDBTableAnnotationComposer,
      $$DishesTableDBTableCreateCompanionBuilder,
      $$DishesTableDBTableUpdateCompanionBuilder,
      (
        DishesTableDBData,
        BaseReferences<_$AppDatabase, $DishesTableDBTable, DishesTableDBData>,
      ),
      DishesTableDBData,
      PrefetchHooks Function()
    >;
typedef $$HistoryTableDBTableCreateCompanionBuilder =
    HistoryTableDBCompanion Function({
      Value<int> id,
      Value<int?> date,
      required String action,
      Value<String?> login,
      Value<String?> position,
    });
typedef $$HistoryTableDBTableUpdateCompanionBuilder =
    HistoryTableDBCompanion Function({
      Value<int> id,
      Value<int?> date,
      Value<String> action,
      Value<String?> login,
      Value<String?> position,
    });

class $$HistoryTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableDBTable> {
  $$HistoryTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoryTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableDBTable> {
  $$HistoryTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoryTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableDBTable> {
  $$HistoryTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);
}

class $$HistoryTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoryTableDBTable,
          HistoryTableDBData,
          $$HistoryTableDBTableFilterComposer,
          $$HistoryTableDBTableOrderingComposer,
          $$HistoryTableDBTableAnnotationComposer,
          $$HistoryTableDBTableCreateCompanionBuilder,
          $$HistoryTableDBTableUpdateCompanionBuilder,
          (
            HistoryTableDBData,
            BaseReferences<
              _$AppDatabase,
              $HistoryTableDBTable,
              HistoryTableDBData
            >,
          ),
          HistoryTableDBData,
          PrefetchHooks Function()
        > {
  $$HistoryTableDBTableTableManager(
    _$AppDatabase db,
    $HistoryTableDBTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> date = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> login = const Value.absent(),
                Value<String?> position = const Value.absent(),
              }) => HistoryTableDBCompanion(
                id: id,
                date: date,
                action: action,
                login: login,
                position: position,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> date = const Value.absent(),
                required String action,
                Value<String?> login = const Value.absent(),
                Value<String?> position = const Value.absent(),
              }) => HistoryTableDBCompanion.insert(
                id: id,
                date: date,
                action: action,
                login: login,
                position: position,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoryTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoryTableDBTable,
      HistoryTableDBData,
      $$HistoryTableDBTableFilterComposer,
      $$HistoryTableDBTableOrderingComposer,
      $$HistoryTableDBTableAnnotationComposer,
      $$HistoryTableDBTableCreateCompanionBuilder,
      $$HistoryTableDBTableUpdateCompanionBuilder,
      (
        HistoryTableDBData,
        BaseReferences<_$AppDatabase, $HistoryTableDBTable, HistoryTableDBData>,
      ),
      HistoryTableDBData,
      PrefetchHooks Function()
    >;
typedef $$StaffTableDBTableCreateCompanionBuilder =
    StaffTableDBCompanion Function({
      Value<int> id,
      Value<String?> login,
      Value<String?> password,
      Value<String?> position,
      Value<String?> powers,
    });
typedef $$StaffTableDBTableUpdateCompanionBuilder =
    StaffTableDBCompanion Function({
      Value<int> id,
      Value<String?> login,
      Value<String?> password,
      Value<String?> position,
      Value<String?> powers,
    });

class $$StaffTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $StaffTableDBTable> {
  $$StaffTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get powers => $composableBuilder(
    column: $table.powers,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StaffTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $StaffTableDBTable> {
  $$StaffTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get powers => $composableBuilder(
    column: $table.powers,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StaffTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $StaffTableDBTable> {
  $$StaffTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get powers =>
      $composableBuilder(column: $table.powers, builder: (column) => column);
}

class $$StaffTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StaffTableDBTable,
          StaffTableDBData,
          $$StaffTableDBTableFilterComposer,
          $$StaffTableDBTableOrderingComposer,
          $$StaffTableDBTableAnnotationComposer,
          $$StaffTableDBTableCreateCompanionBuilder,
          $$StaffTableDBTableUpdateCompanionBuilder,
          (
            StaffTableDBData,
            BaseReferences<_$AppDatabase, $StaffTableDBTable, StaffTableDBData>,
          ),
          StaffTableDBData,
          PrefetchHooks Function()
        > {
  $$StaffTableDBTableTableManager(_$AppDatabase db, $StaffTableDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> login = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> powers = const Value.absent(),
              }) => StaffTableDBCompanion(
                id: id,
                login: login,
                password: password,
                position: position,
                powers: powers,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> login = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> powers = const Value.absent(),
              }) => StaffTableDBCompanion.insert(
                id: id,
                login: login,
                password: password,
                position: position,
                powers: powers,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StaffTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StaffTableDBTable,
      StaffTableDBData,
      $$StaffTableDBTableFilterComposer,
      $$StaffTableDBTableOrderingComposer,
      $$StaffTableDBTableAnnotationComposer,
      $$StaffTableDBTableCreateCompanionBuilder,
      $$StaffTableDBTableUpdateCompanionBuilder,
      (
        StaffTableDBData,
        BaseReferences<_$AppDatabase, $StaffTableDBTable, StaffTableDBData>,
      ),
      StaffTableDBData,
      PrefetchHooks Function()
    >;
typedef $$OrderTableDBTableCreateCompanionBuilder =
    OrderTableDBCompanion Function({
      Value<int> id,
      required int quantity,
      required String product,
      Value<double?> costPrice,
      Value<double?> price,
    });
typedef $$OrderTableDBTableUpdateCompanionBuilder =
    OrderTableDBCompanion Function({
      Value<int> id,
      Value<int> quantity,
      Value<String> product,
      Value<double?> costPrice,
      Value<double?> price,
    });

class $$OrderTableDBTableFilterComposer
    extends Composer<_$AppDatabase, $OrderTableDBTable> {
  $$OrderTableDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderTableDBTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderTableDBTable> {
  $$OrderTableDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get product => $composableBuilder(
    column: $table.product,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPrice => $composableBuilder(
    column: $table.costPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderTableDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderTableDBTable> {
  $$OrderTableDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get product =>
      $composableBuilder(column: $table.product, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$OrderTableDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderTableDBTable,
          OrderTableDBData,
          $$OrderTableDBTableFilterComposer,
          $$OrderTableDBTableOrderingComposer,
          $$OrderTableDBTableAnnotationComposer,
          $$OrderTableDBTableCreateCompanionBuilder,
          $$OrderTableDBTableUpdateCompanionBuilder,
          (
            OrderTableDBData,
            BaseReferences<_$AppDatabase, $OrderTableDBTable, OrderTableDBData>,
          ),
          OrderTableDBData,
          PrefetchHooks Function()
        > {
  $$OrderTableDBTableTableManager(_$AppDatabase db, $OrderTableDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderTableDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderTableDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderTableDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> product = const Value.absent(),
                Value<double?> costPrice = const Value.absent(),
                Value<double?> price = const Value.absent(),
              }) => OrderTableDBCompanion(
                id: id,
                quantity: quantity,
                product: product,
                costPrice: costPrice,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int quantity,
                required String product,
                Value<double?> costPrice = const Value.absent(),
                Value<double?> price = const Value.absent(),
              }) => OrderTableDBCompanion.insert(
                id: id,
                quantity: quantity,
                product: product,
                costPrice: costPrice,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderTableDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderTableDBTable,
      OrderTableDBData,
      $$OrderTableDBTableFilterComposer,
      $$OrderTableDBTableOrderingComposer,
      $$OrderTableDBTableAnnotationComposer,
      $$OrderTableDBTableCreateCompanionBuilder,
      $$OrderTableDBTableUpdateCompanionBuilder,
      (
        OrderTableDBData,
        BaseReferences<_$AppDatabase, $OrderTableDBTable, OrderTableDBData>,
      ),
      OrderTableDBData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StorageTableDBTableTableManager get storageTableDB =>
      $$StorageTableDBTableTableManager(_db, _db.storageTableDB);
  $$SalesTableDBTableTableManager get salesTableDB =>
      $$SalesTableDBTableTableManager(_db, _db.salesTableDB);
  $$PurchasesTableDBTableTableManager get purchasesTableDB =>
      $$PurchasesTableDBTableTableManager(_db, _db.purchasesTableDB);
  $$DishesTableDBTableTableManager get dishesTableDB =>
      $$DishesTableDBTableTableManager(_db, _db.dishesTableDB);
  $$HistoryTableDBTableTableManager get historyTableDB =>
      $$HistoryTableDBTableTableManager(_db, _db.historyTableDB);
  $$StaffTableDBTableTableManager get staffTableDB =>
      $$StaffTableDBTableTableManager(_db, _db.staffTableDB);
  $$OrderTableDBTableTableManager get orderTableDB =>
      $$OrderTableDBTableTableManager(_db, _db.orderTableDB);
}
