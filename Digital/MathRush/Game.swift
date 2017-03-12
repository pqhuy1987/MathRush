//
//  Game.swift
//  MathRush
//
//  Created by Ifeoluwa King on 07/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import Foundation
import UIKit


extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}


class Game {
    var number1 = Int(arc4random_uniform(30) + 20)
    var number2 = Int(arc4random_uniform(15)+1)
    var symbol = Int(arc4random_uniform(4))
    var ans = 1
    var possibleAns:[Int] = []
    
    
    func getSymbol()-> String  {
        switch symbol {
        case 0:
            ans = number1 + number2
            possibleAns = [ans,ans+5,ans-5]
            possibleAns.shuffleInPlace()
            return "+"
        case 1:
            ans = number1 - number2
            possibleAns = [ans,ans+5,ans-5]
            possibleAns.shuffleInPlace()
            return "-"
        case 2:
            if number1>40{number1=number1-20}
            ans = number1 * number2
            possibleAns = [ans,ans+5,ans-5]
            possibleAns.shuffleInPlace()
            return "x"
        case 3:
            let mod = number1 % number2
                if mod != 0 {
                self.number1 = self.number1 - mod
                self.ans = self.number1 / self.number2
                possibleAns = [ans,ans+5,ans-5]
                possibleAns.shuffleInPlace()
                return "/"
                }
                
        
            ans = number1 / number2
            possibleAns = [ans,ans+5,ans-5]
            possibleAns.shuffleInPlace()
            
            return "/"
        default:
            print(symbol)
            return "\(symbol)"
            
        }
    }
    
    func setGame(l1:UILabel,l2:UILabel) {
        l1.text = "\(self.number1)"
        l2.text = "\(self.number2)"
        
    }
    func setPossibleAns(b1:UIButton,b2:UIButton, b3:UIButton) {
        b1.setTitle("\(self.possibleAns[0])", forState: UIControlState.Normal)
        b2.setTitle("\(self.possibleAns[1])", forState: UIControlState.Normal)
        b3.setTitle("\(self.possibleAns[2])", forState: UIControlState.Normal)
        
    }
    
    
}
