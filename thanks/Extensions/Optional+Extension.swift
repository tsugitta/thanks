//
//  Optional+Extension.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

protocol Occupiable {

    var isEmpty: Bool { get }

}

extension String: Occupiable { }

extension Optional where Wrapped: Occupiable {

    var isBlank: Bool {
        switch self {
        case .None: return true
        case .Some(let value): return value.isEmpty
        }
    }
    
    var isNotBlank: Bool {
        return !isBlank
    }

}