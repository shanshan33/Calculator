//
//  ViewController.swift
//  Calculator
//
//  Created by Shanshan ZHAO on 15/02/15.
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
    var stack = Array<Double>()

    @IBAction func enter()
    {
        isInTheMiddleOfTypingANumber = false
        stack.append(displayDoubleValue)
        println("stack =\(stack)")
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


}

