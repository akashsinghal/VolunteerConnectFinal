//
//  AdvSearchViewController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/27/15.
//

import UIKit

class AdvSearchViewController: UIViewController {
    
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var advChangeHoursSlider: UISlider!
    @IBOutlet weak var advChangeHoursLabel: UILabel!
    @IBOutlet weak var advChangeDaysSlider: UISlider!
    @IBOutlet weak var advChangeDaysLabel: UILabel!
    @IBOutlet weak var advInterest: UIPickerView!
    @IBOutlet weak var advMondaySwitch: UISwitch!
    @IBOutlet weak var advTuesdaySwitch: UISwitch!
    @IBOutlet weak var advWednesdaySwitch: UISwitch!
    @IBOutlet weak var advThursdaySwitch: UISwitch!
    @IBOutlet weak var advFridaySwitch: UISwitch!
    @IBOutlet weak var advSaturdaySwitch: UISwitch!
    @IBOutlet weak var advSundaySwitch: UISwitch!
    @IBOutlet weak var advAreaOfInterestLabel: UILabel!
    @IBOutlet weak var advHoursLeftLabel: UILabel!
    @IBOutlet weak var advDaysLeftLabel: UILabel!
    @IBOutlet weak var advMondayLabel: UILabel!
    @IBOutlet weak var advTuesdayLabel: UILabel!
    @IBOutlet weak var advWednesdayLabel: UILabel!
    @IBOutlet weak var advThursdayLabel: UILabel!
    @IBOutlet weak var advFridayLabel: UILabel!
    @IBOutlet weak var advSaturdayLabel: UILabel!
    @IBOutlet weak var advSundayLabel: UILabel!
    @IBOutlet weak var advnavbar: UINavigationBar!
    @IBOutlet weak var advscrollViews: UIScrollView!
    @IBOutlet weak var advStartSeachingButton: UIButton!
    
