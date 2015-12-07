//
//  ImageViewController.swift
//  toDo
//
//  Created by Andraz Kuret on 2. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

@objc protocol ImageViewControllerDelegate{
    func imageViewControllerDidFinish(imageViewController: ImageViewController)
}

class ImageViewController: UIViewController{
    weak var delegate: ImageViewControllerDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    

    @IBAction func doneButton(sender: UIButton) {
        delegate?.imageViewControllerDidFinish(self)
    }
}