import UIKit

// MARK: - metod 1 - Fahrenhiet
func toFahrenhiet(celcius: Double) -> Double {
    return celcius * 1.8 + 32
}
print("30 Celcius = \(toFahrenhiet(celcius: 30))F")

// MARK: -  Calculate Square
func calculateRectangle(longSide: Double, shortSide: Double) {
    let environmentRectangle = (longSide + shortSide) * 2
    print("Environment Rectangle: \(environmentRectangle)")
}
calculateRectangle(longSide: 5.40, shortSide: 6.70)

// MARK: -  Factorial
func calculateFactorial(number: Int) -> Int {
    if number == 0 {
        return 1
    }else{
        return number * calculateFactorial(number: number-1)
    }
}
print(calculateFactorial(number: 4))

// MARK: -  Print Letter A
func printLetterA(word: String) {
    var counter = 0
    for character in word {
        if character == "a" {
            counter += 1
        }
    }
    print("Founded 'a', \(counter)x in the \(word)")
}
printLetterA(word: "applepieaaaaaa")

// MARK: -  Calculate Inner Angle
func calculateInteriorAngle(sides: Int) -> Int {
    if sides < 3 {
        return 0
    }
    return (sides - 2) * 180
}
print(calculateInteriorAngle(sides: 5))

// MARK: - Calculate Salary
func calculateSalary(days: Int) -> Int {
    let workHours = 8
    let payday = 10
    let overtimePay = 20
    let overtime = 160
    
    let totalHours = days * workHours
    
    if totalHours <= overtime {
        return totalHours * payday
    }else{
        let overtimeHours = totalHours - overtime
        let overtimeSalary = overtimeHours * overtimePay
        return ((totalHours - overtimeHours) * payday ) + overtimeSalary
    }
}
print(calculateSalary(days: 22))

// MARK: - Calculate Internet Fee
func calculateFee(usedGB: Int) -> Int {
    if usedGB <= 50 {
        return 100
    } else {
        let overuseGB = usedGB - 50
        return 100 + overuseGB * 4
    }
}
print(calculateFee(usedGB: 54))
