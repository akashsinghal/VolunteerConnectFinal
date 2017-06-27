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
    
    var screenSize:CGRect = UIScreen.main.bounds
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
        scrollFrame.size = CGSize(width: screenSize.size.width, height: screenSize.size.height);
        advscrollViews.frame = scrollFrame;
        backgroundimg.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.light);
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
        advInterest.frame=CGRect(x: 0, y: screenSize.size.height * 0.01, width: screenSize.size.width, height: screenSize.size.height * 0.3)
        if(screenSize.size.width <= 350)
        {
            advChangeHoursSlider.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
            advChangeDaysSlider.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
            advnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 50)
        }
        else
        {
            advChangeHoursSlider.frame = CGRect(x: screenSize.size.width * 0.05, y: screenSize.size.height * 0.335, width: screenSize.size.width * 0.75, height: 30)
            advChangeDaysSlider.frame = CGRect(x: screenSize.size.width * 0.05, y: screenSize.size.height * 0.435, width: screenSize.size.width * 0.75, height: 30)
            advnavbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 60)
        }
        AdvSearchViewController.advSortedListOfAgencies.removeAll()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func advChangeHoursLabel(_ sender: UISlider) {
        advSelectedHour = Double(sender.value)
        let showHour1 = Int(advSelectedHour)
        advChangeHoursLabel.text = String(stringInterpolationSegment: showHour1)
    }
    @IBAction func advChangeDaysLabel(_ sender: UISlider) {
        advSelectedDays = Double(sender.value)
        let showDays1 = Int(advSelectedDays)
        advChangeDaysLabel.text = String(stringInterpolationSegment: showDays1)
    }
    @IBAction func advChangeMondaySwitch(_ sender: UISwitch) {
        advSelectedMonday = sender.isOn
    }
    @IBAction func advChangeTuesdaySwitch(_ sender: UISwitch) {
        advSelectedTuesday = sender.isOn
    }
    @IBAction func advChangeWednesdaySwitch(_ sender: UISwitch) {
        advSelectedWednesday = sender.isOn
    }
    @IBAction func advChangeThursdaySwitch(_ sender: UISwitch) {
        advSelectedThursday = sender.isOn
    }
    @IBAction func advChangeFridaySwitch(_ sender: UISwitch) {
        advSelectedFriday = sender.isOn
    }
    @IBAction func advChangeSaturdaySwitch(_ sender: UISwitch) {
        advSelectedSaturday = sender.isOn
    }
    @IBAction func advChangeSundaySwitch(_ sender: UISwitch) {
        advSelectedSunday = sender.isOn
    }
    //picker functions
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return areas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return areas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        advInterestPickerValue = areas[row]
    }
    
    func advshellSortAgencies(_ userPreferences: AdvUserInput)
    {
        for (x in 0 ..< AdvSearchViewController.advSortedListOfAgencies.count-1) {
            for(w in 0 ..< AdvSearchViewController.advSortedListOfAgencies.count-1)
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
    
    @IBAction func advStartSearching(_ sender: UIButton) {
        
        let user1 = AdvUserInput(areaOfInterest:advInterestPickerValue, numberOfHoursLeft:advSelectedHour,isSelectedMonday: advSelectedMonday, isSelectedTuesday: advSelectedTuesday, isSelectedWednesday:advSelectedWednesday, isSelectedThursday:advSelectedThursday, isSelectedFriday:advSelectedFriday, isSelectedSaturday: advSelectedSaturday, isSelectedSunday:advSelectedSunday, numDaysLeft: advSelectedDays)
        
        for y in 0 ..< AppDelegate.listOfAgencies.count   {
            if(user1.advGetUserAreaOfInterest() == AppDelegate.listOfAgencies[y].getTarget())
            {
            AdvSearchViewController.advSortedListOfAgencies.append(AppDelegate.listOfAgencies[y])
            }
        }
        advshellSortAgencies(user1)
        
    }

}
