//
//  ViewController.swift
//  ISP1002-Calculator
//
//  Created by Gurpreet on 14/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var calculations: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction func equalAction(_ sender: Any) {
        if validInput {
            let checkedWorkingsForPercent = calculations.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let expr = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = result(result: expr)
            resultLabel.text = resultString
        } else {
            showErrorAlert()
        }
    }
    
    var validInput: Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        var previous = -1
        for char in calculations {
            if specialCharacter(char: char) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        for index in funcCharIndexes {
            if index == 0 {
                return false
            }
            if index == calculations.count - 1 {
                return false
            }
            if previous != -1 {
                if index - previous == 1 {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        return false
    }
    
    func result(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        reset()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!calculations.isEmpty) {
            calculations.removeLast()
            calculationLabel.text = calculations
        }
    }
    
    func addToCalculations(value: String) {
        calculations = calculations + value
        calculationLabel.text = calculations
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToCalculations(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToCalculations(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToCalculations(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToCalculations(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToCalculations(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToCalculations(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToCalculations(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToCalculations(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToCalculations(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToCalculations(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToCalculations(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToCalculations(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToCalculations(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToCalculations(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToCalculations(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToCalculations(value: "9")
    }
    
    @IBAction func square(_ sender: Any) {
        if let input = calculationLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = dValue * dValue
            resultLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func sinTap(_ sender: Any) {
        if let input = calculationLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = sin(dValue)
            resultLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func cosTap(_ sender: Any) {
        if let input = calculationLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = cos(dValue)
            resultLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func tanTap(_ sender: Any) {
        if let input = calculationLabel.text,
           !input.isEmpty,
           let dValue = Double(input) {
            let output = tan(dValue)
            resultLabel.text = "\(result(result: output))"
        } else {
            showErrorAlert()
        }
    }
    
    func reset() {
        calculations = ""
        calculationLabel.text = ""
        resultLabel.text = ""
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(
            title: "Invalid Input",
            message: "Calculator unable to do math based on input",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

