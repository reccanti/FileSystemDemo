//
//  MyFileFunctions.swift
//  FileSystemDemo
//
//  Created by Benjamin Wilcox on 4/6/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

extension FileManager {
    
    static var documentsDirectory: URL {
        return self.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
    }
    
    static var tempDirectory: URL {
        return self.default.temporaryDirectory
    }
    
    static var cachesDirectory: URL {
        return self.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
    }
    
}
