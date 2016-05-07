//
//  RegSearchResultsController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/21/15.
//

import UIKit
import MessageUI

class RegSearchResultsController: UIViewController, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchtable: UITableView!
    @IBOutlet weak var searchnavbar: UINavigationBar!
    
    var objects: NSMutableArray! = NSMutableArray()
    static var printListOfAgencies = [Agency]();
    let mailComposeViewController1 = MFMailComposeViewController();
    var screenSize:CGRect = UIScreen.mainScreen().bounds
    static var itemNum = 0
    
    override func viewDidLoad() {
        
    
        RegSearchResultsController.printListOfAgencies.removeAll()
        super.viewDidLoad()
        if(ViewController.searchType == 1)
        {
            RegSearchResultsController.printListOfAgencies = RegSearchController.sortedListOfAgencies;
        }
        else
        {
            RegSearchResultsController.printListOfAgencies = AdvSearchViewController.advSortedListOfAgencies;
        }
        for (var y = 0; y < RegSearchResultsController.printListOfAgencies.count; y += 1)
        {
            self.objects.addObject(RegSearchResultsController.printListOfAgencies[y].getName());
        }
        
        self.tableView.reloadData()
        mailComposeViewController1.mailComposeDelegate = self
        
        if(screenSize.size.width <= 350)
        {
            searchnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 50)
        }
        else
        {
            searchnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 60)
        }
        searchtable.frame=CGRectMake(0, 60, screenSize.size.width, screenSize.size.height - 60)
        
        
        backgroundimg.frame=CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.Light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.insertSubview(blur2, atIndex: 0)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        cell.backgroundColor = cell.contentView.backgroundColor;
        cell.titleLabel.text = self.objects.objectAtIndex(indexPath.row) as? String
        cell.infoButton.tag = indexPath.row;
        cell.urlbutton.tag = indexPath.row;
        cell.phoneButton.tag = indexPath.row;
        cell.infoButton.addTarget(self, action: #selector(RegSearchResultsController.infoAction(_:)) , forControlEvents: .TouchUpInside)
        cell.urlbutton.addTarget(self, action: #selector(RegSearchResultsController.sendURL(_:)) , forControlEvents: .TouchUpInside)
        cell.phoneButton.addTarget(self, action: #selector(RegSearchResultsController.callPhone(_:)) , forControlEvents: .TouchUpInside)
        cell.titleLabel.frame = CGRectMake(7, 14, screenSize.size.width - 98, 20);
        cell.urlbutton.center = CGPoint( x: (screenSize.size.width) - 20 , y: 23);
        cell.phoneButton.center = CGPoint(x: (screenSize.size.width) - 47 , y: 23);
        cell.infoButton.center = CGPoint(x: (screenSize.size.width) - 76 , y: 23);
        
        return cell
    }
    
    
    @IBAction func infoAction(sender: UIButton)
    {
        RegSearchResultsController.itemNum = sender.tag
        var textBoxString = "Distance: \(Int(RegSearchResultsController.printListOfAgencies[sender.tag].agencyDistance)) mi.\nNumber of Hours: \(RegSearchResultsController.printListOfAgencies[sender.tag].getHours())\nContact: \(RegSearchResultsController.printListOfAgencies[sender.tag].getEmail())\nDays Open: "
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenSunday())   {
            textBoxString =  textBoxString + "Sunday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenMonday())   {
            textBoxString = textBoxString + "Monday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenTuesday())  {
            textBoxString = textBoxString + "Tuesday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenWednesday())    {
            textBoxString = textBoxString + "Wednesday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenThursday()) {
            textBoxString = textBoxString + "Thursday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenFriday())   {
            textBoxString = textBoxString + "Friday "
        }
        
        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenSaturday()) {
            textBoxString = textBoxString + "Saturday "
        }
        let alertInfo = UIAlertView()
        alertInfo.delegate = self
        alertInfo.message = textBoxString
        alertInfo.addButtonWithTitle("Show In Maps")
        alertInfo.addButtonWithTitle("Dismiss")
        alertInfo.title = RegSearchResultsController.printListOfAgencies[sender.tag].getName()
        alertInfo.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        switch buttonIndex{
        case 0:
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
        default:
            print("");
        }
        
    }
    @IBAction func sendURL(sender: UIButton) {
        
        var tempurl = RegSearchResultsController.printListOfAgencies[sender.tag].getURL()
        tempurl = tempurl.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        if(tempurl != "N/A")
        {
            if let url = NSURL(string: tempurl) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        else
        {
            
            let control = UIAlertController(title: "No Website Found", message: "Sorry, but this agency doesn't have a website :(", preferredStyle: UIAlertControllerStyle.Alert)
            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
            self.presentViewController(control, animated: true, completion: nil)
        }
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
}
