//
//  ContentView.swift
//  CalculatorAppSwiftUI
//
//  Created by Elior Cohen on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber = 0.0
    @State private var secondNumber = 0.0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var isTypingNumber = false
    
    var body: some View {
        VStack() {
            TextField("0", text: $calculatorText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack {
                btnOperandTapped("+")
                    .padding()
                Spacer()
                btnOperandTapped("-")
                    .padding()
                Spacer()
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
                }
                .padding()
            }.padding()
            
            HStack {
                btnOperandTapped("*")
                    .padding()
                Spacer()
                btnOperandTapped("/")
                    .padding()
                Spacer()
                Button(action: {
                    self.clearText()
                }) {
                    (Text("Clear"))
                }
                .padding()
            }.padding()
            
            HStack {
                btnCalcDigit("1")
                    .padding()
                Spacer()
                btnCalcDigit("2")
                    .padding()
                Spacer()
                btnCalcDigit("3")
                    .padding()
            }.padding()
            
            HStack {
                btnCalcDigit("4")
                    .padding()
                Spacer()
                btnCalcDigit("5")
                    .padding()
                Spacer()
                btnCalcDigit("6")
                    .padding()
            }.padding()
            
            HStack {
                btnCalcDigit("7")
                    .padding()
                Spacer()
                btnCalcDigit("8")
                    .padding()
                Spacer()
                btnCalcDigit("9")
                    .padding()
            }.padding()
            
            HStack {
                btnCalcDigit("0")
                    .frame(width: 30, height: 30, alignment: .center)
            }.padding()
        }
    }
    
    private func btnOperandTapped(_ operand: String) -> Button<Text> {
        return Button(action: {
            self.operandTapped(operand)
        }) {
            (Text(operand))
        }
    }
    
    private func operandTapped(_ operand: String) {
        isTypingNumber = false
        firstNumber = Double(calculatorText)!
        self.operand = operand
        calculatorText = operand
    }
    
    private func btnCalcDigit(_ number: String) -> Button<Text> {
        return Button(action: {
            self.digitTapped(number)
        }) {
            (Text(number))
        }
    }
    
    private func digitTapped(_ number: String) -> Void {
        if isTypingNumber {
            calculatorText += number
        } else {
            calculatorText = number
            isTypingNumber = true
        }
    }
    
    private func calculate() {
        isTypingNumber = false
        var result = 0.0
        secondNumber = Double(calculatorText)!
        
        if operand == "+" {
            result = firstNumber + secondNumber
        } else if operand == "-" {
            result = firstNumber - secondNumber
        } else if operand == "*" {
            result = firstNumber * secondNumber
        } else if operand == "/" {
            result = firstNumber / secondNumber
        }
        
        let finishResult = result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", result) : String(result)
        calculatorText = "\(finishResult)"
    }
    
    private func clearText() {
        isTypingNumber = false
        calculatorText = "0"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
    
}
