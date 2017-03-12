//
//  SecondViewController.swift
//  MathRush
//
//  Created by Ifeoluwa King on 13/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        scoreLbl.text = "Score: \(fullScore) Points"
        questionLbl.text = "\(noOfQstns) Questions"
    }

    

    @IBAction func BackBtn(sender: AnyObject) {
        //self.performSegueWithIdentifier("back", sender: nil)
    }
}
