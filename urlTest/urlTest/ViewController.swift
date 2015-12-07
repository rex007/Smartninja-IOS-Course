//
//  ViewController.swift
//  urlTest
//
//  Created by Andraz Kuret on 23. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
    
    }
    
    func loadData(){
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: "https://randomuser.me/api/")
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if let data = data{
                
                do{
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                
                    if let dictionary = object as? [String: AnyObject]{
                        if let results = dictionary["results"] as? [AnyObject]{
                            if results.count > 0 {
                                if let user = results[0]["user"] as? [String: AnyObject]{
                                    let name = user["name"]!["first"] as! String
                    
                                    let url = user["picture"]!["large"]! as! String
                                
                                    let imageData = NSData(contentsOfURL: NSURL(string: url)!)
                                    let image = UIImage(data: imageData!)
                                    self.infoLabel.text = name
                                    self.imageView.image = image
                                }
                            }
                        }
                    }
                }
                catch{
                
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

