//
//  ViewController.swift
//  MathLayout
//
//  Created by Jinhuan Li on 1/2/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let topView = UIView()
        let botView = UIView()
        
        topView.backgroundColor = UIColor.blueColor()
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        
        botView.backgroundColor = UIColor.greenColor()
        botView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(botView)
        
        topView.mlTop == self.view.mlTop + 50
        topView.mlLeading == self.view.mlLeading + 50
        topView.mlWidth == 100
        topView.mlHeight == 100
        
        botView.mlTop == topView.mlBottom + 50
        botView.mlLeft == self.view.mlLeft + 50
        botView.mlWidth == 2*topView.mlWidth + 50
        botView.mlHeight == topView.mlHeight - 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

