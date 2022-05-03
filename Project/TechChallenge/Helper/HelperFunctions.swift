
import Foundation
import SwiftUI

class HelperFunctions{
    
    static func returnPrice(categoryName:String,transactions:[Int:TransactionModel]) -> String{
        var priceArray = [Int]()
        for item in transactions {
            if item.value.category.rawValue == categoryName{
                priceArray.append(Int(item.value.amount))
            }
        }
        let priceTotalValue =  priceArray.reduce(0, +)
        return "$\(priceTotalValue)"
    }
    
    static func calculateTotalAmountSpentInCategory(category:String,transactions:[TransactionModel])-> String{
        var amountList = [Double]()
        let transationsOfSelectedCategory  = transactions.filter { transactionItem  in
            transactionItem.category.rawValue == category
        }
        
        for item in transationsOfSelectedCategory{
            amountList.append(item.amount)
        }
        return addSomeOfArray(array: amountList)
    }
    
    static func calculateTotalOfAllTransactions(transactionAmounts:[TransactionModel]) -> String{
        var amountSpentArray = [Double]()
        for item in transactionAmounts{
            amountSpentArray.append(item.amount)
        }
        return addSomeOfArray(array: amountSpentArray)
    }
    
    static func filterTransactionsAccordingToCategory(categoryName:String,transactions:[TransactionModel]) -> [TransactionModel]{
        
        let filteredCategoryName = transactions.filter { category in
            category.category.rawValue == categoryName
        }
        return filteredCategoryName
        
    }
    
    private  static func addSomeOfArray(array:[Double])-> String {
        let totalAmountSpoent = array.reduce(0, +)
        let roundUpAmount = String(format: "%.2f", totalAmountSpoent)
        return roundUpAmount
    }
}
