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
    
    static func filePathInDocumentsDirectory(fileName: String)->URL {
        return FileManager.documentsDirectory.appendingPathComponent(fileName)
    }
    
    static func fileExistsInDocumentsDirectory(fileName:String)->Bool {
        let path = filePathInDocumentsDirectory(fileName: fileName).path
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func deleteFileInDocumentsDirectory(fileName: String) {
        let path = filePathInDocumentsDirectory(fileName: fileName).path
        do {
            try FileManager.default.removeItem(atPath: path)
            print("FILE: \(path) was deleted!")
        } catch {
            print("ERROR: \(error) - FOR FILE: \(path)")
        }
    }
    
    static func contentsOfDir(url: URL)->[String]{
        do {
            if let paths = try FileManager.default.contentsOfDirectory(atPath: url.path) as [String]? {
                return paths
            } else {
                print("none found")
                return [String]() // return empty array of Strings
            }
        } catch {
            print("ERROR: \(error)")
            return [String]() // return empty array of Strings on error
        }
    }
    
}
