//
//  ViewController.swift
//  segues
//
//  Created by Mark Hoath on 10/10/17.
//  Copyright © 2017 Mark Hoath. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var  cellLabel: String = ""
    
    @IBOutlet weak var myCellLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCellLabel.text = cellLabel
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        performSegue(withIdentifier: kUnwind, sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

