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

public func J_Select(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().Select(clazz)
}

public func J_SelectCount(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().CountSelect(clazz);
}

public func J_SelectColumns(columns: String...) -> JRDBChain {
    return JRDBChain().ColumnsSelect(columns)
}

// MARK: Insert

public func J_Insert(objs:JRPersistent...) -> JRDBChain {
    return JRDBChain().Insert(objs)
}

// MARK: Update

public func J_Update(objs:JRPersistent...) -> JRDBChain {
    return JRDBChain().Update(objs)
}

// MARK: Delete

public func J_Delete(objs:JRPersistent...) -> JRDBChain {
    return JRDBChain().Delete(objs)
}

// MARK: SaveOrUpdate

public func J_SaveOrUpdate(objs:JRPersistent...) -> JRDBChain {
    return JRDBChain().SaveOrUpdate(objs)
}

// MARK: DeleteAll

public func J_DeleteAll(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().DeleteAll(clazz)
}

// MARK: table

public func J_CreateTable(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().CreateTable(clazz)
}
public func J_UpdateTable(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().UpdateTable(clazz)
}
public func J_DropTable(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().DropTable(clazz)
}
public func J_TruncateTable(clazz: AnyClass) -> JRDBChain {
    return JRDBChain().TruncateTable(clazz)
}


public extension JRDBChain {
    
    public var ColumnsJ: (String...) -> JRDBChain {
        return { [weak self] (columns: String...) in
            self?.Params(columns)
            return self!
        }
    }
    
    public var IgnoreJ: (String...) -> JRDBChain {
        return { [weak self] (columns: String...) in
            self?.Ignore(columns)
            return self!
        }
    }
    
    public var ParamsJ: (AnyObject...) -> JRDBChain {
        return { [weak self] (params: AnyObject...) in
            self?.Params(params)
            return self!
        }
    }

}



