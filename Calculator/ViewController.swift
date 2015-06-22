//
//  ViewController.swift
//  Calculator
//
//  Created by Shanshan ZHAO on 12/06/15.
//  Copyright (c) 2015 Shanshan ZHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel! // optional == nil automatically
    
    var isInTheMiddleOfTypingANumber : Bool = false
    
    @IBAction func PressDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        if(isInTheMiddleOfTypingANumber)
        {
        displayLabel.text = displayLabel.text! + digit
        } else
        {
            displayLabel.text = digit
            isInTheMiddleOfTypingANumber = true
        }
    }
    
    // var opperandStack : Array<Double> = Array<Double>() // swift can be inference type. no needed
    
    var opperandStack  = Array<Double>()

    @IBAction func enter()
    {
        isInTheMiddleOfTypingANumber = false
        opperandStack.append(displayDoubleValue)
        println("stack =\(opperandStack)")
    }
    
    // To fix the problem string-> double, "!" will crash when it's nil
        var displayDoubleValue : Double
        {
        get{
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }
        set{
            displayLabel.text = "\(newValue)"
            isInTheMiddleOfTypingANumber = false
                    }
        }

    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        switch operation
        
        {
        case "×": performOperation { $0 * $1 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $0 - $1 }
        case "÷": performOperation { $0 / $1 }
        case "√": performOperationx { sqrt($0)}
        default :break
        }
    }
    
    func performOperation(operation: (Double,Double) -> Double)
    {
        if(opperandStack.count >= 2)
        {
            displayDoubleValue = operation(opperandStack.removeLast(), opperandStack.removeLast());
            enter()
        }
    }
    
    // TODO: should be work even same name
    func performOperationx(operation: Double -> Double)
    {
        if(opperandStack.count >= 1)
        {
            displayDoubleValue = operation(opperandStack.removeLast());
            enter()
        }
    }
    
    
    func multiply(op1:Double,op2: Double) ->Double
    {
        return op1 * op2;
    }
}

