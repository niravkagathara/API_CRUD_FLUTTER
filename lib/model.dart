class model{
  String _name="";

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  Map<String,dynamic> convert(){

  return {
    "name":_name
  };
  }
}