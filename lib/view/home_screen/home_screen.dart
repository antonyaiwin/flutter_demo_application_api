import 'package:flutter/material.dart';
import 'package:flutter_application_api/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenController>().convertToModel();
    context.read<HomeScreenController>().getData();
    return Scaffold(
      body: Center(
        child: Consumer<HomeScreenController>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const CircularProgressIndicator();
            } else if (value.responseModel == null) {
              return const Text('No data found');
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                var data = value.responseModel!.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data.avatar),
                  ),
                  title: Text('${data.firstName} ${data.lastName}'),
                  subtitle: Text(data.email),
                );
              },
              itemCount: value.responseModel?.data.length,
            );

            // Column(
            //   children: [
            //     // Text('Name : ${data.name}'),
            //     // Text('place : ${data.place}'),
            //     // Text('age : ${data.age}'),
            //     // Text('PhNo : ${data.ph}'),
            //     // Text('Batch : ${data.batch}'),
            //     // const SizedBox(height: 25),
            //     Text('id : ${data.id}'),
            //     Text('firstName : ${data.firstName}'),
            //     Text('lastName : ${data.lastName}'),
            //     Text('email : ${data.email}'),
            //     CircleAvatar(
            //       backgroundImage: NetworkImage(data.avatar),
            //     ),
            //     const SizedBox(height: 25),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
