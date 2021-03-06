import 'package:flutter/material.dart'; 

class Todolist extends StatefulWidget{
  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> { 
  bool isComplet = false; // just for now 
  TextEditingController todoTitleController = TextEditingController();
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
   body: SafeArea( 
    child: Padding( 
      padding: EdgeInsets.all(25),
          child: Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("All todos", style: TextStyle(
        fontSize: 30, 
        color: Colors.white,
        fontWeight: FontWeight.bold)
        ,),
        Divider(),
        SizedBox(height: 20), 
        ListView.separated( 
          separatorBuilder: (context,index)=> Divider(color: Colors.grey[800]),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index) {
         return Dismissible( 
           key: Key(index.toString()), 
           background: Container(padding: EdgeInsets.only(left:20),
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete), 
            color: Colors.red,
            ),
           onDismissed: (direction){ 
             print("removed");
             //
           },
        child: ListTile( 
             onTap: () {
               setState(() {
                 // ignore: unnecessary_statements
                 isComplet = !isComplet;
               });
             },
             leading: Container( 
               padding: EdgeInsets.all(2),
               height: 30, 
               width: 30,
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 shape: BoxShape.circle
               ),
               child:isComplet? Icon(
                 Icons.check,
               color: Colors.white,
               ): Container(),
             ),
             title: Text("Todo title", 
             style: TextStyle(
               fontSize: 20, 
               color: Colors.grey[200],
               fontWeight: FontWeight.w600,
             ), 
             ),
           ),
         );
        },
        )
      ],
      ),
    ),
    ),  
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,  
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add), 
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        showDialog(builder: (context) => SimpleDialog(  
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          title: Row(
            children: [
              Text("Add Todo", 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white,
                ),
                ), 
              Spacer(), 
              IconButton(icon: Icon(
                Icons.cancel,
                color: Colors.grey, 
                size: 30,
                ),
               onPressed: () => Navigator.pop(context),

               )
            ]
          ), 
          children: [ 
            Divider(), 
            TextFormField( 
              controller: todoTitleController,
              style: TextStyle(
                fontSize: 18, 
                height: 1.5,
                color: Colors.white,

              ), 
              autofocus: true,
              decoration: InputDecoration(
                hintText: "eg. exercise", 
                 hintStyle: TextStyle(color: Colors.white70), 
                 border: InputBorder.none,
                 ),
            ), 
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50, 
              // ignore: deprecated_member_use
              child: FlatButton( 
                shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text("Add"), 
                color: Theme.of(context).primaryColor, 
                textColor: Colors.white, 
                onPressed: () {
                  if(todoTitleController.text.isNotEmpty){
                    print(todoTitleController.text);
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ), context: context
        );
      }, 
    ),
    );
  }
}