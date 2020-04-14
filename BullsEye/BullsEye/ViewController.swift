//
//  ViewController.swift
//  BullsEye
//
//  Created by Syed ali Abbas on 4/13/20.
//  Copyright © 2020 Syed ali Abbas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert () {
        let alert = UIAlertController(title: "Hello World", message: "This is my First App!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    

}

