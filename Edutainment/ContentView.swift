//
//  ContentView.swift
//  Edutainment
//
//  Created by Caden Huffman on 7/23/23.
//

import SwiftUI


struct ContentView: View {
    struct Question{
        var x: Int
        var y: Int
        var xy: Int
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
            self.xy = x*y
        }
        
    }
    @State private var test = "awdf"
    @State private var table =  5
    @State private var numOfTurns = 5
    @State private var questions = [Question]()
    @State private var gameRunning = false
    @State private var score = 0
    var body: some View {
        if gameRunning == false{
            NavigationView{
                VStack {
                    Stepper("Up to \(table) times table", value: $table, in: 2...12, step: 1)
                    Spacer()
                    
                    HStack{
                        Button("5"){numOfTurns = 5}
                            .font(numOfTurns == 5 ? .title : .body)
                        Button("10"){numOfTurns = 10}
                            .font(numOfTurns == 10 ? .title : .body)
                        Button("20"){numOfTurns = 20}
                            .font(numOfTurns == 20 ? .title : .body)
                            
                      
                    }
                    Spacer()
                    Spacer()
                    Button("Start!"){
                        startGame(turns: numOfTurns)
                    }
                    

                }
                .padding()
            }
        }
        else{
            NavigationView{
                VStack{
                    Text("hello")
                    
                    Button("go back"){gameRunning = false}
                    
                    TextField("amount", text: $test)
                }
            }
        }

        
    }
    
    func startGame(turns:Int){
        
        for _ in 1...turns{
            let question = Question(x: Int.random(in: 1...table), y: Int.random(in:1...table))
            questions.append(question)
        }
        gameRunning = true
    }
    func pickQuestion(){
        print("hi")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
