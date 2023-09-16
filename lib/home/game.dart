import 'package:flutter/material.dart';
class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}
class _GameState extends State<Game> {
  bool oTurn=true;
  List<String> display = ['','','','','','','','',''];
  String resultDic='';
  int oScore=0;
  int xScore=0;
  int fillBox=0;

  void tapped(int index){
    setState(() {
      if(oTurn&& display[index]=='') {
        if(ret){
          display[index]='';
        }else {
          display[index] = 'O';
          fillBox++;
        }
      }else if(!oTurn&& display[index]==''){
        if(ret){
          display[index]='';
        }else{
        display[index]='X';
        fillBox++;
        }
      }
      oTurn=!oTurn;
      checkWinner();
      }
    );
  }
  void updateScore(String Winner){
    if(Winner=='O'){
      oScore++;
    }else if(Winner=='X'){
      xScore++;
    }
  }
  bool ret = false;
  bool checkWinner(){
    // bool ret = false;
    if(display[0]!=''&&display[0]==display[1]&&display[0]==display[2]){
      setState(() {
        resultDic='Players '+display[0]+' Wins';
      });
      updateScore(display[0]);
      ret=true;
    }
    if(display[3]!=''&&display[4]==display[3]&&display[3]==display[5]){
      setState(() {
        resultDic='Players '+display[3]+' Wins';
      });
      updateScore(display[3]);
      ret=true;
    }
    if(display[6]!=''&&display[7]==display[8]&&display[6]==display[7]){
      setState(() {
        resultDic='Players '+display[7]+' Wins';
      });
      updateScore(display[7]);
      ret=true;

    }
    if(display[1]!=''&&display[4]==display[1]&&display[4]==display[7]){
      setState(() {
        resultDic='Players '+display[7]+' Wins';
      });
      updateScore(display[7]);
      ret=true;
    }
    if(display[8]!=''&&display[8]==display[5]&&display[5]==display[2]){
      setState(() {
        resultDic='Players '+display[2]+' Wins';
      });
      updateScore(display[2]);
      ret=true;
    }
    if(display[0]!=''&&display[0]==display[3]&&display[0]==display[6]){
      setState(() {
        resultDic='Players '+display[0]+' Wins';
      });
      updateScore(display[0]);
      ret=true;
    }
    if(display[4]!=''&&display[4]==display[2]&&display[4]==display[6]){
      setState(() {
        resultDic='--Players '+display[4]+' Wins--';
      });
      updateScore(display[2]);
      ret=true;
    }
    if(display[0]!=''&&display[0]==display[4]&&display[0]==display[8]){
      setState(() {
        resultDic='--Players '+display[0]+' Wins--';
      });
      updateScore(display[0]);
      ret=true;
    }
    if(!ret&&fillBox==9){
      setState(() {
        resultDic='---DRAW---';
      });
    }
    return ret;
  }
  void ClearBoard(){
    setState(() {
      for(int i=0;i<9;i++){
        display[i]='';
      }
      resultDic='';
      fillBox=0;
      ret=false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      // body: Center(child: Text('Tic-Tac-Toe',style: TextStyle(
      //     fontSize: 40, color: Colors.green, fontWeight: FontWeight.bold),
      // )),
      body:Padding(
        padding: const EdgeInsets.all(10),
      child:Column(children: [
        // Expanded(child:
        // Container( padding: EdgeInsets.all(20),child: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text('TIC_TAC_TOE',style:TextStyle(fontSize: 30,color:Colors.brown,fontWeight: FontWeight.bold ),),
        //   ],
        // )),),
        Expanded(flex: 1,
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Player O',style:TextStyle(fontSize: 30,color:Colors.brown,fontWeight: FontWeight.bold ) ,),
                        Text(oScore.toString(),style: TextStyle(fontSize: 25,color:Colors.brown,fontWeight: FontWeight.bold ),),
                      ],
                    ),
                    SizedBox(width:35,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Player X',style:TextStyle(fontSize: 30,color:Colors.brown,fontWeight: FontWeight.bold ) ,),
                        Text(xScore.toString(),style: TextStyle(fontSize: 25,color:Colors.brown,fontWeight: FontWeight.bold ),),
                      ],
                    )
                  ],
                )
            )
        ),
        Expanded(flex: 3,
          child:GridView.builder(itemCount: 9,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                onTap: (){
                  tapped(index);
                },
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                width: 6,color:Colors.amberAccent),
                color: Colors.deepPurple,
                ),
                child:Center(
                    child: Text(display[index],
                        style: TextStyle(fontSize: 70,color: Colors.red,fontWeight: FontWeight.bold)
                    )
                 ),
                ),
              );
            },
          ),
        ),
        Expanded(flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(resultDic,
                    style: TextStyle(fontSize: 30,color:Colors.brown,fontWeight: FontWeight.bold ),
                    ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32)),
                          onPressed: (){
                        ClearBoard();
                      }, child:Text('Play Again') ),
                      SizedBox(width: 20,),
                  ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32)),
                      onPressed: (){
                        ClearBoard();
                        oScore=0;xScore=0;
                      }, child:Text('Reset') ),
                ],
              ),
              ],
              ),
            )
          ),
        ],
      ),
    ),
    );
  }

}