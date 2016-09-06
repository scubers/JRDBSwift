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
        return jrdbChain.target
    }
    
    public var targetClazz: T.Type? {
        return jrdbChain.targetClazz as? T.Type
    }
    
    public var operation: ChainOperation {
        return jrdbChain.operation
    }
    
    public var tableName: String? {
        return jrdbChain.tableName
    }
    
    public var queryConditions: [JRQueryCondition]? {
        return jrdbChain.queryCondition
    }
    
    public var selectColumns: [String]? {
        return jrdbChain.selectColumns
    }
    
    // MARK: settings
    public func From(from: T.Type) -> Chain<T> {
        jrdbChain.From(from)
        return self
    }
    
    public func From(from: Chain<T>) -> Chain<T> {
        jrdbChain.From(from.jrdbChain)
        return self
    }

    public func Limit(start: UInt, _ length: UInt) -> Chain<T> {
        jrdbChain.Limit(start, length)
        return self
    }
    
    public func InDB(db: FMDatabase) -> Chain<T> {
        jrdbChain.InDB(db)
        return self
    }
    
    public func Order(orderby: String) -> Chain<T> {
        jrdbChain.Order(orderby)
        return self
    }
    
    public func Group(groupby: String) -> Chain<T> {
        jrdbChain.Group(groupby)
        return self
    }
    
    public func Where(whereString: String) -> Chain<T> {
        jrdbChain.Where(whereString)
        return self
    }
    
    public func WherePKIs(pk: AnyObject) -> Chain<T> {
        jrdbChain.WherePKIs(pk)
        return self
    }
    
    public func WhereIdIs(id: String) -> Chain<T> {
        jrdbChain.WhereIdIs(id)
        return self
    }
    
    public func Recursive(recusive: Bool) -> Chain<T> {
        jrdbChain.Recursive(recusive ? 1 : 0)
        return self
    }
    public func Recursively() -> Chain<T> {
        return Recursive(true)
    }
    public func UnRecursively() -> Chain<T> {
        return Recursive(false)
    }
    
    public func Sync(sync: Bool) -> Chain<T> {
        jrdbChain.Sync(sync ? 1 : 0)
        return self
    }
    public func Safely() -> Chain<T> {
        return Sync(true)
    }
    public func UnSafely() -> Chain<T> {
        return Sync(false)
    }
    
    public func Transaction(transaction: Bool) -> Chain<T> {
        jrdbChain.Transaction(transaction ? 1 : 0)
        return self
    }
    public func Transactional() -> Chain<T> {
        return Transaction(true)
    }
    public func NoTransaction() -> Chain<T> {
        return Transaction(false)
    }
    
    public func Cache(useCache: Bool) -> Chain<T> {
        jrdbChain.Cache(useCache ? 1 : 0)
        return self
    }
    public func Cached() -> Chain<T> {
        return Cache(true)
    }
    public func NoCached() -> Chain<T> {
        return Cache(false)
    }
    
    public func Desc(desc: Bool) -> Chain<T> {
        jrdbChain.Desc(desc ? 1 : 0)
        return self
    }
    public func Descend() -> Chain<T> {
        return Desc(true)
    }
    public func Ascend() -> Chain<T> {
        return Desc(false)
    }
    
    public func Params(params: AnyObject...) -> Chain<T> {
        jrdbChain.Params(params)
        return self
    }
    
    public func Columns(columns: String...) -> Chain<T> {
        jrdbChain.Columns(columns)
        return self
    }
    
    public func Ignore(ignores: String...) -> Chain<T> {
        jrdbChain.Ignore(ignores)
        return self
    }
    
    public func Insert(objs: JRPersistent...) -> Chain<T> {
        jrdbChain.Insert(objs)
        return self
    }
    
    public func Update(objs: JRPersistent...) -> Chain<T> {
        jrdbChain.Update(objs)
        return self
    }
    
    public func Delete(objs: JRPersistent...) -> Chain<T> {
        jrdbChain.Delete(objs)
        return self
    }
    
    public func SaveOrUpdate(objs: JRPersistent...) -> Chain<T> {
        jrdbChain.SaveOrUpdate(objs)
        return self
    }
    
    public func DeleteAll() -> Chain<T> {
        jrdbChain.DeleteAll(T)
        return self
    }
    
    public func ColumnSelect(columnsArray: [String]) -> Chain<T> {
        jrdbChain.ColumnsSelect(columnsArray)
        return self
    }
    
    public func ColumnSelect(columns: String...) -> Chain<T> {
        jrdbChain.ColumnsSelect(columns)
        return self
    }
    
    public func CountSelect() -> Chain<T> {
        jrdbChain.CountSelect(T)
        return self
    }
    
    public func Select() -> Chain<T> {
        jrdbChain.Select(T)
        return self;
    }
    
    public func CreateTable() -> Bool {
        return jrdbChain.CreateTable(T).updateResult()
    }
    
    public func UpdateTable() -> Bool {
        return jrdbChain.UpdateTable(T).updateResult()
    }
    
    public func DropTable() -> Bool {
        return jrdbChain.DropTable(T).updateResult()
    }
    
    public func TruncateTable() -> Bool {
        return jrdbChain.TruncateTable(T).updateResult()
    }
    
    public func exe(complete: JRDBChainComplete? = nil) -> JRDBResult {
        return jrdbChain.exe(complete)
    }
    
    // MARK: execution
    public func object() -> T {
        return jrdbChain.object() as! T
    }
    
    public func count() -> UInt {
        return jrdbChain.count()
    }
    
    public func list() -> [T] {
        return jrdbChain.list() as! [T]
    }
    
    public func update() -> Bool {
        return jrdbChain.updateResult()
    }
}