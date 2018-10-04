//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        
        // Edge check
        if args.count < 2 { return 0 }
        
        switch args.last {
        case "count":
            return args.count - 1
        case "avg":
            
            var sum = 0
            for i in 0...args.count - 2 {
                sum += Int(args[i])!
            }
            return sum / (args.count - 1)
            
        case "fact":
            return factorial(n: Int(args[0])!)
            
        // regular operations ["1", "+", "1"]
        default:
            switch args[1] {
            case "+": return Int(args[0])! + Int(args[2])!
            case "-": return Int(args[0])! - Int(args[2])!
            case "*": return Int(args[0])! * Int(args[2])!
            case "/": return Int(args[0])! / Int(args[2])!
            default:  return Int(args[0])! % Int(args[2])!
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    func factorial(n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return n * factorial(n: n - 1)
        }
    }
}

var args: [String] = []


if CommandLine.arguments.count > 1 {
    for i in 0...CommandLine.arguments.count - 2 {
        args.append(CommandLine.arguments[i + 1])
    }
    
    print(Calculator().calculate(args))
} else {
    
    print("UW Calculator v1")
    print("Enter an expression separated by returns:")
    let first = readLine()!
    let operation = readLine()!
    let second = readLine()!
    print(Calculator().calculate([first, operation, second]))
    
}
