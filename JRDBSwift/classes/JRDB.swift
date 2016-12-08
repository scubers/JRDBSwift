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

public func J_Select<T: JRPersistent>(_ clazz: T.Type) -> Chain<T> {
    return Chain<T>().Select()
}

public func J_SelectCount<T: JRPersistent>(_ clazz: T.Type) -> Chain<T> {
    return Chain<T>().CountSelect()
}

public func J_Select<T: JRPersistent>(columns: String...) -> Chain<T> {
    return Chain<T>().Select(columns: columns)
}

public func J_Select<T: JRPersistent>(columns: [String]) -> Chain<T> {
    return Chain<T>().Select(columns: columns)
}

// MARK: Insert

public func J_Insert<T: JRPersistent>(_ objs:T...) -> Chain<T> {
    return Chain<T>().Insert(objs as JRPersistent)
}

public func J_Insert<T: JRPersistent>(_ objs:[T]) -> Chain<T> {
    return Chain<T>().Insert(objs as JRPersistent)
}


// MARK: Update

public func J_Update<T: JRPersistent>(_ objs:T...) -> Chain<T> {
    return Chain<T>().Update(objs as JRPersistent)
}

public func J_Update<T: JRPersistent>(_ objs:[T]) -> Chain<T> {
    return Chain<T>().Update(objs as JRPersistent)
}

// MARK: Delete

public func J_Delete<T: JRPersistent>(_ objs:T...) -> Chain<T> {
    return Chain<T>().Delete(objs as JRPersistent)
}

public func J_Delete<T: JRPersistent>(_ objs:[T]) -> Chain<T> {
    return Chain<T>().Delete(objs as JRPersistent)
}

// MARK: SaveOrUpdate

public func J_SaveOrUpdate<T: JRPersistent>(_ objs:T...) -> Chain<T> {
    return Chain<T>().SaveOrUpdate(objs as JRPersistent)
}

public func J_SaveOrUpdate<T: JRPersistent>(_ objs:[T]) -> Chain<T> {
    return Chain<T>().SaveOrUpdate(objs as JRPersistent)
}

// MARK: DeleteAll

public func J_DeleteAll<T: JRPersistent>(_ clazz: T.Type) -> Chain<T> {
    return Chain<T>().DeleteAll()
}

// MARK: table

public func J_CreateTable<T: JRPersistent>(_ clazz: T.Type) -> Bool {
    return Chain<T>().CreateTable()
}

public func J_UpdateTable<T: JRPersistent>(_ clazz: T.Type) -> Bool {
    return Chain<T>().UpdateTable()
}

public func J_DropTable<T: JRPersistent>(_ clazz: T.Type) -> Bool {
    return Chain<T>().DropTable()
}

public func J_TruncateTable<T: JRPersistent>(_ clazz: T.Type) -> Bool {
    return Chain<T>().TruncateTable()
}

open class Chain<T: JRPersistent> {
    
    lazy fileprivate var jrdbChain = JRDBChain<T>()
    
    open var target: JRPersistent? {
        return jrdbChain.target
    }
    
    open var targetClass: T.Type? {
        return jrdbChain.targetClazz as? T.Type
    }
    
    open var operation: ChainOperation {
        return jrdbChain.operation
    }
    
    open var tableName: String? {
        return jrdbChain.tableName
    }
    
    open var selectColumns: [String]? {
        return jrdbChain.selectColumns
    }
    
    // MARK: settings
    open func From(_ from: T.Type) -> Chain<T> {
        _ = jrdbChain.from(from)
        return self
    }
    
    open func From(_ from: Chain<T>) -> Chain<T> {
        _ = jrdbChain.from(from.jrdbChain)
        return self
    }

    open func Limit(_ start: UInt, _ length: UInt) -> Chain<T> {
        _ = jrdbChain.limit(start, length)
        return self
    }
    
    open func In(DB db: FMDatabase) -> Chain<T> {
        _ = jrdbChain.inDB(db)
        return self
    }
    
    open func Order(by orderby: String) -> Chain<T> {
        _ = jrdbChain.order(orderby)
        return self
    }
    
    open func Group(by groupby: String) -> Chain<T> {
        _ = jrdbChain.group(groupby)
        return self
    }
    
