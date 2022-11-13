//
//  Project5View.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/13.
//

import SwiftUI

struct Project5View: View {
    @State private var userdWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        List {
            Section {
                TextField("Enter your word", text: $newWord)
                    .textInputAutocapitalization(.never)
            }
            
            Section {
                ForEach(userdWords, id: \.self) { word in
                    HStack {
                        Image(systemName: "\(word.count).circle")
                        Text(word)
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word form `\(rootWord)`!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            userdWords.insert(answer, at: 0)
            newWord = ""
        }
    }
    
    private func startGame() {
        let url = Bundle.main.url(forResource: "start", withExtension: "txt")!
        let startWords = try! String(contentsOf: url)
        let allWords = startWords.components(separatedBy: "\n")
        rootWord = allWords.randomElement() ?? "silkorm"
    }
    
    private func isOriginal(word: String) -> Bool {
        !userdWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showAlert = true
    }
}

struct Project5View_Previews: PreviewProvider {
    static var previews: some View {
        Project5View()
    }
}
