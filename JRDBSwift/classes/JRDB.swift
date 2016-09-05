//
//  JRDB.swift
//  JRDBSwift
//
//  Created by J on 16/8/17.
//  Copyright © 2016年 J. All rights reserved.
//

import Foundation
import JRDB

// MARK: Select

public func J_Select<T: JRPersistent>(clazz: T.Type) -> Chain<T> {
    return Chain<T>().Select()
}

public func J_SelectCount<T: JRPersistent>(clazz: T.Type) -> Chain<T> {
    return Chain<T>().CountSelect()
}

public func J_SelectColumns<T: JRPersistent>(columns: String...) -> Chain<T> {
    return Chain<T>().ColumnSelect(columns)
}
public func J_SelectColumns<T: JRPersistent>(columns: [String]) -> Chain<T> {
    return Chain<T>().ColumnSelect(columns)
}

// MARK: Insert

public func J_Insert<T: JRPersistent>(objs:T...) -> Chain<T> {
    return Chain<T>().Insert(objs)
}
public func J_Insert<T: JRPersistent>(objs:[T]) -> Chain<T> {
    return Chain<T>().Insert(objs)
}


// MARK: Update

public func J_Update<T: JRPersistent>(objs:T...) -> Chain<T> {
    return Chain<T>().Update(objs)
}
public func J_Update<T: JRPersistent>(objs:[T]) -> Chain<T> {
    return Chain<T>().Update(objs)
}

// MARK: Delete

public func J_Delete<T: JRPersistent>(objs:T...) -> Chain<T> {
    return Chain<T>().Delete(objs)
}
public func J_Delete<T: JRPersistent>(objs:[T]) -> Chain<T> {
    return Chain<T>().Delete(objs)
}

// MARK: SaveOrUpdate

public func J_SaveOrUpdate<T: JRPersistent>(objs:T...) -> Chain<T> {
    return Chain<T>().SaveOrUpdate(objs)
}
public func J_SaveOrUpdate<T: JRPersistent>(objs:[T]) -> Chain<T> {
    return Chain<T>().SaveOrUpdate(objs)
}

// MARK: DeleteAll

public func J_DeleteAll<T: JRPersistent>(clazz: T.Type) -> Chain<T> {
    return Chain<T>().DeleteAll()
}

// MARK: table

public func J_CreateTable<T: JRPersistent>(clazz: T.Type) -> Bool {
    return Chain<T>().CreateTable()
}
public func J_UpdateTable<T: JRPersistent>(clazz: T.Type) -> Bool {
    return Chain<T>().UpdateTable()
}
public func J_DropTable<T: JRPersistent>(clazz: T.Type) -> Bool {
    return Chain<T>().DropTable()
}
public func J_TruncateTable<T: JRPersistent>(clazz: T.Type) -> Bool {
    return Chain<T>().TruncateTable()
}

public class Chain<T: JRPersistent> {
    
    lazy private var jrdbChain = JRDBChain()
    
    public var target: JRPersistent? {
        return self.jrdbChain.target
    }
    
    public var targetClazz: T.Type? {
        return self.jrdbChain.targetClazz as? T.Type
    }
    
    public var operation: ChainOperation {
        return self.jrdbChain.operation
    }
    
    public var tableName: String? {
        return self.jrdbChain.tableName
    }
    
    public var queryConditions: [JRQueryCondition]? {
        return self.jrdbChain.queryCondition
    }
    
    public var selectColumns: [String]? {
        return self.jrdbChain.selectColumns
    }
    
    // MARK: settings
    public func From(from: AnyObject) -> Chain {
        self.jrdbChain.From(from)
        return self
    }

    public func Limit(start: UInt, _ length: UInt) -> Chain {
        self.jrdbChain.Limit(start, length)
        return self
    }
    
    public func InDB(db: FMDatabase) -> Chain {
        self.jrdbChain.InDB(db)
        return self
    }
    
    public func Order(orderby: String) -> Chain {
        self.jrdbChain.Order(orderby)
        return self
    }
    
    public func Group(groupby: String) -> Chain {
        self.jrdbChain.Group(groupby)
        return self
    }
    
    public func Where(whereString: String) -> Chain {
        self.jrdbChain.Where(whereString)
        return self
    }
    
    public func WherePKIs(pk: AnyObject) -> Chain {
        self.jrdbChain.WherePKIs(pk)
        return self
    }
    
    public func WhereIdIs(id: String) -> Chain {
        self.jrdbChain.WhereIdIs(id)
        return self
    }
    
    public func Recursive(recusive: Bool) -> Chain {
        self.jrdbChain.Recursive(recusive ? 1 : 0)
        return self
    }
    
    public func Sync(sync: Bool) -> Chain {
        self.jrdbChain.Sync(sync ? 1 : 0)
        return self
    }
    
    public func Transaction(transaction: Bool) -> Chain {
        self.jrdbChain.Transaction(transaction ? 1 : 0)
        return self
    }
    
    public func Cache(useCache: Bool) -> Chain {
        self.jrdbChain.Cache(useCache ? 1 : 0)
        return self
    }
    
    public func Params(params: AnyObject...) -> Chain {
        self.jrdbChain.Params(params)
        return self
    }
    
    public func Columns(columns: String...) -> Chain {
        self.jrdbChain.Columns(columns)
        return self
    }
    
    public func Ignore(ignores: String...) -> Chain {
        self.jrdbChain.Ignore(ignores)
        return self
    }
    
    public func Insert(objs: JRPersistent...) -> Chain {
        self.jrdbChain.Insert(objs)
        return self
    }
    
    public func Update(objs: JRPersistent...) -> Chain {
        self.jrdbChain.Update(objs)
        return self
    }
    
    public func Delete(objs: JRPersistent...) -> Chain {
        self.jrdbChain.Delete(objs)
        return self
    }
    
    public func SaveOrUpdate(objs: JRPersistent...) -> Chain {
        self.jrdbChain.SaveOrUpdate(objs)
        return self
    }
    
    public func DeleteAll() -> Chain {
        self.jrdbChain.DeleteAll(T)
        return self
    }
    
    public func ColumnSelect(columnsArray: [String]) -> Chain {
        self.jrdbChain.ColumnsSelect(columnsArray)
        return self
    }
    
    public func ColumnSelect(columns: String...) -> Chain {
        self.jrdbChain.ColumnsSelect(columns)
        return self
    }
    
    
    public func CountSelect() -> Chain {
        self.jrdbChain.CountSelect(T)
        return self
    }
    
    public func Select() -> Chain {
        self.jrdbChain.Select(T)
        return self;
    }
    
    public func CreateTable() -> Bool {
        return self.jrdbChain.CreateTable(T).updateResult()
    }
    
    public func UpdateTable() -> Bool {
        return self.jrdbChain.UpdateTable(T).updateResult()
    }
    
    public func DropTable() -> Bool {
        return self.jrdbChain.DropTable(T).updateResult()
    }
    
    public func TruncateTable() -> Bool {
        return self.jrdbChain.TruncateTable(T).updateResult()
    }
    
    public func exe(complete: JRDBChainComplete? = nil) -> JRDBResult {
        return self.jrdbChain.exe(complete)
    }
    
    // MARK: execution
    public func object() -> T {
        return self.jrdbChain.object() as! T
    }
    
    public func count() -> UInt {
        return self.jrdbChain.count()
    }
    
    public func list() -> [T] {
        return self.jrdbChain.list() as! [T]
    }
    
    public func update() -> Bool {
        return self.jrdbChain.updateResult()
    }
}