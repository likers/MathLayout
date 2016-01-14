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
        
        topView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(topView)
        
        botView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(botView)
        
        topView.top ==== self.view.top + 50
        topView.left ==== self.view.left
        topView.width ==== 100
        topView.height ==== 100
        
        botView.centerXY ==== self.view.centerXY - 50
        botView.width ==== 2*topView.width + 50
        botView.height ==== topView.height - 50
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

