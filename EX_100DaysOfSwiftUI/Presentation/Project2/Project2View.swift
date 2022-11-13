//
//  Project2View.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/13.
//

import SwiftUI

struct Project2View: View {
    
    @State private var scroeTitle = ""
    @State private var showAlert = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var countires = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"
    ].shuffled()
    
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countires[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countires[number])
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .alert(scroeTitle, isPresented: $showAlert) {
            Button("continue", action: reset)
        } message: {
            Text("Scroe \(score)")
                .foregroundColor(.white)
                .font(.title.bold())
        }


    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scroeTitle = "Correct"
            score += 10
        } else {
            scroeTitle = "Wrong"
            score -= 10
        }
        
        showAlert = true
    }
    
    private func reset() {
        countires.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct Project2View_Previews: PreviewProvider {
    static var previews: some View {
        Project2View()
    }
}
