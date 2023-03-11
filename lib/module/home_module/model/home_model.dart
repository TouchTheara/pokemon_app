class HomeModel {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  List<String>? evolutions;
  List<String>? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? malePercentage;
  String? femalePercentage;
  int? genderless;
  String? cycles;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;
  bool fav =false;

  HomeModel(
      {this.name,
      this.id,
      this.fav=false,
      this.imageurl,
      this.xdescription,
      this.ydescription,
      this.height,
      this.category,
      this.weight,
      this.typeofpokemon,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.total,
      this.malePercentage,
      this.femalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedfrom,
      this.reason,
      this.baseExp});

  HomeModel.fromJson(Map<String, dynamic> json) {
  
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    evolutions = json['evolutions'].cast<String>();
    abilities = json['abilities'].cast<String>();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    malePercentage = json['male_percentage'];
    femalePercentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    eggGroups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    baseExp = json['base_exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['imageurl'] = imageurl;
    data['xdescription'] = xdescription;
    data['ydescription'] = ydescription;
    data['height'] = height;
    data['category'] = category;
    data['weight'] = weight;
    data['typeofpokemon'] = typeofpokemon;
    data['weaknesses'] = weaknesses;
    data['evolutions'] = evolutions;
    data['abilities'] = abilities;
    data['hp'] = hp;
    data['attack'] = attack;
    data['defense'] = defense;
    data['special_attack'] = specialAttack;
    data['special_defense'] = specialDefense;
    data['speed'] = speed;
    data['total'] = total;
    data['male_percentage'] = malePercentage;
    data['female_percentage'] = femalePercentage;
    data['genderless'] = genderless;
    data['cycles'] = cycles;
    data['egg_groups'] = eggGroups;
    data['evolvedfrom'] = evolvedfrom;
    data['reason'] = reason;
    data['base_exp'] = baseExp;
    return data;
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'home_model.freezed.dart';
// part 'home_model.g.dart';

// @freezed
// class HomeModel with _$HomeModel {
//   const factory HomeModel({
//     @JsonKey(name: "name") @Default("") final String? name,
//     // @JsonKey(name: "id") @Default("") final String? id,
//     // @JsonKey(name: "imageurl") @Default("") final String? imageurl,
//     // @JsonKey(name: "xdescription") @Default("") final String? xdescription,
//     // @JsonKey(name: "ydescription") @Default("") final String? ydescription,
//     // @JsonKey(name: "height") @Default("") final String? height,
//     // @JsonKey(name: "category") @Default("") final String? category,
//     // @JsonKey(name: "weight") @Default("") final String? weight,
//     // @JsonKey(name: "typeofpokemon")
//     // @Default([])
//     //     final List<String> typeofpokemon,
//     // @JsonKey(name: "weaknesses") @Default([]) final List<String> weaknesses,
//     // @JsonKey(name: "evolutions") @Default([]) final List<String> evolutions,
//     // @JsonKey(name: "abilities") @Default([]) final List<String> abilities,
//     // @JsonKey(name: "hp") @Default(0) final int? hp,
//     // @JsonKey(name: "attack") @Default(0) final int? attack,
//     // @JsonKey(name: "defense") @Default(0) final int? defense,
//     // @JsonKey(name: "special_attack") @Default(0) final int? specialAttack,
//     // @JsonKey(name: "special_defense") @Default(0) final int? specialDefense,
//     // @JsonKey(name: "speed") @Default(0) final int? speed,
//     // @JsonKey(name: "total") @Default(0) final int? total,
//     // @JsonKey(name: "male_percentage") @Default("") final String? malePercentage,
//     // @JsonKey(name: "female_percentage")
//     // @Default("")
//     //     final String? femalePercentage,
//     // @JsonKey(name: "genderless") @Default(0) final int? genderless,
//     // @JsonKey(name: "cycles") @Default("") final String? cycles,
//     // @JsonKey(name: "egg_groups") @Default("") final String? eggGroups,
//     // @JsonKey(name: "evolvedfrom") @Default("") final String? evolvedfrom,
//     // @JsonKey(name: "reason") @Default("") final String? reason,
//     // @JsonKey(name: "base_exp") @Default("") final String? baseExp,
//   }) = _HomeModel;
//   factory HomeModel.fromJson(Map<String, dynamic> json) =>
//       _$HomeModelFromJson(json);
// }
