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
        
//        J_Select(columns: "a", "b")
//        J_Insert(self, self)
        _ = J_Select(columns: "a", "b").From(Person.self).list()
        _ = J_Select(columns: ["a", "b"]).From(Person.self).list()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

