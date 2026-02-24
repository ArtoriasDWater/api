import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';
import '../widgets/user_card.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final ApiService apiService = ApiService();
  late Future<List<User>> userList;

  @override
  void initState() {
    super.initState();
    userList = apiService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuarios Profesionales')),
      body: FutureBuilder<List<User>>(
        future: userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(AppConstants.serverError));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return UserCard(
                  user: snapshot.data![index],
                  onTap: () {
                    print('Click en: ${snapshot.data![index].name}');
                  },
                );
              },
            );
          }
          return Center(child: Text('No hay datos disponibles'));
        },
      ),
    );
  }
}
