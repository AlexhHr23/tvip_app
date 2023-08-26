import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talachas_app/screens/cronometer_screen.dart';
import 'package:talachas_app/screens/start_screen.dart';

class WorkerScreen extends StatelessWidget {
   WorkerScreen({super.key});

 final List<dynamic> workers = [
    //water, title, background, color, hidratacion
    [20, 'Andres Herrera',     const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [10, 'Efrain Cruz', const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [30, 'Alonso Vazquez',      const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [30, 'Gus Barrera',    const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [15, 'Alejadro Lopez',    const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [45, 'Juan Rios',    const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [60, 'Sophia Garcia', const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],
    [35, 'Ryan Romero',     const Color.fromARGB(255, 36, 37, 38), const Color.fromARGB(255, 255, 255, 255),.3],];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16.0,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartScreen(),
                  ),
                );
           },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        actions: [_hour(context)],
      ),
      body: GridView.count(crossAxisCount: 2, children: [
      _oneCard(context, 0),
      _oneCard(context, 1),
      _oneCard(context, 2),
      _oneCard(context, 3),
      _oneCard(context, 4),
      _oneCard(context, 5),
      _oneCard(context, 6),
      _oneCard(context, 7),
    ]));  }



  Widget _oneCard(BuildContext context, int type){
    return GestureDetector(
           onTap: () {
            Navigator.push(
            context,
           MaterialPageRoute(
            builder: (context) => CronometerScreen(
              workerName: workers[type][1],
              minutes: workers[type][0],
      ),
    ),
  );
},

           child: Center(
             child: SizedBox(
               width: 100.0,
               //height: 60.0,
               child: 
                Card(
                  elevation: 10.0,
                  color: workers[type][2],
                  shape: RoundedRectangleBorder(
                      side:  BorderSide(
                        color: workers[type][2],
                      ),
                      borderRadius: BorderRadius.circular(10.0), 
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         const CircleAvatar(
                          backgroundColor: Colors.blue, // Color de fondo por defecto
                          radius: 20.0,
                          child: Icon(
                            Icons.person,// Icono de Flutter
                            size: 40.0, // Tamaño del icono
                            color: Colors.white, // Color del icono
                          ),
                        ),
                        Text(
                          '${workers[type][0]} min' ,
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: workers[type][3], 
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          workers[type][1],
                          style:  TextStyle(
                            color: workers[type][3],
                            fontSize: 10, 
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                  ),
                ),
                     // ),
               ),
        ),
    );
   }

  Widget _hour(BuildContext context){
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(
          DateFormat.Hm().format(DateTime.now()),
          style: Theme.of(context).textTheme.bodySmall,
          );
      },
    ); 
    
  }
}
