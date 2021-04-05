//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    
    var num1 = Double()
    var solution = Double()
    var op = String()
    //var newOp = String()
    var dotPressed = false
    var calcCage = false
    
    @IBAction func intButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        //making code excecute after a .2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //bringing the opacity back
            sender.alpha = 1.0
        } // Animates opacity
        
        if topLabel.text == "0" || topLabel.text == "0.0" || topLabel.text == String(num1) {
            dotPressed = false
            // Resets dotPressed whenever the top is 0 and an int button is pressed
            topLabel.text = sender.currentTitle
        }
        else if topLabel.text == String(solution) {
            num1 = Double(topLabel.text!)!
            solution = 0.00
            topLabel.text = sender.currentTitle
                // Basically stops user from adding to solution?
                // Also stores solution as num1 and clears solution field
        }
        else {
            topLabel.text = topLabel.text! + sender.currentTitle!
            // Keep typin
        }
        
        if (topLabel.text?.count)! > 12 {
            return
        }
        else {
            return
        }
        // if its greater than 12 characters, commit war crimes.
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if dotPressed == false {
            sender.alpha = 0.5
            
            // making code excecute after a .2 second delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                // bringing the opacity back
                sender.alpha = 1.0
            } // Animates opacity
            
            topLabel.text = topLabel.text! + sender.currentTitle!
            dotPressed = true
        }
        else if dotPressed == true && topLabel.text == "0" {
            topLabel.text = topLabel.text! + sender.currentTitle!
        }
        else if dotPressed == false && topLabel.text == "0.0" {
            return
        }
        else if topLabel.text == String(solution) || topLabel.text == String(num1) {
            topLabel.text = "0."
            dotPressed = true
        }
        else {
            return
        }
    }
    // Will not let decimal be pressed if it's already been pressed
    // Or if topLabel is 0
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        
        clear()
    }
    
    @IBAction func negateButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        
        topLabel.text = String(-Double(topLabel.text!)!) // makes stuff negative
    }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        //making code excecute after a .2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //bringing the opacity back
            sender.alpha = 1.0
        } // Animates opacity
        
        topLabel.text = String(Double(topLabel.text!)! * 0.01)
        dotPressed = true
    }
    // This works lol - basically multiplies by .01 to move the decimal over 2 places
    
    @IBAction func opButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        //making code excecute after a .2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //bringing the opacity back
            sender.alpha = 1.0
        } // Animates opacity
        
        if sender.currentTitle == "=" || op == sender.currentTitle {
            equals()
        }
     /*   else if opVal == "=" {
            op = sender.currentTitle!
            opVal = sender.currentTitle!
            num1 = Double(topLabel.text!)!
            topLabel.text = String(num1)
            calcCage = true
            dotPressed = true
        }*/
        else if calcCage == true && sender.currentTitle == op {
            equals()
            op = sender.currentTitle!
            num1 = Double(topLabel.text!)!
            topLabel.text = String(num1)
            calcCage = true
            dotPressed = true
        } else {
            op = sender.currentTitle!
            num1 = Double(topLabel.text!)!
            topLabel.text = String(num1)
            calcCage = true
            dotPressed = true
        }
        // Need it to display num1 until I press another button, then I need it to only display that text.
    }
    
    
    
    func equals() {
            switch op {
            case "+":
                add(a:num1, b:Double(topLabel.text!)!)
            case "-":
                subtract(a:num1, b:Double(topLabel.text!)!)
            case "×":
                multiply(a:num1, b:Double(topLabel.text!)!)
            case "÷":
                divide(a:num1, b:Double(topLabel.text!)!)
            default:
                print(Error.self)
            }
    }
    
    func add(a:Double, b:Double) {
        solution = a + b
        topLabel.text = String(solution)
        num1 = 0.0
    }
    
    func subtract(a:Double, b:Double) {
        solution = a - b
        topLabel.text = String(solution)
        num1 = 0.0
    }
    
    func multiply(a:Double, b:Double) {
        solution = a * b
        topLabel.text = String(solution)
        num1 = 0.0
    }
    
    func divide(a:Double, b:Double) {
        solution = a / b
        topLabel.text = String(solution)
        num1 = 0.0
    }
    
    func clear() {
        num1 = 0.00
        solution = 0.00
        topLabel.text = "0"
        calcCage = false
        op = "empty"
    }
}