    var screenSize:CGRect = UIScreen.mainScreen().bounds
    var areas = ["Children","Elderly","Developmentally Disabled","Impoverished", "Environment"]
    var advInterestPickerValue = "Children"
    var advSelectedMonday = true
    var advSelectedTuesday = true
    var advSelectedWednesday = true
    var advSelectedThursday = true
    var advSelectedFriday = true
    var advSelectedSaturday = true
    var advSelectedSunday = true
    var advSelectedHour = 0.0
    var advSelectedDays = 0.0
    var advStrArray = [[AnyObject]]()
    static var advSortedListOfAgencies = [Agency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var scrollFrame = CGRect();
        scrollFrame.origin = advscrollViews.frame.origin;
        scrollFrame.size = CGSizeMake(screenSize.size.width, screenSize.size.height);
        advscrollViews.frame = scrollFrame;
        backgroundimg.frame=CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.Light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.addSubview(blur2);
        advMondaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.535)
        advTuesdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.535)
        advWednesdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.615)
        advThursdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.615)
        advFridaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.695)
        advSaturdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.695)
        advSundaySwitch.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.775)
        advStartSeachingButton.center=CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.838)
        advMondayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 60 , y: screenSize.height * 0.535)
        advTuesdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 62 , y: screenSize.height * 0.535)
        advWednesdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 73 , y: screenSize.height * 0.615)
        advThursdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 66 , y: screenSize.height * 0.615)
        advFridayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 54, y: screenSize.height * 0.695)
        advSaturdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 65 , y: screenSize.height * 0.695)
        advSundayLabel.center = CGPoint(x: (screenSize.size.width / 2) + 59, y: screenSize.size.height * 0.775)
        advHoursLeftLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.298)
        advDaysLeftLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.40)
        advInterest.center = CGPoint (x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.15)
        advAreaOfInterestLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.03)
        
        RegSearchController.sortedListOfAgencies.removeAll()
        advChangeHoursSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.35)
        advChangeDaysSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.452)
        advChangeHoursLabel.center = CGPoint(x: (screenSize.size.width/2) + (screenSize.size.width * 0.46) , y: screenSize.size.height * 0.35)
        advChangeDaysLabel.center = CGPoint (x: (screenSize.size.width/2) + (screenSize.size.width * 0.45) , y: screenSize.size.height * 0.452)
        advInterest.frame=CGRectMake(0, screenSize.size.height * 0.01, screenSize.size.width, screenSize.size.height * 0.3)
        if(screenSize.size.width <= 350)
        {
            advChangeHoursSlider.transform = CGAffineTransformMakeScale(0.75, 0.75);
            advChangeDaysSlider.transform = CGAffineTransformMakeScale(0.75, 0.75);
            advnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 50)
        }
        else
        {
            advChangeHoursSlider.frame = CGRectMake(screenSize.size.width * 0.05, screenSize.size.height * 0.335, screenSize.size.width * 0.75, 30)
            advChangeDaysSlider.frame = CGRectMake(screenSize.size.width * 0.05, screenSize.size.height * 0.435, screenSize.size.width * 0.75, 30)
            advnavbar.frame=CGRectMake(0, 0, screenSize.size.width, 60)
        }
        AdvSearchViewController.advSortedListOfAgencies.removeAll()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func advChangeHoursLabel(sender: UISlider) {
        advSelectedHour = Double(sender.value)
        let showHour1 = Int(advSelectedHour)
        advChangeHoursLabel.text = String(stringInterpolationSegment: showHour1)
    }
    @IBAction func advChangeDaysLabel(sender: UISlider) {
        advSelectedDays = Double(sender.value)
        let showDays1 = Int(advSelectedDays)
        advChangeDaysLabel.text = String(stringInterpolationSegment: showDays1)
    }
    @IBAction func advChangeMondaySwitch(sender: UISwitch) {
        advSelectedMonday = sender.on
    }
    @IBAction func advChangeTuesdaySwitch(sender: UISwitch) {
        advSelectedTuesday = sender.on
    }
    @IBAction func advChangeWednesdaySwitch(sender: UISwitch) {
        advSelectedWednesday = sender.on
    }
    @IBAction func advChangeThursdaySwitch(sender: UISwitch) {
        advSelectedThursday = sender.on
    }
    @IBAction func advChangeFridaySwitch(sender: UISwitch) {
        advSelectedFriday = sender.on
    }
    @IBAction func advChangeSaturdaySwitch(sender: UISwitch) {
        advSelectedSaturday = sender.on
    }
    @IBAction func advChangeSundaySwitch(sender: UISwitch) {
        advSelectedSunday = sender.on
    }
    //picker functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return areas.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return areas[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        advInterestPickerValue = areas[row]
    }
    
    func advshellSortAgencies(userPreferences: AdvUserInput)
    {
        for (var x = 0; x < AdvSearchViewController.advSortedListOfAgencies.count-1; x += 1) {
            for(var w = 0; w < AdvSearchViewController.advSortedListOfAgencies.count-1; w+=1)
            {
                if(AdvSearchViewController.advSortedListOfAgencies[w+1].percentMatch(userPreferences) > AdvSearchViewController.advSortedListOfAgencies[w].percentMatch(userPreferences))
                {
                    let temp = AdvSearchViewController.advSortedListOfAgencies[w];
                    AdvSearchViewController.advSortedListOfAgencies[w]=AdvSearchViewController.advSortedListOfAgencies[w+1];
                    AdvSearchViewController.advSortedListOfAgencies[w+1]=temp;
                }
            }
        }
    }
    
    @IBAction func advStartSearching(sender: UIButton) {
        
        let user1 = AdvUserInput(areaOfInterest:advInterestPickerValue, numberOfHoursLeft:advSelectedHour,isSelectedMonday: advSelectedMonday, isSelectedTuesday: advSelectedTuesday, isSelectedWednesday:advSelectedWednesday, isSelectedThursday:advSelectedThursday, isSelectedFriday:advSelectedFriday, isSelectedSaturday: advSelectedSaturday, isSelectedSunday:advSelectedSunday, numDaysLeft: advSelectedDays)
        
        for var y = 0; y < AppDelegate.listOfAgencies.count; y += 1    {
            if(user1.advGetUserAreaOfInterest() == AppDelegate.listOfAgencies[y].getTarget())
            {
            AdvSearchViewController.advSortedListOfAgencies.append(AppDelegate.listOfAgencies[y])
            }
        }
        advshellSortAgencies(user1)
        
    }

}
