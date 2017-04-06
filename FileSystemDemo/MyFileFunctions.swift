//
//  MyFileFunctions.swift
//  FileSystemDemo
//
//  Created by Benjamin Wilcox on 4/6/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

func documentsDirectory()->URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
}

func tempDirectory()->String {
    return NSTemporaryDirectory()
}

func cachesDirectory()->URL {
    return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
}
