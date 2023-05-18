import 'package:api_pizza/pizza_model.dart';
import 'package:flutter/material.dart';
class PizzaScreen extends StatefulWidget {
  PizzaScreen({Key? key}) : super(key: key);

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  // loadPizza() async {
  //   final results = await PizzaService().getRecipe();
  //   print(results.length);
  //   results.forEach((element) {
  //     print(element.title);
  //   });
  // }
  Future<List<Recipes>>? futurePizza;
  @override
  void initState(){
    super.initState();
    //futurePizza = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: FutureBuilder<List<Recipes>>(
    future: futurePizza,
      builder: ((context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return ListView.separated(itemBuilder: (context, index) {
            Recipes recipe = snapshot.data?[index];
            return ListTile(
              title: Text('${recipe.title}'),
            );
          }, separatorBuilder: ((context, index){
            return const Divider(color: Colors.black,);
          }),
              itemCount: snapshot.data!.length);
        } else if(snapshot.hasError){
          return Text("ERROR: ${snapshot.error}");
        }
        return CircularProgressIndicator();
      }),
  ),
)
    );
  }
}
