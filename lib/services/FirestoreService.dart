import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/Tree.dart';

final CollectionReference myCollection = Firestore.instance.collection('Tree');

class FirestoreService{
  Future<Tree> createTree(id, image, status, isFlower,isFruit,
      isWood, isGrass, name, age, area,
      todo, idUser) async {
    final Tree tree = new Tree(
        id,
        image,
        status,
        isFlower,
        isFruit,
        isWood,
        isGrass,
        name,
        age,
        area,
        todo,
        idUser);
    print(tree.toString());
    await myCollection.add({
      "id":tree.id,
      "image":tree.image,
      "status":tree.status,
      "isFlower":tree.isFlower,
      "isFruit":tree.isFruit,
      "isWood":tree.isWood,
      "isGrass":tree.isGrass,
      "name":tree.name,
      "area":tree.area,
      "todo":todo,
      "idUser":idUser
    });
    print("da add");

    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document());

      final Tree tree = new Tree(
          id,
          image,
          status,
          isFlower,
          isFruit,
          isWood,
          isGrass,
          name,
          age,
          area,
          todo,
          idUser);
      print(tree.toString());
      final Map<String, dynamic> data = tree.toMap();
      await tx.set(ds.reference, data);
      print("task added");
      return data;
    };



    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Tree.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }
  updateData(String idTreeFireStore,id, image, status, isFlower,isFruit,
      isWood, isGrass, name, age, area,
      todo, idUser) async{
    final abc = await myCollection.where('id',isEqualTo: idTreeFireStore).getDocuments();
    print(abc);
    await myCollection.document(abc.documents.first.documentID).updateData({
      "id":id,
      "image":image,
      "status":status,
      "isFlower":isFlower,
      "isFruit":isFruit,
      "isWood":isWood,
      "isGrass":isGrass,
      "name":name,
      "area":area,
      "todo":todo,
      "idUser":idUser
    }).whenComplete(()=>{
      print("da update")
    });

  }
  deleteData(String id) async{
    final abc = await myCollection.where('id',isEqualTo: id).getDocuments();
    await myCollection.document(abc.documents.first.documentID).delete().whenComplete((){
      print("da xoa");
    });

  }




  Stream<QuerySnapshot> getTreeList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}