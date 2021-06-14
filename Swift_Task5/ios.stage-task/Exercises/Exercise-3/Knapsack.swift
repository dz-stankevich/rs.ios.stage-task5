import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    
    func findMaxKilometres() -> Int {
        //инициализируем таблицу, где будем хранить решения для еды
        var foodArray = Array(repeating: Array(repeating: 0, count: maxWeight+1), count: foods.count+1)
        
        for i in 0...foods.count {
            
            for j in 0...maxWeight {
                //Устанавливаем 0 для элементов первой строки
                if i == 0 && j == 0 {
                    
                    foodArray[i][j] = 0
                    
                } else if i != 0 && j != 0 {
                    
                        if foods[i-1].weight <= j {
                            //если вес ранее рассмотренного объекта меньше или равен текущему максимуму, мы устанавливаем значение как максимум между значением предыдущего объекта плюс значение, связанное с весом в таблице, которое соответствует разнице между текущим максимумом и предыдущим весом.
                            
                            foodArray[i][j] = max(foodArray[i-1][j], foods[i-1].value + foodArray[i-1][j - foods[i - 1].weight])
                            
                        } else {
                            //иначе мы устанавливаем текущее значение в предыдущее значение
                            foodArray[i][j] = foodArray[i - 1][j]
                            
                            }
                        }

                
                
            }
        }
        
        //инициализируем таблицу, где будем хранить решения для напитков
        var drinkArray = Array(repeating: Array(repeating: 0, count: maxWeight+1), count: drinks.count+1)
        
        for i in 0...drinks.count {
            
            for j in 0...maxWeight {
                
                if  i == 0 && j == 0 {
                    
                    drinkArray[i][j] = 0
                }
                else if i != 0 && j != 0 {
                    
                            if drinks[i-1].weight <= j {
                                //если вес ранее рассмотренного объекта меньше или равен текущему максимуму, мы устанавливаем значение как максимум между значением предыдущего объекта плюс значение, связанное с весом в таблице, которое соответствует разнице между текущим максимумом и предыдущим весом.
                                let drink1 = drinkArray[i-1][j]
                                let drink2 = drinks[i-1].value + drinkArray[i-1][j - drinks[i - 1].weight]
                                
                                drinkArray[i][j] = max(drink1, drink2)
                                
                            } else {
                                //иначе мы устанавливаем текущее значение в предыдущее значение
                                drinkArray[i][j] = drinkArray[i - 1][j]
                                
                            }
                        }
                
                
            }
        }
        
        
        var distatance = 0

        for i in 0...maxWeight {
            
            let minFood = foodArray[foods.count][i]
            let minDrink = drinkArray[drinks.count][maxWeight-i]
            let minVar = min(minFood, minDrink)
            
            distatance = max(distatance, minVar)
        }
        
        return distatance
    }
    

}
