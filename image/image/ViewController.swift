//
//  ViewController.swift
//  image
//
//  Created by Andraz Kuret on 19. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "who")
        imageView = UIImageView(image: image)
       
        scrollView.addSubview(imageView!)
        scrollView.contentSize = image!.size
        
        scrollView.delegate = self
        
        let recognizer = UIGestureRecognizer(target: self, action: "rotated:")
        
        scrollView.addGestureRecognizer(recognizer)
    }
        
    func rotated(recognizer: UIRotationGestureRecognizer){
        scrollView.transform = CGAffineTransformMakeRotation(recognizer.rotation)
    }
    
   



}