    open func Where(_ whereString: String) -> Chain<T> {
        _ = jrdbChain.where(whereString)
        return self
    }
    
    open func Where(PKIs pk: AnyObject) -> Chain<T> {
        _ = jrdbChain.wherePKIs(pk)
        return self
    }
    
    open func Where(IdIs id: String) -> Chain<T> {
        _ = jrdbChain.whereIdIs(id)
        return self
    }
    
    open func Recursive(_ recusive: Bool) -> Chain<T> {
        _ = jrdbChain.recursive(recusive)
        return self
    }
    open func Recursively() -> Chain<T> {
        _ = jrdbChain.recursively()
        return self
    }
    open func UnRecursively() -> Chain<T> {
        _ = jrdbChain.unRecursively()
        return self
    }
    
    open func Sync(_ sync: Bool) -> Chain<T> {
        _ = jrdbChain.sync(sync)
        return self
    }
    open func Safely() -> Chain<T> {
        _ = jrdbChain.safely()
        return self
    }
    open func UnSafely() -> Chain<T> {
        _ = jrdbChain.unSafely()
        return self
    }
    
    open func Transaction(_ transaction: Bool) -> Chain<T> {
        _ = jrdbChain.transaction(transaction)
        return self
    }
    open func Transactional() -> Chain<T> {
        _ = jrdbChain.transactional()
        return self
    }
    open func NoTransaction() -> Chain<T> {
        _ = jrdbChain.noTransaction()
        return self
    }
    
    open func Desc(_ desc: Bool) -> Chain<T> {
        _ = jrdbChain.desc(desc)
        return self
    }
    open func Descend() -> Chain<T> {
        _ = jrdbChain.descend()
        return self
    }
    open func Ascend() -> Chain<T> {
        _ = jrdbChain.ascend()
        return self
    }
    
    open func Params(_ params: AnyObject...) -> Chain<T> {
        _ = jrdbChain.params(params)
        return self
    }


    open func Columns(_ columns: String...) -> Chain<T> {
        _ = jrdbChain.columns(columns)
        return self
    }
    
    open func Ignore(_ ignores: String...) -> Chain<T> {
        _ = jrdbChain.ignore(ignores)
        return self
    }
    
    open func Insert(_ objs: JRPersistent...) -> Chain<T> {
        _ = jrdbChain.insert(objs)
        return self
    }
    
    open func Update(_ objs: JRPersistent...) -> Chain<T> {
        _ = jrdbChain.update(objs)
        return self
    }
    
    open func Delete(_ objs: JRPersistent...) -> Chain<T> {
        _ = jrdbChain.delete(objs)
        return self
    }
    
    open func SaveOrUpdate(_ objs: JRPersistent...) -> Chain<T> {
        _ = jrdbChain.saveOrUpdate(objs)
        return self
    }
    
    open func DeleteAll() -> Chain<T> {
        _ = jrdbChain.deleteAll(T.self)
        return self
    }
    
    open func Select(columns columnsArray: [String]) -> Chain<T> {
        _ = jrdbChain.columnsSelect(columnsArray)
        return self
    }
    
    open func Select(columns: String...) -> Chain<T> {
        _ = jrdbChain.columnsSelect(columns)
        return self
    }
    
    open func CountSelect() -> Chain<T> {
        _ = jrdbChain.countSelect(T.self)
        return self
    }
    
    open func Select() -> Chain<T> {
        _ = jrdbChain.select(T.self)
        return self;
    }
    
    open func CreateTable() -> Bool {
        return jrdbChain.createTable(T.self).updateResult()
    }
    
    open func UpdateTable() -> Bool {
        return jrdbChain.updateTable(T.self).updateResult()
    }
    
    open func DropTable() -> Bool {
        return jrdbChain.dropTable(T.self).updateResult()
    }
    
    open func TruncateTable() -> Bool {
        return jrdbChain.truncateTable(T.self).updateResult()
    }
    
    open func exe() -> JRDBResult {
        return jrdbChain.exe()
    }
    
    // MARK: execution
    open func object() -> T? {
        return jrdbChain.object()
    }
    
    open func count() -> UInt {
        return jrdbChain.count()
    }
    
    open func list() -> [T] {
        return jrdbChain.list()
    }
    
    open func update() -> Bool {
        return jrdbChain.updateResult()
    }
}
