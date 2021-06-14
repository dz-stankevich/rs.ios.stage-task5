import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var inputMytebleMessage = message
        var result: String = ""
        
        print("Сообщение до цикла - \(inputMytebleMessage)")
        
        while inputMytebleMessage.count > 0 {
            
            var partOfMessage = String(inputMytebleMessage.prefix(while: {$0 != "["}))
            
            if let repeater = Int(partOfMessage) {
                
                print("Число повторов - \(repeater)")
                
                let firstRange = inputMytebleMessage.range(of: partOfMessage)
                inputMytebleMessage = inputMytebleMessage.replacingCharacters(in: firstRange!, with: "")
                
                print("Сообщение после удаления числа повторов - \(inputMytebleMessage)")
                
                var subMessage: String = ""
                var counter = 0
                
                for char in inputMytebleMessage {
                    subMessage.append(char)
                    if char != "]" {
                        if char == "[" {
                            counter += 1
                        }
                    } else {
                        counter -= 1
                        if counter == 0 {
                            break
                        }
                    }
                }
                
                print("Получившаяся подстрока - \(subMessage)")
                
                let decryprted = decryptMessage(subMessage)
                
                result.append(String(repeating: decryprted, count: repeater))
                
                let secondRange = inputMytebleMessage.range(of: subMessage)
                inputMytebleMessage = inputMytebleMessage.replacingCharacters(in: secondRange!, with: "")
            } else {
                partOfMessage = String(inputMytebleMessage.first!)
                
                
                if partOfMessage != "]" && partOfMessage != "[" {
                    result.append(partOfMessage)
                }
                inputMytebleMessage = String(inputMytebleMessage.dropFirst())
                
                print("Если в строка не число, то сообщение - \(inputMytebleMessage)")
            }
        }
        
    
        return result
    }
    
}
