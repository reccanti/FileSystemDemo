//
//  ViewController.swift
//  FileSystemDemo
//
//  Created by Benjamin Wilcox on 4/6/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.tempDirectory)
        print(FileManager.documentsDirectory)
        print(FileManager.cachesDirectory)
        
        // MARK: - Save text to documents directory
        let fileName = "playerName"
        let playerName = "Xander"
        let path = FileManager.documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
//        let path = URL(fileURLWithPath: "badfile.txt")
        
        // write the playerName to the documents folder
        do {
            try playerName.write(to: path, atomically: true, encoding: String.Encoding.utf8)
            print("Wrote file to \(path)")
        } catch {
            print(error)
            print("unable to write to file at path=\(path)")
        }
        
        // read the file from before from the documents folder
        do {
            let loadedString = try String(contentsOf: path, encoding: String.Encoding.utf8)
            print("loadedString = \(loadedString)")
        } catch {
            print(error)
            print("Unable to load file")
        }
        
        // use the FileSystem helper extension to write to a file
        let playerName2 = "Anya"
        let path2 = FileManager.filePathInDocumentsDirectory(fileName: "playerName2.txt")
        do {
            try playerName2.write(to: path2, atomically: true, encoding: String.Encoding.utf8)
            print("Wrote file to \(path2)")
        } catch {
            print("Unable to write to file at path=\(path2)")
            print(error)
        }
        
        // write to filesystem using unhandled try!
        let playerName3 = "Buffy"
        let path3 = FileManager.filePathInDocumentsDirectory(fileName: "playerName3.txt")
        try! playerName3.write(to: path3, atomically: true, encoding: String.Encoding.utf8)
        
        // MARK: - Save and Read Arrays - 
        let array = NSMutableArray()
        array.addObjects(from: ["red", "green", "blue"])
        let arrayPath = FileManager.filePathInDocumentsDirectory(fileName: "colors.plist")
        let success = array.write(to: arrayPath, atomically: true)
        if success {
            print("Wrote \(arrayPath) to disk")
            // read it back from the disk
            print (NSMutableArray(contentsOf: arrayPath)!)
        } else {
            print("Did not write \(arrayPath) to disk")
        }
        
        // MARK: - Save and Read Dictionaries -
        let monster = NSMutableDictionary()
        monster["name"] = "Goblin"
        monster["hp"] = 5
        monster["weapon"] = "Club"
        let dictionaryPath = FileManager.filePathInDocumentsDirectory(fileName: "monster.plist")
        let success2 = monster.write(to: dictionaryPath, atomically: true)
        if success2 {
            print("Wrote \(dictionaryPath) to disk")
            // read it back from the disk
            print(NSMutableDictionary(contentsOf: dictionaryPath))
        } else {
            print("Did not write to \(dictionaryPath) to disk")
        }
        
        // MARK: - Test new helper functions
        print("---------------")
        print(FileManager.contentsOfDir(url: FileManager.documentsDirectory))
        print(FileManager.fileExistsInDocumentsDirectory(fileName: "playerName2.txt"))
        FileManager.deleteFileInDocumentsDirectory(fileName: "playerName2.txt")
        print(FileManager.contentsOfDir(url:FileManager.documentsDirectory))
        print(FileManager.fileExistsInDocumentsDirectory(fileName: "playerName2.txt"))
        FileManager.deleteFileInDocumentsDirectory(fileName: "bad-file-name.txt")
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

