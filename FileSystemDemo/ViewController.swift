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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

