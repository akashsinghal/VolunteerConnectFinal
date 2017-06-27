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
    var screenSize:CGRect = UIScreen.main.bounds
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
        for (y in 0 ..< RegSearchResultsController.printListOfAgencies.count)
        {
            self.objects.add(RegSearchResultsController.printListOfAgencies[y].getName());
        }
        
        self.tableView.reloadData()
        
        if(screenSize.size.width <= 350)
        {
            searchnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 50)
        }
        else
        {
            searchnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 60)
        }
        searchtable.frame=CGRect(x: 0, y: 60, width: screenSize.size.width, height: screenSize.size.height - 60)
        
        
        backgroundimg.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.insertSubview(blur2, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.backgroundColor = cell.contentView.backgroundColor;
        cell.titleLabel.text = self.objects.object(at: indexPath.row) as? String
        cell.titleLabel.frame = CGRect(x: 7, y: 14, width: screenSize.size.width-15, height: 20);
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(!(sender is UIBarButtonItem)){
        let destination = segue.destination as? ResultViewController
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
