//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Andraz Kuret on 2. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var slika: UIImage?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        imageView.image = slika
    
    }
    
    @IBOutlet weak var imageView: UIImageView!

}