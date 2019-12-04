class Tree {
  String _id;
  String _image;
  String _status;
  bool _isFlower;
  bool _isFruit;
  bool _isWood;
  bool _isGrass;
  String _name;
  int _age;
  String _area;
  List<String> _todo;
  String _idUser;

  Tree(
      this._id,
      this._image,
      this._status,
      this._isFlower,
      this._isFruit,
      this._isWood,
      this._isGrass,
      this._name,
      this._age,
      this._area,
      this._todo,
      this._idUser);

  Tree.map(dynamic obj) {
    this._id = obj["id"];
    this._image = obj["image"];
    this._status = obj["status"];
    this._isFlower = obj["isFlowe"];
    this._isFruit = obj["isFruit"];
    this._isWood = obj["isWood"];
    this._isGrass = obj["isGrass"];
    this._name = obj["name"];
    this._age = obj["age"];
    this._area = obj["area"];
    this._todo = obj["todo"];
    this._idUser = obj["idUser"];
  }

  String get area => _area;

  int get age => _age;

  String get name => _name;

  bool get isGrass => _isGrass;

  bool get isWood => _isWood;

  bool get isFruit => _isFruit;

  bool get isFlower => _isFlower;

  String get status => _status;

  String get image => _image;

  String get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["image"] = _image;
    map["status"] = _status;
    map["isFlowe"] = _isFlower;
    map["isFruit"] = _isFruit;
    map["isWood"] = _isWood;
    map["isGrass"] = _isGrass;
    map["name"] = _name;
    map["age"] = _age;
    map["area"] = _area;
    map["todo"] = _todo;
    map["idUser"] = _idUser;
    return map;
  }

  Tree.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._image = map["image"];
    this._status = map["status"];
    this._isFlower = map["isFlowe"];
    this._isFruit = map["isFruit"];
    this._isWood = map["isWood"];
    this._isGrass = map["isGrass"];
    this._name = map["name"];
    this._age = map["age"];
    this._area = map["area"];
    this._idUser = map["idUser"];
  }
  @override
  String toString() {
    return 'Tree{_id: $_id, _image: $_image, _status: $_status, _isFlower: $_isFlower, _isFruit: $_isFruit, _isWood: $_isWood, _isGrass: $_isGrass, _name: $_name, _age: $_age, _area: $_area, _todo: $_todo, _idUser: $_idUser}';
  }
}
