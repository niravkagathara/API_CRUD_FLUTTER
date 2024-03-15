// /// name : "Edwin Zulauf"
// /// salary : 41
// /// exp : 98
// /// pho : "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1000.jpg"
// /// id : "23"
//
// class Usermodel {
//   Usermodel({
//       String? name,
//       num salary,
//       num exp,
//       String pho,
//       String id,}){
//     _name = name!;
//     _salary = salary;
//     _exp = exp;
//     _pho = pho;
//     _id = id;
// }
//
//   Usermodel.fromJson(dynamic json) {
//     _name = json['name'];
//     _salary = json['salary'];
//     _exp = json['exp'];
//     _pho = json['pho'];
//     _id = json['id'];
//   }
//   String _name;
//   num _salary;
//   num _exp;
//   String _pho;
//   String _id;
// Usermodel copyWith({  String name,
//   num salary,
//   num exp,
//   String pho,
//   String id,
// }) => Usermodel(  name: name ?? _name,
//   salary: salary ?? _salary,
//   exp: exp ?? _exp,
//   pho: pho ?? _pho,
//   id: id ?? _id,
// );
//   String get name => _name;
//   num get salary => _salary;
//   num get exp => _exp;
//   String get pho => _pho;
//   String get id => _id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = _name;
//     map['salary'] = _salary;
//     map['exp'] = _exp;
//     map['pho'] = _pho;
//     map['id'] = _id;
//     return map;
//   }
//
// }