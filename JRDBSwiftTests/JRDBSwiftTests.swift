//
//  JRDBSwiftTests.swift
//  JRDBSwiftTests
//
//  Created by J on 16/8/17.
//  Copyright © 2016年 J. All rights reserved.
//

import XCTest
import JRDB
@testable import JRDBSwift

class JRDBSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let db = FMDatabase(path: "/Users/mac/Desktop/testSwift.sqlite");
        JRDBMgr.shareInstance().defaultDB = db
        JRDBMgr.shareInstance().registerClazzes([
            Animal.self,
            Person.self,
            Card.self,
            Money.self,
            ]);
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        JRDBMgr.shareInstance().close()
        super.tearDown()
    }
    
    // MARK: save
    func testSave1() {
        let p = Person()
        let a: Bool = (J_Insert(p).j_exe(nil))
        assert(a)
    }
    
    func testSave2() {
        var ps = [Person]()
        (0..<10).forEach { (i) in
            ps.append(Person(i))
        }
        let a = (J_Insert(ps).j_exe(nil) as Bool)
        assert(a)
    }
    
    func testSaveOne2Many() {
        let p = Person(0)
        var ps = [Person]()
        (1...10).forEach { (i) in
            ps.append(Person(i))
        }
        p.children = ps
        let a = (J_Insert(p).Recursively().j_exe(nil) as Bool)
        assert(a)
    }
    
    func testSaveCycle() {
        let p = Person()
        let c = Card(1)
        p.card = c
        c.person = p
        let a = (J_Insert(p).Recursively().j_exe(nil) as Bool)
        assert(a)
    }
    
    
    
    
}
