//
//  Project3ChallengeView.swift
//  EX_100DaysOfSwiftUI
//
//  Created by ęšëě° on 2022/11/13.
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
                        Text("đ")
                    case .Paper:
                        Text("â")
                    case .Scissors:
                        Text("âď¸")
                    }
                    
                    Text("ę˛°ęłź: \(resultText)")
                }
                .onTapGesture {
                    reset()
                }
            }
            
            HStack {
                Button("đ") {
                    userSign = .Rock
                }
                .buttonStyle(ButtonSign())
                
                Button("â") {
                    userSign = .Paper
                }
                .buttonStyle(ButtonSign())
                
                Button("âď¸") {
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
            resultText = "ëšę˛źě!"
        case (.Rock, .Scissors):
            resultText = "ě§!"
        case (.Rock, .Paper):
            resultText = "ě´ęš!"
        case (.Scissors, .Rock):
            resultText = "ě´ęš!"
        case (.Scissors, .Scissors):
            resultText = "ëšę˛źě!"
        case (.Scissors, .Paper):
            resultText = "ě§!"
        case (.Paper, .Rock):
            resultText = "ě§!"
        case (.Paper, .Scissors):
            resultText = "ě´ęš!"
        case (.Paper, .Paper):
            resultText = "ëšę˛źě!"
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
