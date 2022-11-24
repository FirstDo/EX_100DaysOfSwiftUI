//
//  Project7View.swift
//  EX_100DaysOfSwiftUI
//
//  Created by 김도연 on 2022/11/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

final class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let data = try! JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: "Items")
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
            self.items = decodedItems
        } else {
            items = []
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct Project7View: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        List {
            ForEach(expenses.items) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    Text(item.amount, format: .currency(code: "USD"))
                }
            }
            .onDelete(perform: expenses.removeItems)
        }
        .navigationTitle("iExpense")
        .toolbar {
            Button {
                showingAddExpense = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

struct Project7View_Previews: PreviewProvider {
    static var previews: some View {
        Project7View()
    }
}
