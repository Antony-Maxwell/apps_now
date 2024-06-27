import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  List<Product>? products;

  Products({this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}



@JsonSerializable()
class Product {
  ProdImage? prodImage;
  String? prodId;
  String? prodCode;
  String? barCode;
  String? prodName;
  @JsonKey(name: 'UOM')
  String? uom;
  @JsonKey(name: 'unit_id')
  String? unitId;
  @JsonKey(name: 'prod_combo')
  String? prodCombo;
  @JsonKey(name: 'is_focused')
  String? isFocused;
  @JsonKey(name: 'group_ids')
  String? groupIds;
  @JsonKey(name: 'category_ids')
  String? categoryIds;
  @JsonKey(name: 'unit_from_value')
  String? unitFromValue;
  @JsonKey(name: 'unit_to_value')
  String? unitToValue;
  @JsonKey(name: 'uom_alternate_name')
  String? uomAlternateName;
  @JsonKey(name: 'uom_alternate_id')
  String? uomAlternateId;
  @JsonKey(name: 'alt_uom_from_decimal')
  String? altUomFromDecimal;
  @JsonKey(name: 'alt_uom_to_decimal')
  String? altUomToDecimal;
  @JsonKey(name: 'under_warranty')
  String? underWarranty;
  String? action;
  String? groupId;
  String? catId;
  String? prodHsnId;
  String? prodHsnCode;
  String? prodShortName;
  String? prodPrice;
  String? prodMrp;
  String? prodBuy;
  String? prodSell;
  String? prodFreeItem;
  String? prodRkPrice;
  ProdTax? prodTax;

  Product({
    this.prodImage,
    this.prodId,
    this.prodCode,
    this.barCode,
    this.prodName,
    this.uom,
    this.unitId,
    this.prodCombo,
    this.isFocused,
    this.groupIds,
    this.categoryIds,
    this.unitFromValue,
    this.unitToValue,
    this.uomAlternateName,
    this.uomAlternateId,
    this.altUomFromDecimal,
    this.altUomToDecimal,
    this.underWarranty,
    this.action,
    this.groupId,
    this.catId,
    this.prodHsnId,
    this.prodHsnCode,
    this.prodShortName,
    this.prodPrice,
    this.prodMrp,
    this.prodBuy,
    this.prodSell,
    this.prodFreeItem,
    this.prodRkPrice,
    this.prodTax,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}



@JsonSerializable()
class ProdTax {
  @JsonKey(name: 'IN')
  In? prodTaxIn;
  @JsonKey(name: 'OUT')
  Out? out;

  ProdTax({this.prodTaxIn, this.out});

  factory ProdTax.fromJson(Map<String, dynamic> json) {
    return _$ProdTaxFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProdTaxToJson(this);
}



@JsonSerializable()
class ProdImage {
  String? nano;
  String? micro;
  String? small;
  @JsonKey(name: 'extra_small')
  String? extraSmall;
  String? medium;
  String? large;
  @JsonKey(name: 'extra_large')
  String? extraLarge;
  @JsonKey(name: 'custom_image')
  String? customImage;

  ProdImage({
    this.nano,
    this.micro,
    this.small,
    this.extraSmall,
    this.medium,
    this.large,
    this.extraLarge,
    this.customImage,
  });

  factory ProdImage.fromJson(Map<String, dynamic> json) {
    return _$ProdImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProdImageToJson(this);
}



@JsonSerializable()
class Out {
	@JsonKey(name: 'IS') 
	List<Is>? ins;
	@JsonKey(name: 'OS') 
	List<O>? os;

	Out({this.ins, this.os});

	factory Out.fromJson(Map<String, dynamic> json) => _$OutFromJson(json);

	Map<String, dynamic> toJson() => _$OutToJson(this);
}



@JsonSerializable()
class O {
  @JsonKey(name: 'taxVal_date')
  String? taxValDate;
  @JsonKey(name: 'taxVal_country')
  String? taxValCountry;
  @JsonKey(name: 'taxVal_from_rate')
  String? taxValFromRate;
  @JsonKey(name: 'taxVal_to_rate')
  String? taxValToRate;
  @JsonKey(name: 'taxVal_state')
  String? taxValState;
  @JsonKey(name: 'taxVal_behav')
  String? taxValBehav;
  @JsonKey(name: 'taxVal_taxPercentage')
  String? taxValTaxPercentage;
  @JsonKey(name: 'taxVal_exemption')
  String? taxValExemption;
  @JsonKey(name: 'taxVal_OwnId')
  String? taxValOwnId;
  @JsonKey(name: 'tax_name')
  String? taxName;
  @JsonKey(name: 'tax_percent')
  String? taxPercent;
  @JsonKey(name: 'gst_type')
  String? gstType;
  @JsonKey(name: 'tax_id')
  String? taxId;
  @JsonKey(name: 'tax_parent')
  String? taxParent;
  @JsonKey(name: 'tax_apply_on')
  String? taxApplyOn;

  O({
    this.taxValDate,
    this.taxValCountry,
    this.taxValFromRate,
    this.taxValToRate,
    this.taxValState,
    this.taxValBehav,
    this.taxValTaxPercentage,
    this.taxValExemption,
    this.taxValOwnId,
    this.taxName,
    this.taxPercent,
    this.gstType,
    this.taxId,
    this.taxParent,
    this.taxApplyOn,
  });

  factory O.fromJson(Map<String, dynamic> json) => _$OFromJson(json);

  Map<String, dynamic> toJson() => _$OToJson(this);
}



@JsonSerializable()
class Is {
  @JsonKey(name: 'taxVal_date')
  String? taxValDate;
  @JsonKey(name: 'taxVal_country')
  String? taxValCountry;
  @JsonKey(name: 'taxVal_from_rate')
  String? taxValFromRate;
  @JsonKey(name: 'taxVal_to_rate')
  String? taxValToRate;
  @JsonKey(name: 'taxVal_state')
  String? taxValState;
  @JsonKey(name: 'taxVal_behav')
  String? taxValBehav;
  @JsonKey(name: 'taxVal_taxPercentage')
  String? taxValTaxPercentage;
  @JsonKey(name: 'taxVal_exemption')
  String? taxValExemption;
  @JsonKey(name: 'taxVal_OwnId')
  String? taxValOwnId;
  @JsonKey(name: 'tax_name')
  String? taxName;
  @JsonKey(name: 'tax_percent')
  String? taxPercent;
  @JsonKey(name: 'gst_type')
  String? gstType;
  @JsonKey(name: 'tax_id')
  String? taxId;
  @JsonKey(name: 'tax_parent')
  String? taxParent;
  @JsonKey(name: 'tax_apply_on')
  String? taxApplyOn;

  Is({
    this.taxValDate,
    this.taxValCountry,
    this.taxValFromRate,
    this.taxValToRate,
    this.taxValState,
    this.taxValBehav,
    this.taxValTaxPercentage,
    this.taxValExemption,
    this.taxValOwnId,
    this.taxName,
    this.taxPercent,
    this.gstType,
    this.taxId,
    this.taxParent,
    this.taxApplyOn,
  });

  factory Is.fromJson(Map<String, dynamic> json) => _$IsFromJson(json);

  Map<String, dynamic> toJson() => _$IsToJson(this);
}



@JsonSerializable()
class In {
	@JsonKey(name: 'IS') 
	List<Is>? ins;
	@JsonKey(name: 'OS') 
	List<O>? os;

	In({this.ins, this.os});

	factory In.fromJson(Map<String, dynamic> json) => _$InFromJson(json);

	Map<String, dynamic> toJson() => _$InToJson(this);
}

