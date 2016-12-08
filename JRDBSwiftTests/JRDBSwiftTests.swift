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

        JRDBMgr.shareInstance().defaultDatabasePath = "/Users/mac/Desktop/testSwift.sqlite"
        JRDBMgr.shareInstance().registerClazzes([
            Animal.self,
            Person.self,
            Card.self,
            Money.self,
            ]);
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: save
    func testSave1() {
        let p = Person()
        let a = J_Insert(p).update()
        assert(a)
    }
    
    func testSave2() {
        var ps = [Person]()
        (0..<10).forEach { (i) in
            ps.append(Person(i))
        }
        let a = J_Insert(ps).update()
        assert(a)
    }
    
    func testSaveOne2Many() {
        let p = Person(0)
        var ps = [Person]()
        (1...10).forEach { (i) in
            ps.append(Person(i))
        }
        p.children = ps
        let a = J_Insert(p).Recursively().update()
        assert(a)
    }
    
    func testSaveCycle() {
        let p = Person()
        let c = Card(1)
        p.card = c
        c.person = p
        let a = J_Insert(p).Recursively().update()
        assert(a)
    }
    
    func testSubQuery() {
        let a = J_Select(Person.self)
                    .From(J_Select(columns: ["1"]))
                    .Limit(0, 5)
                    .Order(by: "f_cgfloat").Descend().list();
        print(a)
    }
    
    // MARK: update
    
    func testUpdate() {
        let p = J_Select(Person.self).Recursive(false).list().first
        p?.b_string = "11111"
        let a = J_Update(p!).Columns("a_int").Recursive(true).update()
        assert(a)
    }
    
    // MARK: delete
    
    func testDeleteAll() {
        let a = J_DeleteAll(Person.self).update()
        assert(a)
    }
    
    // MARK: query
    func testSelectAll() {
        let a = J_Select(Person.self).list()
        print(a.count)
    }
    
    func testSelectCount() {
        let a = J_SelectCount(Person.self).count()
        print(a)
    }
    
    func testSelectById() {
        _ = J_Select(Person.self).Where(IdIs: "123123").object()
    }
    
    func testSelectColumns() {
        _ = J_Select(columns: ["a_int", "b_double"]).From(Person.self).list()
    }
}
