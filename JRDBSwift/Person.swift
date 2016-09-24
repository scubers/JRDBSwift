//
//  Person.swift
//  JRDBSwift
//
//  Created by J on 16/8/17.
//  Copyright © 2016年 J. All rights reserved.
//


import UIKit

open class Money : NSObject {
    open var value: String!
    convenience init(_ a : Int) {
        self.init()
        self.value = "\(a)"
    }
}

open class Card : NSObject {
    open var serialNumber: String!
    weak open var person: Person!
    convenience init(_ a : Int) {
        self.init()
        self.serialNumber = "\(a)"
    }
    
//    override open static func jr_singleLinkedPropertyNames() -> [String : AnyObject.Type]? {
//        return [
//            "person" : Person.self,
//        ]
//    }
}

open class Animal : NSObject {
    
    open var type: String!
}

open class Person : Animal {
    
    open var animal: Animal!
    
    var bbbb: Bool = false          // yes
    
    var a_int: Int = 0              // yes
    var a_int1: Int? = nil          // no
    var b_string: String = "1"      // yes
    var b_string1: String! = "2"    // yes
    var b_string2: String? = "3"    // yes
    var c_nsstring: NSString = "4"  // yes
    var c_nsstring1: NSString! = "5"// yes
    var c_nsstring2: NSString? = nil// yes
    
    var d_double: Double = 7        // yes
    var d_double1: Double! = 7        // no
    var d_double2: Double? = 7        // no
    
    var e_float: Float = 8          // yes
    var e_float1: Float! = 8          // no
    var e_float2: Float? = 8          // no
    
    var f_cgfloat: CGFloat = 9      // yes
    var f_cgfloat1: CGFloat! = 9      // no
    var f_cgfloat2: CGFloat? = 9      // no
    
    var g_nsData: Data = Data() // yes
    var h_nsDate: Date = Date() // yes
    
    open var son: Person?
    
    open var card: Card?
    open var card1: Card?
    
    open var cccc: Card?
    
    open var money: [Money]?
    
    open var children: [Person]?
    open var nnnn: [Person] = [Person]()

    
    convenience init(_ i: Int) {
        self.init()
        self.a_int = i + 1
        self.a_int1 = i + 2
        self.b_string = "\(i + 3)"
        self.b_string1 = "\(i + 4)"
        self.b_string2 = "\(i+5)"
        self.c_nsstring = NSString(format: "%d", i + 6)
        self.c_nsstring1 = NSString(format: "%d, %d", i + 7, i + 8)
        self.c_nsstring2 = NSString(format: "%d, %d, %d", i + 9, i+10, i+11)
        self.d_double = Double(i) + 12
        self.e_float = Float(i) + 13
        self.f_cgfloat = CGFloat(i + 14)
    }
    
//    override open static func jr_singleLinkedPropertyNames() -> [String : AnyObject.Type]? {
//        return [
//            "card" : Card.self,
//            "card1" : Card.self,
//            "son"   : Person.self,
//        ]
//    }
//    
//    override open static func jr_oneToManyLinkedPropertyNames() -> [String : AnyObject.Type]? {
//        return [
//            "money" : Money.self,
//            "children" : Person.self,
//            "nnnn" : Person.self,
//        ]
//    }
}
