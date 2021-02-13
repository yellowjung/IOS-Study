//
//  ViewController.swift
//  IOS_Study
//
//  Created by 정영돈 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Refresh(_ sender: Any) {
        let alert = UIAlertController(title : "Test",
                                      message: "Hey!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action);
        present(alert, animated: true, completion: nil)
    }
    
}

