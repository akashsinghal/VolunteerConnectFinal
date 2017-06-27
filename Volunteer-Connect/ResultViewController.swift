//
//  ResultViewController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 6/18/16.
//  Copyright © 2016 VolIndustries. All rights reserved.
//

import UIKit
import MessageUI

class ResultViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var distancetext: UILabel!
    @IBOutlet weak var hourstext: UILabel!
    @IBOutlet weak var daystext: UILabel!
    @IBOutlet weak var contacttext: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var descriptiontext: UITextView!
    @IBOutlet weak var contacttextreal: UILabel!
    
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var resultviewnavbar: UINavigationBar!
    @IBOutlet weak var distance: UILabel!
    var agencyname = String()
    var hoursText = String()
    var daysText = String()
    var contactText = String()
    var descriptionText = String()
    var emailText = String()
    var distanceText = ""
    var screenSize:CGRect = UIScreen.main.bounds
    let mailComposeViewController = MFMailComposeViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancetext.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.31)) , y: screenSize.height * 0.135)
        distance.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.31) + 175) , y: screenSize.height * 0.135)
        hourstext.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.335)) , y: screenSize.height * 0.22)
        hours.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.335) + 160) , y: screenSize.height * 0.22)
        daystext.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.345)) , y: screenSize.height * 0.305)
        days.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.345) + 175) , y: screenSize.height * 0.305)
        contacttextreal.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.315)) , y: screenSize.height * 0.39)
        contact.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.315) + 175) , y: screenSize.height * 0.39)
        contacttext.center = CGPoint(x: ((screenSize.size.width / 2)) , y: (screenSize.height * 0.45))
        
                mailComposeViewController.mailComposeDelegate = self
        if(screenSize.size.width <= 350)
        {
            descriptiontext.center = CGPoint(x: ((screenSize.size.width / 2) + 5) , y: (screenSize.height * 0.66))
            resultviewnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 50)
            emailButton.center = CGPoint(x: ((screenSize.size.width * 0.15)) , y: (screenSize.height * 0.875) + 25)
            phoneButton.center = CGPoint(x: ((screenSize.size.width * 0.455)) , y: (screenSize.height * 0.875) + 25)
            directionButton.center = CGPoint(x: ((screenSize.size.width * 0.805)) , y: (screenSize.height * 0.875) + 25)

        }
        else
        {
            descriptiontext.center = CGPoint(x: ((screenSize.size.width / 2) + 5) , y: (screenSize.height * 0.63))
            emailButton.center = CGPoint(x: ((screenSize.size.width * 0.15)) , y: (screenSize.height * 0.875))
            phoneButton.center = CGPoint(x: ((screenSize.size.width * 0.455)) , y: (screenSize.height * 0.875))
            directionButton.center = CGPoint(x: ((screenSize.size.width * 0.805)) , y: (screenSize.height * 0.875))

            resultviewnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 60)
        }
        backgroundimg.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.insertSubview(blur2, at: 0)
    }
    override func viewWillAppear(_ animated: Bool) {
        hours.text = hoursText;
        days.text = daysText;
        contact.text = contactText;
        descriptiontext.text = descriptionText;
        distance.text = distanceText;
        resultviewnavbar.topItem!.title = agencyname;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func isValidEmail(_ testStr:String) -> Bool {
        let format1 = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let check = NSPredicate(format:"SELF MATCHES %@", format1)
        return check.evaluate(with: testStr)
    }
    
    @IBAction func sendMail(_ sender: UIButton) {
        if(isValidEmail(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getEmail()))
        {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        }
        else{
            let control = UIAlertController(title: "No Email Found", message:
                "Sorry, but this agency doesn't have an email :(", preferredStyle: UIAlertControllerStyle.alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            
            self.present(control, animated: true, completion: nil)
        }
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        emailText = RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getEmail()
        mc.setToRecipients([emailText])
        mc.setSubject("Interested in Volunteering")
        
        return mc;
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Error", message: "Whoops! Something went wrong. Check your e-mail settings and see if mail is enabled", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func callPhone(_ sender: UIButton) {
        if(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getPhoneNumber() != "N/A")
        {
            let callPhoneNumber:URL = URL(string: "telprompt://" + RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getPhoneNumber())!
            UIApplication.shared.openURL(callPhoneNumber)
        }
        else
        {
            let control = UIAlertController(title: "No Phone Number Found", message:
                "Sorry, but this agency doesn't have a phone number :(", preferredStyle: UIAlertControllerStyle.alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            
            self.present(control, animated: true, completion: nil)
            
        }

    }
    @IBAction func getDirections(_ sender: UIButton) {
        var tempUrl = "http://maps.apple.com/?daddr=\(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress())&dirflg=d&t=h"
        tempUrl = tempUrl.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range: nil)
        //print(RegSearchResultsController.itemNum)
        if(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress() != "N/A")
        {
            if let url = URL(string: tempUrl){
                UIApplication.shared.openURL(url)
            }
        }
        else
        {
            
            let control = UIAlertController(title: "No Address Found", message: "Sorry, but we don't have an address for this agency :(", preferredStyle: UIAlertControllerStyle.alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler:nil))
            self.present(control, animated: true, completion: nil)
        }

    }

}
