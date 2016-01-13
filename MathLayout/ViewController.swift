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
//        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        
        botView.backgroundColor = UIColor.greenColor()
//        botView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(botView)
        
        topView.topAnchor ==== self.view.topAnchor + 50
        topView.leftAnchor ==== self.view.leftAnchor
        topView.widthAnchor ==== 100
        topView.heightAnchor ==== 100
        
        botView.centerXY ==== self.view.centerXY - 50
        botView.width ==== 2*topView.width + 50
        botView.height ==== topView.height - 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

