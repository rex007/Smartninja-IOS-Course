//
//  ViewController.swift
//  vreme
//
//  Created by Andraz Kuret on 12. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit
import CoreLocation


let apiKey = "c3a0ad1a3491fe0fb803fc709ef3d6cb"



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var locationView: UILabel!
    @IBOutlet weak var locationViewLayour: NSLayoutConstraint!
    @IBOutlet weak var weatherIconView: WeatherIconView!
    @IBOutlet weak var tempView: UILabel!
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didActivate", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func didActivate(){
        locationManager.startUpdatingLocation()
        
        loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        locationViewLayour.constant -= self.view.bounds.width
        weatherIconView.frame.origin.x -= self.view.bounds.width
        backgroundImg.alpha = 0.5
        
        loadData()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        

        UIView.animateWithDuration(2.0) {
            self.locationViewLayour.constant += self.view.bounds.width
            self.weatherIconView.frame.origin.x += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }
        
        UIView.animateWithDuration(2.5){
            self.backgroundImg.alpha = 1
            
            self.view.layoutIfNeeded()
        }
        

    
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            
            let intLat = Double(location.coordinate.latitude)
            let intLon = Double(location.coordinate.longitude)

            manager.stopUpdatingLocation()
            
            NSUserDefaults.standardUserDefaults().setObject("\(intLat)", forKey: "latitude")
            NSUserDefaults.standardUserDefaults().setObject("\(intLon)", forKey: "longitude")
            
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    

    
    func loadData() {
        
        let lon = NSUserDefaults.standardUserDefaults().objectForKey("longitude") as? String
        let lat = NSUserDefaults.standardUserDefaults().objectForKey("latitude") as? String
        
        let weatherURL = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat!)&lon=\(lon!)&units=metric&appid=\(apiKey)"
        
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: weatherURL)
        request.HTTPMethod = "GET"
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request){
            (data,response,error) -> Void in
            
            if error != nil || data == nil {
                return
            }
                do{
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! [String: AnyObject]
                    
                    let currentLocation = JSON["name"]
                    let weather = JSON["main"]!
                    
                    let description = JSON["weather"]![0]["description"] as! String
                    
                    var icon: WeatherIcon = .Sunny
                    
                    if description.containsString("cloud"){
                        icon = .Cloudy
                    }else if description.containsString("fog"){
                        icon = .Fog
                    }else if description.containsString("rain") {
                        icon = .Rain
                    }else if description.containsString("snow") {
                        icon = .Snow
                    }else if description.containsString("thunder") {
                        icon = .Storm
                    }
                    
//                    print("Lat: \(lat!), Lon: \(lon!)")
//                    print(currentLocation)
//                    print(description)
//                    print(icon)
            
                    
                    let temperature = weather as! [String : AnyObject]
                    
                    if let temp = temperature["temp"] as? NSNumber {
                        dispatch_async(dispatch_get_main_queue(), {
                            let numberFormater = NSString.localizedStringWithFormat("%.1f°", temp.floatValue) as String
                            self.tempView.text = numberFormater + "C"
                            self.locationView.text = currentLocation as? String
                            self.weatherIconView.iconType = icon
                        })
                        
                    }
                    
                }
                catch{
                    
                }
        }
        task.resume()
    }


}

