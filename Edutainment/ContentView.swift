//
//  ContentView.swift
//  Edutainment
//
//  Created by Caden Huffman on 7/23/23.
//

import SwiftUI
struct settingsView: View{
    @State private var table = 2
    @State private var numOfTurns = 5
    var body: some View{
        NavigationView{
            VStack {
                Spacer()
                Stepper("\(table) times table", value: $table, in: 2...12, step: 1)
                Spacer()
                
                HStack{
                    Button("5"){numOfTurns = 5}
                    Button("10"){numOfTurns = 10}
                    Button("20"){numOfTurns = 20}
                }
                Spacer()
                Spacer()
                Button("Start!"){}
            }
            .padding()
        }
    }
    
    
}

struct Question{
    var question:String
    var answer:Int
    
    
}
struct ContentView: View {
    @State private var table = 5
    @State private var numOfTurns = 5
    @State private var gameStart = false
    var questions: [Question]{
        var questionsArray = [Question]()

        for _ in 1...numOfTurns{
            var x = Int.random(in: 2...table)
            var y = Int.random(in: 0...12)
            questionsArray.append(Question(question: "\(x) * \(y) = ?", answer: x*y ))
        }
        return questionsArray
    }
    var body: some View {
        if gameStart == false{
            NavigationView{
                VStack {

                    Text(questions[1].answer.formatted())
                    Spacer()
                    Stepper("Up to \(table) times table", value: $table, in: 2...12, step: 1)
                    Spacer()
                    
                    HStack{
                        Button("5"){numOfTurns = 5}
                        Button("10"){numOfTurns = 10}
                        Button("20"){numOfTurns = 20}
                      
                    }
                    Spacer()
                    Spacer()
                    Button("Start!"){}

                }
                .padding()
            }
        }
        if gameStart == true{
            Text("hey")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
