    //
//  AppDelegate.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/20/15.
//

import UIKit
import CoreLocation
import Firebase
import FirebaseDatabase
    
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var ref = FIRDatabaseReference.init()
    
    let locationManager = CLLocationManager()
    static var userLocation = CLLocation()
    static var listOfAgencies = [Agency]()
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        AppDelegate.userLocation = self.locationManager.location!
        print("hi")
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.locationManager.requestWhenInUseAuthorization();
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        FIRApp.configure()
        self.ref = FIRDatabase.database().reference()
        //let userLocation = AppDelegate.userLocation
        print(AppDelegate.userLocation.coordinate.latitude);
        print(AppDelegate.userLocation.coordinate.longitude);
        var name1 = ""
        var address1 = ""
        var target1 = ""
        var phoneNumber1 = ""
        var email1 = ""
        var hours1 = 0.0
        var monday1 = true
        var tuesday1 = true
        var wednesday1 = true
        var thursday1 = true
        var friday1 = true
        var saturday1 = true
        var sunday1 = true
        var url1 = ""
        var newaddress1 = ""
        var newdescription = ""
        self.ref.child("Agency").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            for agency in snapshot.children {
                name1 = agency.value!["Agency Name"] as! String
                address1 = agency.value!["Coordinates"] as! String
                target1 = agency.value!["Area of Interest"] as! String
                phoneNumber1 = agency.value!["Phone Number"] as! String
                email1 = agency.value!["Contact"] as! String
                hours1 =  agency.value!["Number of Hours"] as! Double
                monday1 = agency.value!["isMonday"] as! Bool
                tuesday1 = agency.value!["isTuesday"] as! Bool
                wednesday1 = agency.value!["isWednesday"] as! Bool
                thursday1 = agency.value!["isThursday"] as! Bool
                friday1 = agency.value!["isFriday"] as! Bool
                saturday1 = agency.value!["isSaturday"] as! Bool
                sunday1 = agency.value!["isSunday"] as! Bool
                url1 = agency.value!["Website"] as! String
                newaddress1 = agency.value!["Address"] as! String
                newdescription = agency.value!["Description"] as! String
                let coord = address1.componentsSeparatedByString(" ")
                var location: CLLocation
                location = CLLocation(latitude: Double(coord[0])!, longitude: Double(coord[1])!)
                let dist = (AppDelegate.userLocation.distanceFromLocation(location) / 1000) * 0.62137119
                
                AppDelegate.listOfAgencies.append(Agency.init(name: name1, distance: dist, target: target1, phoneNumber: phoneNumber1, email: email1, numberOfHours: hours1, isSelectedMonday: monday1, isSelectedTuesday: tuesday1, isSelectedWednesday: wednesday1, isSelectedThursday: thursday1, isSelectedFriday: friday1, isSelectedSaturday: saturday1, isSelectedSunday: sunday1, newurl: url1, newaddress: newaddress1, descript: newdescription))
                //print(newaddress1)
                
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

