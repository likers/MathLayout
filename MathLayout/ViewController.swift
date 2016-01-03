//
//  ViewController.swift
//  MathLayout
//
//  Created by Jinhuan Li on 1/2/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topView = UIView()
    let botView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        topView.backgroundColor = UIColor.blueColor()
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        
        botView.backgroundColor = UIColor.greenColor()
        botView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(botView)
        
//        topView.mlTop == self.view.mlTop + 50
//        topView.mlBottom == self.view.mlBottom - 50
//        topView.mlLeading == self.view.mlLeading + 50
//        topView.mlAll == self.view.mlAll
//        topView.mlTop == self.view.mlTop
//        topView.mlLeading == self.view.mlLeading
//        topView.mlTopLeft == self.view.mlTopLeft + 50
//        topView.mlWidth >= 100
//        topView.mlHeight >= 100
        
        topView.topAnchor == self.view.topAnchor + 50
        topView.leftAnchor == self.view.leftAnchor + 50
        topView.widthAnchor >= 100
        topView.heightAnchor >= 100
        
//        botView.mlTop == topView.mlBottom + 50
//        botView.mlLeft == self.view.mlLeft + 50
//        botView.mlBottomRight == self.view.mlBottomRight - 50
//        botView.centerXAnchor == self.view.centerXAnchor + 50
        botView.mlCenter == self.view.mlCenter - 50
        botView.mlWidth == 2*topView.mlWidth + 50
        botView.mlHeight == topView.mlHeight - 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

