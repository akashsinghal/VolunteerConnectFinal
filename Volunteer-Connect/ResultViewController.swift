//
//  ResultViewController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 6/18/16.
//  Copyright © 2016 VolIndustries. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController  {
    @IBOutlet weak var AgencyName: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var descriptiontext: UITextView!
    
    @IBOutlet weak var distance: UILabel!
    var agencyname = String()
    var hoursText = String()
    var daysText = String()
    var contactText = String()
    var descriptionText = String()
    var distanceText = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        AgencyName.text = agencyname;
        hours.text = hoursText;
        days.text = daysText;
        contact.text = contactText;
        descriptiontext.text = descriptionText;
        distance.text = distanceText;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func callPhone(sender: UIButton) {
    }
    @IBAction func getDirections(sender: UIButton) {
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
