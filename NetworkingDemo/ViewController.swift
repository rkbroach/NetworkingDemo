//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Rohan Kevin Broach on 7/10/19.
//  Copyright © 2019 rkbroach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var primeNumberButton: UIButton!
    
    // MARK:- Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func primeNumberButtonPressed(_ sender: UIButton) {
        let queue = OperationQueue()
        enablePrimeButton(false)
        queue.addOperation {
            for num in 0 ... 10_000_000 {
                let isPrimeNumber = self.isPrime(number: num)
                print("\(num) is prime: \(isPrimeNumber)")
            }
            OperationQueue.main.addOperation {
                self.enablePrimeButton(true )
            }
        }
    }
    
    func enablePrimeButton (_ isEnabled: Bool) {
        primeNumberButton.isEnabled = isEnabled
        if isEnabled {
            primeNumberButton.setTitle("Calculate Prime Number", for: .normal)
        } else {
            primeNumberButton.setTitle("Calculating Prime Number...", for: .normal)
        }
        
        
        
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        if number <= 3 {
            return true
        }
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i += 2
        }
        return true
    }
    
    
    
}

