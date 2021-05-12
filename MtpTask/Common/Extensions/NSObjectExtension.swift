//
//  NSObjectExtension.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

public extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
    }
    
    var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? NSStringFromClass(type(of: self))
    }
}
