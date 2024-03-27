import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/rendering.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";

void main(){
  runApp( const MaterialApp( home:MyApp() ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: Column(

//       children: [

//         Expanded(child: Container(color: Colors.yellow,)),

//         Expanded(child: Row (children: [Expanded(child: Container(color: Colors.red,)),Expanded(child: Container(color: Colors.blue,))],)),
        
//         Expanded(child: Container(color: Colors.black,))
        
//         ],
//       ),
//       );
//   }
// }






// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
// import "package:flutter/widgets.dart";

// void main(){

//   runApp(MaterialApp(home:myapp()));
// }

// class myapp extends StatelessWidget {
//   const myapp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Column(
        
//         children: [Expanded(child: (Container())),Container(),Ex(child: Row())],),
       
//     );
//   }
// }




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
  
}

class _MyWidgetState extends State<MyApp> {

TextEditingController weightTEC = TextEditingController(); // text editing controller for weight text field so we can save the input of it

  double sliderValue = 140 ; // the initial value of the slider
  String weightValue="1"; // the initial weight value
  String BmiValue = "";
  bool isVisible =false ;

  
  //Colors :
  Color male_Color = const Color.fromARGB(255, 6, 124, 234);
  Color female_color = const Color.fromARGB(255, 209, 23, 138);
  Color container_Colors =const Color.fromARGB(255, 151, 138, 179);// the main theem of the application
  Color male_box_color= const Color.fromARGB(255, 151, 138, 179); // the initial color of male_box_color
  Color female_box_color= const Color.fromARGB(255, 151, 138, 179); // the initial color of female_box_color
  Color slider_color = const Color.fromRGBO(33, 150, 243, 1); // the initial color of the slider







  @override
  Widget build(BuildContext context) {


     return Scaffold(


      appBar: AppBar(
        
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 54, 23, 116),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 35,
            color: Color.fromARGB(238, 218, 180, 231)
            
            
          ),
          
        ),
      ),


      body: Container( //  container of everything (general container)
        decoration: const BoxDecoration(
          
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 38, 3, 44),
              Color.fromARGB(255, 110, 37, 128),
              Color.fromARGB(66, 190, 141, 216),
            ],
            stops: [0.2, 0.4, 1],
            begin: Alignment.topRight,
            end:Alignment.bottomLeft
          )
          
        ),
        
        child: Column(
          
          
        
        
          children: [ // children of the generral container
          
          const SizedBox(height: 20),

//----------------------------------------------------------------------------------------
                                          //Container 1

          Container( // first chiled of the general container , (will have two icons and three texts , slider , text field)

            decoration: BoxDecoration( // box decoration of the first container
              borderRadius: BorderRadius.circular(20),
              color: container_Colors
            ),
            margin: const EdgeInsets.all(10),
            

            child: Column(
            
        
            children: [ // children of the first container
              
              Row( // first row will have two icons
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
        
                  
                Container( // container of first icon 1   
                  margin: const EdgeInsets.all(10),

                  decoration: BoxDecoration( // the decoration of the container around the icon 1
                    color: male_box_color,
                    borderRadius: BorderRadius.circular(30)
                    ),

                  child: IconButton( // icon 1
                    icon: const Icon( Icons.male ), 
                        iconSize: 60,
                        color: const Color.fromARGB(255, 6, 124, 234),
                  
                        onPressed: () { // when we press on the icon the theem will change
                          setState(() {
                            male_box_color= const Color.fromARGB(255, 200, 234, 236) ; 
                            female_box_color=container_Colors; 
                            slider_color=const Color.fromRGBO(33, 150, 243, 1);
                          });
                        },
                  ),
                ),

                const SizedBox(width: 50,height: 70,), // to make space between the two icons

                     
                Container( // container of second icon 2  
                  margin: const EdgeInsets.all(10),
                  
                  decoration: BoxDecoration( // the decoration of the container around the icon 2
                    color: female_box_color,
                    borderRadius: BorderRadius.circular(30)
                    ),

                  child: IconButton( // icon 2
                    icon: const Icon( Icons.female ), 
                        iconSize: 60,
                        color: const Color.fromARGB(255, 234, 6, 192),
                  
                        onPressed: () {
                          setState(() {
                            female_box_color= const Color.fromARGB(255, 234, 189, 235) ; 
                            male_box_color=container_Colors; 
                            slider_color= Colors.red;
                          });
                        },
                  ),
                ),
        
              ],), //End of the first row

                
              const Row(   //second row will have two texts (male , female) texts

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                Text( //text1

                    "male",
                    style: TextStyle( //style of text 1
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                    
                    ),

                    SizedBox(width: 80,height: 30,), // to make space between the two Texts

                Text( //text2

                    "female",
                    style: TextStyle( //style of text 2
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                    
                    ),

                
              ],), //End of the second row

              const SizedBox(height: 20,),
              const Text( // Hight text (will appeare above the slider)

                " Choose your hight",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),


              ),
              Slider( // add the slider to the first container so the user can choose his hight

                value: sliderValue,
                max:210 ,
                min: 140,
                divisions: 70, // so we can move 1 cm (210-140=70)
                label: "${sliderValue.round()} cm", // the lable will apper while changing the hight
                activeColor: slider_color,
                inactiveColor: const Color.fromARGB(255, 250, 174, 174),

                onChanged: (double value){ // when we change the value of the slider we have to update the slider value (which we initilize at the begining)
                  setState(() {
                     sliderValue= value ; // update the value of the slider value variable
                  });
                    
                  },
                  
                  
              ), //End of hight slider

                  const Text(
                    "Weight" ,

                    style: TextStyle(

                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 10,), // distance between the text field and the text

                  
                    Container( // text field container
                      width: 300,

                      child: TextField( // this text field is to ask the user to enter his weight
                       
                        textAlign: TextAlign.center,
                        controller: weightTEC, // so we can track and get what user typed in weight field , the input inside the fieled will be saved here
                        
                        keyboardType: TextInputType.number, // to make the kayboard type only numbers

                        inputFormatters: <TextInputFormatter>[ // i used ymal package to prevent the user from entering non-digits charectars
                        FilteringTextInputFormatter.digitsOnly,
                          ],

                        decoration: InputDecoration(
                      
                          hintText: "Enter yor weight", // hint text
                          filled: true, // to make the text field filled with color
                          fillColor: Colors.white70,

                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                          ),

                          suffixIcon: IconButton( // we will add suffix icon to clear the text field

                            icon: const Icon(Icons.clear),
                            onPressed: (){

                              setState(() {
                                weightTEC.clear();
                              });
                            },
                          )
                          
                          ), //End of decoration of the text field

                       
                    ),), //End of text field
                   
                  
              const SizedBox(height: 20,) // to make distance between the edge and the text field

            ],//End of the children of the first container
        
          ),), // End of the first container
          
          //----------------------------------------------------------------------------------------
                                            //Button

          TextButton.icon( // second chiled of the general container

            style: TextButton.styleFrom( // to style the button
              iconColor: const Color.fromARGB(255, 204, 0, 0),
              backgroundColor:  const Color.fromARGB(255, 32, 5, 82),
            ),

            icon: const Icon(

              Icons.sports_handball,
              size: 40,
              
              ),

            label: const Text(
              "Calculate BMI",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 175, 155, 210),
                fontWeight: FontWeight.bold
              ),
              
              ),

            onPressed:(){ // when we press on the button.....

              weightValue = weightTEC.text  ; // update the value of the weight by taking it from weight text field
              BmiValue=calulateBMI(double.parse(weightValue) , sliderValue); // find the BMI and save it in the BmiValue string by using the provided function
              setState(() {
                isVisible = true ; // to make the second container appear
              });

            },
            
          ), // End of the button



            const SizedBox(height: 10,),
          //----------------------------------------------------------------------------------------
                                                    //Container 2

             Visibility(
              visible: isVisible, // the statues of visibility

               child: Container( // Theird child of the general container (second main containar), will have the output BMI
                           
                decoration: BoxDecoration( // box decoration of the first container
                  borderRadius: BorderRadius.circular(20),
                  color: container_Colors
                ),
                margin: const EdgeInsets.all(10),
                           
                           
                child: Column(
                           
                    children: [ // children of the second container 
                      
                    const Center( 
                      child: Text( //ch1
                        "Your BMI",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        
                        
                        ),
                    )
                   ,
                   const Icon( //ch2 , this icon will refferto the BMI text field
                    Icons.arrow_downward,
                    size: 70,
                    color: Colors.white,
                   ),

                   const SizedBox(height: 15,), 
                           
                    Container( // text field container , ch3
                      width: 300,
                      child: TextField(
                      
                          enabled: false, // so the user can not write in the text field

                          decoration:InputDecoration( // decoration of the text field
                      
                            filled: true,
                            fillColor: Colors.white,
               
                            label: Center(
                            child: Text(
                                
                                BmiValue,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                  
                                ),
                                
                                ),
                            ),
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                    
               
                          ),
               
                        
                      ),

                    ),
                    
                    IconButton( // icon button to remove the second container from the screen   , ch3
                
                      
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.red,
                        size: 30,
                      ),

                      onPressed: () {
                        setState(() {
                          isVisible=false;
                        });
                      },
                    ),
                    
                    
                    
                    ] // End of the children of the second container,
                           
                ),
                           
              ),//End of the second container
             ), 
          
            //--------------------------------------------------------------------------------------
        
          
          ],//End of childrens of the general container
        
        
        
        
        ),
      ) 


    );

  }

  String calulateBMI(double weight , double hight){ // function to calculate the BMI

    double bmi ; 
    bmi = (weight)/( ( hight*0.01)*( hight*0.01) ) ;
    

    return  bmi.toStringAsFixed(2) ; // to round the value to 2 decimals and return it as string
  }




}