//
//  ViewController.swift
//  BootcampCalculatorAssignment
//
//  Created by furkan sakız on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var isTypingNumber = false
    var currentMathText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonNumbers(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            if isTypingNumber {
                mathLabel.text! += digit
            } else {
                if currentMathText == "" || mathLabel.text == "Math" {
                    mathLabel.text = digit
                } else {
                    mathLabel.text! += digit
                }
                isTypingNumber = true
            }
            currentMathText += digit
        }
    }
    
    @IBAction func buttonErase(_ sender: Any) {
        
        if !currentMathText.isEmpty {
            if currentMathText.last == " " {
                currentMathText = String(currentMathText.dropLast(3))
                isTypingNumber = true
                mathLabel.text = currentMathText
            } else {
                if currentMathText.count <= 1{
                    print("count 1")
                    mathLabel.text = "Math"
                    currentMathText = ""
                    isTypingNumber = false
                } else {
                    currentMathText.removeLast()
                    mathLabel.text = currentMathText
                }
                
            }
        }
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        
        let result = splitFunction(operation: currentMathText)
        resultLabel.text = result
        
        currentMathText = ""
        isTypingNumber = false
    }
    
    @IBAction func buttonAC(_ sender: Any) {
        
        mathLabel.text = "Math"
        resultLabel.text = "Result"
        currentMathText = ""
        isTypingNumber = false
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        
        if isTypingNumber {
            currentMathText += " + "
            mathLabel.text! += " + "
            isTypingNumber = false
        }
    }
    
    func splitFunction (operation: String) -> String {
        
        let math = operation.split(separator: " + " )
        var result = 0
        
        for value in math {
            if let number = Int(value) {
                result += number
            }
        }
        return String(result)
        
    }
    

}

