//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    let transaction =  TransactionModel.Category.allCases
    @State var totalPriceOfTransacttion = "472.08"
    @State var transactions: [TransactionModel] = ModelData.sampleTransactions
    @State var currentCategoryName = "all"
    @State var currentCategoryColor = Color.black
    
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    Button {
                        self.transactions = ModelData.sampleTransactions
                        self.totalPriceOfTransacttion = HelperFunctions.calculateTotalOfAllTransactions(transactionAmounts: transactions)
                        self.currentCategoryName = "all"
                    } label: {
                        Text("all").fontWeight(.bold).padding().background(Color.black).foregroundColor(.white).font(.title2)
                        
                    }.clipShape(Capsule())
                        .foregroundColor(.white)
                    
                    ForEach(transaction) {transaction in
                        Button(action: {
                            self.transactions = ModelData.sampleTransactions
                            self.transactions = HelperFunctions.filterTransactionsAccordingToCategory(categoryName: transaction.rawValue, transactions: transactions)
                            self.totalPriceOfTransacttion = HelperFunctions.calculateTotalAmountSpentInCategory(category: transaction.rawValue, transactions: transactions)
                            self.currentCategoryName = transaction.rawValue
                            self.currentCategoryColor = transaction.color
                        }){
                            Text(transaction.rawValue).fontWeight(.bold).padding().background(transaction.color).foregroundColor(.white).font(.title2)
                        }
                        .clipShape(Capsule())
                    }
                }
            }
            .padding()
            .background(Color.black.opacity(0.8))
            ZStack(alignment: .bottom){
                
                List {
                    ForEach(transactions) { transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .animation(.easeIn)
                .listStyle(PlainListStyle())
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Transactions")
                HStack {
                    Text("Total spent:").fontWeight(.regular).secondary().padding()
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(currentCategoryName)
                            .font(.headline).foregroundColor(currentCategoryColor)
                        Text("$\(totalPriceOfTransacttion)").fontWeight(.bold)
                            .secondary()
                        
                    }.padding()
                }
                .frame(width:400, height: 80)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius:8.0)
                        .stroke(Color.black, lineWidth: 2.0)
                )
            }
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
