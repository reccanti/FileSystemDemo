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
        let fileName = "playerName"
        let playerName = "Xander"
//        let path = FileManager.documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("txt")
        let path = URL(fileURLWithPath: "badfile.txt")
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

