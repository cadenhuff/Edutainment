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
    
    @State private var table =  5
    @State private var numOfTurns = 0
    @State private var questions = [Question]()
    @State private var questionNumber = 0
    @State private var answer = ""
    @State private var gameRunning = false
    @State private var gameOver = false
    @State private var score = 0
    var body: some View {
    
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
                if gameRunning == true{
                    HStack{
                        TextField("\(questions[questionNumber].x) * \(questions[questionNumber].y) = ?", text: $answer)
                        
                        Button("Submit!"){
                            checkAnswer()
                        }
                    }
                }
                Spacer()
                Spacer()
                Text("\(score)")
                Button("Start!"){
                    startGame(turns: numOfTurns)
                    
                }
                

            }
            .padding()
        }
        .alert("Game Over", isPresented: $gameOver ){
            Button("Restart", action:restartGame)
        }message: {
            Text("Total score is \(score). Would you like to play again?")
        }
}

    
        


    func startGame(turns:Int){
        
        for _ in 1...turns{
            let question = Question(x: Int.random(in: 1...table), y: Int.random(in:1...table))
            questions.append(question)
        }
        questionNumber = Int.random(in: 0..<turns)
        gameRunning = true
    }
    func checkAnswer(){
        if answer == String(questions[questionNumber].xy){
            score += 1
            nextTurn()
        }else{
            nextTurn()
        }
    }
    func nextTurn(){
        questions.remove(at: questionNumber)
        if questions.count == 0{
            gameRunning = false
            gameOver = true
            return
        }
        questionNumber = Int.random(in: 0..<questions.count)
        answer = ""

    }
    
    func restartGame(){
        table =  5
        numOfTurns = 0
        questions = [Question(x: 5, y: 4)]
        questionNumber = 0
        answer = ""
        gameRunning = false
        score = 0
    }

    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
