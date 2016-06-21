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
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var descriptiontext: UITextView!
    
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
    var screenSize:CGRect = UIScreen.mainScreen().bounds
    let mailComposeViewController = MFMailComposeViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailComposeViewController.mailComposeDelegate = self
        if(screenSize.size.width <= 350)
        {
            resultviewnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 50)
        }
        else
        {
            resultviewnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 60)
        }
        backgroundimg.frame=CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.Light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.insertSubview(blur2, atIndex: 0)
    }
    override func viewWillAppear(animated: Bool) {
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
    
    
    @IBAction func sendMail(sender: UIButton) {
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
        
        mc.setToRecipients([emailText])
        mc.setSubject("Interested in Volunteering")
        
        return mc;
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Error", message: "Whoops! Something went wrong. Check your e-mail settings and see if mail is enabled", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func callPhone(sender: UIButton) {
        if(RegSearchResultsController.printListOfAgencies[sender.tag].getPhoneNumber() != "N/A")
        {
            let callPhoneNumber:NSURL = NSURL(string: "telprompt://" + RegSearchResultsController.printListOfAgencies[sender.tag].getPhoneNumber())!
            UIApplication.sharedApplication().openURL(callPhoneNumber)
        }
        else
        {
            let control = UIAlertController(title: "No Phone Number Found", message:
                "Sorry, but this agency doesn't have a phone number :(", preferredStyle: UIAlertControllerStyle.Alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            
            self.presentViewController(control, animated: true, completion: nil)
            
        }

    }
    @IBAction func getDirections(sender: UIButton) {
        var tempUrl = "http://maps.apple.com/?daddr=\(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress())&dirflg=d&t=h"
        tempUrl = tempUrl.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        if(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress() != "N/A")
        {
            if let url = NSURL(string: tempUrl){
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else
        {
            
            let control = UIAlertController(title: "No Address Found", message: "Sorry, but we don't have an address for this agency :(", preferredStyle: UIAlertControllerStyle.Alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
            self.presentViewController(control, animated: true, completion: nil)
        }

    }

}
