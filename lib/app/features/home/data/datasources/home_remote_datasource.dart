class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getData() async {
    //retrieve data from remote source
    return Future.value({'message': 'Loaded data from remote source'});
  }
}
