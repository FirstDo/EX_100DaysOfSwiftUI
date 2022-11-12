//
//  Project1View.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/12.
//

import SwiftUI

struct Project1View: View {
    
    @State private var checkAmount = 500.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var isActive: Bool
    
    private let tipPercentages = (0...100).map { $0 }
    
    private var total: Double {
        checkAmount + checkAmount * Double(tipPercentage) / 100
    }
    
    private var currency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: "USD")
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        Form {
            Section {
                TextField(
                    "Amount",
                    value: $checkAmount,
                    format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
                .focused($isActive)
                .keyboardType(.decimalPad)
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.wheel)
            } header: {
                Text("How much tip do you want to leave?")
            }
            
            Section {
                Text(total, format: currency)
            } header: {
                Text("Total Value")
            }

            Section {
                Text(totalPerPerson, format: currency)
            } header: {
                Text("Amount per person")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    isActive = false
                }
            }
        }
        .navigationTitle("WeSplit")
    }
}

struct Project1View_Previews: PreviewProvider {
    static var previews: some View {
        Project1View()
    }
}
