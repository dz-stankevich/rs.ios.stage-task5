import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        
        var muteblPrices = prices
        var secondArray: [Int] = []
        
        var result: Int = 0
        
        if prices.count == 0 {
            return 0
        }
        
        result = test(array: &muteblPrices)
        
        for value in muteblPrices {
            if value != 0 {
                secondArray.append(value)
            }
        }
       
        if secondArray.count > 1 {
            result += test(array: &secondArray)
        }
       

        return result
    }
    
    func test( array: inout [Int]) -> Int {
        
        var maxPrice = array.max()!
        var indexOfMax = array.lastIndex(of: maxPrice) ?? 0
        
        var arrayPrice: [Int] = []
        var funcResult: Int = 0
        
        
        print("Индекс максимального - \(indexOfMax)")
        print("Максимальное значение - \(maxPrice)")
        
        
        if indexOfMax == 0 {
            array[indexOfMax] = 0
            return 0
            
        }
        
        
        for (index, value) in array.enumerated() {
            if (index < indexOfMax && value < maxPrice) {
                arrayPrice.append(value)
                array[index] = 0
            }
        }
        
        array[indexOfMax] = 0
        
        print("Массив покупок - \(arrayPrice)")
        
        for value in arrayPrice {
            funcResult += maxPrice - value
        }
        
        
        return funcResult
    }
    
}
