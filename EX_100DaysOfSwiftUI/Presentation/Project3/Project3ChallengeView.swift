//
//  Project3ChallengeView.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/13.
//

import SwiftUI

enum Sign: CaseIterable {
    case Rock
    case Paper
    case Scissors
}

struct Project3ChallengeView: View {
    @State var computerSign = Sign.allCases.randomElement()!
    @State var userSign: Sign!
    @State var resultText = ""
    
    var body: some View {
        VStack {
            
            if resultText != "" {
                HStack {

                    switch computerSign {
                    case .Rock:
                        Text("👊")
                    case .Paper:
                        Text("✋")
                    case .Scissors:
                        Text("✌️")
                    }
                    
                    Text("결과: \(resultText)")
                }
                .onTapGesture {
                    reset()
                }
            }
            
            HStack {
                Button("👊") {
                    userSign = .Rock
                }
                .buttonStyle(ButtonSign())
                
                Button("✋") {
                    userSign = .Paper
                }
                .buttonStyle(ButtonSign())
                
                Button("✌️") {
                    userSign = .Scissors
                }
                .buttonStyle(ButtonSign())
            }
        }
        .onChange(of: userSign) { newValue in
            guard userSign != nil else { return }
            result(computer: computerSign, user: userSign)
        }
    }
    
    private func reset() {
        userSign = nil
        computerSign = Sign.allCases.randomElement()!
        resultText = ""
    }
    
    private func result(computer: Sign, user: Sign) {
        switch (computer, user) {
        case (.Rock, .Rock):
            resultText = "비겼음!"
        case (.Rock, .Scissors):
            resultText = "짐!"
        case (.Rock, .Paper):
            resultText = "이김!"
        case (.Scissors, .Rock):
            resultText = "이김!"
        case (.Scissors, .Scissors):
            resultText = "비겼음!"
        case (.Scissors, .Paper):
            resultText = "짐!"
        case (.Paper, .Rock):
            resultText = "짐!"
        case (.Paper, .Scissors):
            resultText = "이김!"
        case (.Paper, .Paper):
            resultText = "비겼음!"
        }
    }
}

struct ButtonSign: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct Project3CallenageView_Previews: PreviewProvider {
    static var previews: some View {
        Project3ChallengeView()
    }
}
