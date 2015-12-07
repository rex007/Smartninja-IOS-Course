//
//  ViewController.swift
//  experiment
//
//  Created by Andraz Kuret on 29. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func press(sender: UIButton) {
        let nextControllet = UIImagePickerController()
        
        self.presentViewController(nextControllet, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

