//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionView: View {
    @State var transaction: TransactionModel
    @EnvironmentObject var modelData:ModelData
    @State private var collapsed: Bool = false
    var body: some View {
        
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Image(systemName: self.collapsed ? "pin.slash.fill" : "pin.fill")
            }
            if collapsed == false{
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                }
            } else{EmptyView()}
        }.onTapGesture {
            if modelData.pinnedTransactions[transaction.id] != nil {
                modelData.pinnedTransactions.removeValue(forKey: transaction.id)
            }
            else {
                modelData.pinnedTransactions.updateValue(transaction, forKey: transaction.id)
            }
            collapsed.toggle()
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0])
            TransactionView(transaction: ModelData.sampleTransactions[1])
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
