//
//  ViewController.swift
//  JRDBSwift
//
//  Created by J on 16/8/17.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import JRDB


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        JRDBMgr.shareInstance().registerClazzes([])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

