//
//  ResultViewController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 6/18/16.
//  Copyright © 2016 VolIndustries. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController  {
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var descriptiontext: UITextView!
    
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var resultviewnavbar: UINavigationBar!
    @IBOutlet weak var distance: UILabel!
    var agencyname = String()//
    var hoursText = String()//
    var daysText = String()//
    var contactText = String() //
    var descriptionText = String()
    var distanceText = "" //
    var screenSize:CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Dispose of any resources that can be recreated.
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
