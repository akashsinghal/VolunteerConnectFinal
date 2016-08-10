//
//  RegSearchResultsController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/21/15.
//

import UIKit
import MessageUI
import Foundation

class RegSearchResultsController: UIViewController{
    
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchtable: UITableView!
    @IBOutlet weak var searchnavbar: UINavigationBar!
    
    var objects: NSMutableArray! = NSMutableArray()
    static var printListOfAgencies = [Agency]();
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        cell.titleLabel.frame = CGRectMake(7, 14, screenSize.size.width-15, 20);
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(!(sender is UIBarButtonItem)){
        let destination = segue.destinationViewController as? ResultViewController
        let inndex = tableView.indexPathForSelectedRow?.row
            RegSearchResultsController.itemNum = inndex!;
        var textBoxString = ""
        destination!.agencyname = RegSearchResultsController.printListOfAgencies[inndex!].getName()
        destination!.contactText = RegSearchResultsController.printListOfAgencies[inndex!].getEmail()
        destination!.distanceText = String(round(RegSearchResultsController.printListOfAgencies[inndex!].agencyDistance)) + " mi"
        destination!.contactText = RegSearchResultsController.printListOfAgencies[inndex!].getEmail()
        destination!.hoursText = String(round(RegSearchResultsController.printListOfAgencies[inndex!].getHours())) + " hrs"
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenSunday())   {
            textBoxString =  textBoxString + "Sun "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenMonday())   {
            textBoxString = textBoxString + "Mon "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenTuesday())  {
            textBoxString = textBoxString + "Tue "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenWednesday())    {
            textBoxString = textBoxString + "Wed "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenThursday()) {
            textBoxString = textBoxString + "Thu "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenFriday())   {
            textBoxString = textBoxString + "Fri "
        }
        
        if (RegSearchResultsController.printListOfAgencies[inndex!].getIsOpenSaturday()) {
            textBoxString = textBoxString + "Sat "
        }
        destination!.daysText = textBoxString;
        destination!.descriptionText = RegSearchResultsController.printListOfAgencies[inndex!].getDescription();
            destination!.emailText = RegSearchResultsController.printListOfAgencies[inndex!].getEmail();}
        
    }
    
    

//    @IBAction func infoAction(sender: UIButton)
//    {
//        RegSearchResultsController.itemNum = sender.tag
//        var textBoxString = "Distance: \(Int(RegSearchResultsController.printListOfAgencies[sender.tag].agencyDistance)) mi.\nNumber of Hours: \(RegSearchResultsController.printListOfAgencies[sender.tag].getHours())\nContact: \(RegSearchResultsController.printListOfAgencies[sender.tag].getEmail())\nDays Open: "
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenSunday())   {
//            textBoxString =  textBoxString + "Sun "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenMonday())   {
//            textBoxString = textBoxString + "Mon "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenTuesday())  {
//            textBoxString = textBoxString + "Tue "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenWednesday())    {
//            textBoxString = textBoxString + "Wed "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenThursday()) {
//            textBoxString = textBoxString + "Thu "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenFriday())   {
//            textBoxString = textBoxString + "Fri "
//        }
//        
//        if (RegSearchResultsController.printListOfAgencies[sender.tag].getIsOpenSaturday()) {
//            textBoxString = textBoxString + "Sat "
//        }
//        let alertInfo = UIAlertView()
//        alertInfo.delegate = self
//        alertInfo.message = textBoxString
//        alertInfo.addButtonWithTitle("Show In Maps")
//        alertInfo.addButtonWithTitle("Dismiss")
//        alertInfo.title = RegSearchResultsController.printListOfAgencies[sender.tag].getName()
//        alertInfo.show()
//    }
//    
//    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
//        switch buttonIndex{
//        case 0:
//            var tempUrl = "http://maps.apple.com/?daddr=\(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress())&dirflg=d&t=h"
//            tempUrl = tempUrl.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
//            
//            if(RegSearchResultsController.printListOfAgencies[RegSearchResultsController.itemNum].getAddress() != "N/A")
//            {
//                if let url = NSURL(string: tempUrl){
//                UIApplication.sharedApplication().openURL(url)
//                }
//            }
//            else
//            {
//                
//                let control = UIAlertController(title: "No Address Found", message: "Sorry, but we don't have an address for this agency :(", preferredStyle: UIAlertControllerStyle.Alert)
//                control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
//                self.presentViewController(control, animated: true, completion: nil)
//            }
//        default:
//            print("");
//        }
//        
//    }
//    @IBAction func sendURL(sender: UIButton) {
//        
//        var tempurl = RegSearchResultsController.printListOfAgencies[sender.tag].getURL()
//        tempurl = tempurl.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
//        if(tempurl != "N/A")
//        {
//            if let url = NSURL(string: tempurl) {
//                UIApplication.sharedApplication().openURL(url)
//            }
//        }
//        else
//        {
//            
//            let control = UIAlertController(title: "No Website Found", message: "Sorry, but this agency doesn't have a website :(", preferredStyle: UIAlertControllerStyle.Alert)
//            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler:nil))
//            self.presentViewController(control, animated: true, completion: nil)
//        }
//    }
//
//
//    @IBAction func callPhone(sender: UIButton) {
//        if(RegSearchResultsController.printListOfAgencies[sender.tag].getPhoneNumber() != "N/A")
//        {
//        let callPhoneNumber:NSURL = NSURL(string: "telprompt://" + RegSearchResultsController.printListOfAgencies[sender.tag].getPhoneNumber())!
//        UIApplication.sharedApplication().openURL(callPhoneNumber)
//        }
//        else
//        {
//            let control = UIAlertController(title: "No Phone Number Found", message:
//                "Sorry, but this agency doesn't have a phone number :(", preferredStyle: UIAlertControllerStyle.Alert)
//            control.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//            
//            
//            self.presentViewController(control, animated: true, completion: nil)
//
//        }
//    }
}
