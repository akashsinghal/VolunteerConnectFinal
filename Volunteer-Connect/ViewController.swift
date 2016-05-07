//
//  ViewController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/20/15.
//

import UIKit
import CoreLocation
import MessageUI

class ViewController: UIViewController, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate {
    
    static var searchType = 0;
    
    let locationManager = CLLocationManager()
    static var userLocation = CLLocation()
    
    let mailComposeViewController = MFMailComposeViewController()
    var screenSize:CGRect = UIScreen.mainScreen().bounds
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var RegularSearchLabel: UIButton!
    @IBOutlet weak var InARushLabel: UIButton!
    @IBOutlet weak var ContactUsLabel: UIButton!
    @IBOutlet weak var AddAgencyLabel: UIButton!
    @IBOutlet weak var HomeScreenPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mailComposeViewController.mailComposeDelegate = self
        
        TitleLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.09)
        HomeScreenPic.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.45)
        HomeScreenPic.transform = CGAffineTransformMakeScale(screenSize.size.width/310, screenSize.size.width/310);
        RegularSearchLabel.center = CGPoint(x: (screenSize.size.width / 2) - (screenSize.size.width * 0.2) , y: screenSize.size.height * 0.8);
        InARushLabel.center = CGPoint(x: (screenSize.size.width / 2) + (screenSize.size.width * 0.25) , y: screenSize.size.height * 0.8);
        ContactUsLabel.center = CGPoint(x: (screenSize.size.width / 2) - (screenSize.size.width * 0.2) , y: screenSize.size.height * 0.9);
        AddAgencyLabel.center = CGPoint(x: (screenSize.size.width / 2) + (screenSize.size.width * 0.25) , y: screenSize.size.height * 0.9);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToRegSearch(sender: AnyObject) {
        ViewController.searchType = 1;
    }
    
    @IBAction func goToAdvSearch(sender: AnyObject) {
        ViewController.searchType = 2;
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        ViewController.userLocation = self.locationManager.location!
    }
    
    @IBAction func contactUs(sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(["contactvolunteerconnect@gmail.com"])
        mc.setSubject("Interested in Volunteer Connect")
        
        return mc;
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Error", message: "Whoops! Something went wrong. Check your e-mail settings and see if mail is enabled", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func userAddAgency(sender: UIButton) {
        if let url = NSURL(string: "https://docs.google.com/forms/d/1nJR-8aBcpZFzk1MhAufyyS5XUtTgYGkt4WrPQDNkZs4/viewform?usp=send_form") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}

