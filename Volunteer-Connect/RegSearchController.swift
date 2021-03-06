//
//  RegSearchController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/21/15.
//

import UIKit

class RegSearchController: UIViewController {
    /*
    Instance Variables
    */
    var screenSize:CGRect = UIScreen.main.bounds

    var colors = ["Children","Elderly","Developmentally Disabled","Impoverished", "Environment"]
    var InterestPickerValue = "Children"
    var selectedMonday = true
    var selectedTuesday = true
    var selectedWednesday = true
    var selectedThursday = true
    var selectedFriday = true
    var selectedSaturday = true
    var selectedSunday = true
    var selectedHour = 0.0
    var selectedRadius = 0.0
    var strArray = [[AnyObject]]()
    static var sortedListOfAgencies = [Agency]()
    /*
    Instances of UI Elements
    */
    @IBOutlet weak var backgroundimg: UIImageView!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var MondaySwitch: UISwitch!
    @IBOutlet weak var TuesdaySwitch: UISwitch!
    @IBOutlet weak var WednesdaySwitch: UISwitch!
    @IBOutlet weak var ThursdaySwitch: UISwitch!
    @IBOutlet weak var FridaySwitch: UISwitch!
    @IBOutlet weak var SaturdaySwitch: UISwitch!
    @IBOutlet weak var SundaySwitch: UISwitch!
    @IBOutlet weak var InterestPicker: UIPickerView!
    @IBOutlet weak var HourSlider: UISlider!
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var RadiusSlider: UISlider!
    @IBOutlet weak var RadiusLabel: UILabel!
    @IBOutlet weak var startSearchingButton: UIButton!
    @IBOutlet weak var MondayLabel: UILabel!
    @IBOutlet weak var TuesdayLabel: UILabel!
    @IBOutlet weak var WednesdayLabel: UILabel!
    @IBOutlet weak var ThursdayLabel: UILabel!
    @IBOutlet weak var FridayLabel: UILabel!
    @IBOutlet weak var SaturdayLabel: UILabel!
    @IBOutlet weak var SundayLabel: UILabel!
    @IBOutlet weak var HoursPerSessionLabel: UILabel!
    @IBOutlet weak var RadiusofSearchLabel: UILabel!
    @IBOutlet weak var AreaOfInterestLabel: UILabel!
    
    @IBOutlet weak var scrollViews: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var scrollFrame = CGRect();
        scrollFrame.origin = scrollViews.frame.origin;
        scrollFrame.size = CGSize(width: screenSize.size.width, height: screenSize.size.height);
        backgroundimg.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.light);
        let blur2 = UIVisualEffectView(effect: blur);
        blur2.frame = backgroundimg.bounds;
        backgroundimg.addSubview(blur2);
        scrollViews.frame = scrollFrame;
        MondaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.535)
        TuesdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.535)
        WednesdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.615)
        ThursdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.615)
        FridaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) , y: screenSize.height * 0.695)
        SaturdaySwitch.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) , y: screenSize.height * 0.695)
        SundaySwitch.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.775)
        startSearchingButton.center=CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.838)
        MondayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 60 , y: screenSize.height * 0.535)
        TuesdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 62 , y: screenSize.height * 0.535)
        WednesdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 73 , y: screenSize.height * 0.615)
        ThursdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 66 , y: screenSize.height * 0.615)
        FridayLabel.center = CGPoint(x: ((screenSize.size.width / 2) - (screenSize.size.width * 0.11)) - 54, y: screenSize.height * 0.695)
        SaturdayLabel.center = CGPoint(x: ((screenSize.size.width / 2) + (screenSize.size.width * 0.11)) + 65 , y: screenSize.height * 0.695)
        SundayLabel.center = CGPoint(x: (screenSize.size.width / 2) + 59, y: screenSize.size.height * 0.775)
        HoursPerSessionLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.298)
        RadiusofSearchLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.40)
        InterestPicker.center = CGPoint (x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.15)
        AreaOfInterestLabel.center = CGPoint(x: (screenSize.size.width / 2) , y: screenSize.size.height * 0.03)
        //RegSearchController.listOfAgencies.removeAll()
        RegSearchController.sortedListOfAgencies.removeAll()
        HourSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.35)
        RadiusSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.452)
        HourLabel.center = CGPoint(x: (screenSize.size.width/2) + (screenSize.size.width * 0.46) , y: screenSize.size.height * 0.35)
        RadiusLabel.center = CGPoint (x: (screenSize.size.width/2) + (screenSize.size.width * 0.45) , y: screenSize.size.height * 0.452)
        InterestPicker.frame=CGRect(x: 0, y: screenSize.size.height * 0.01, width: screenSize.size.width, height: screenSize.size.height * 0.3)
        if(screenSize.size.width <= 350)
        {
            HourSlider.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
            RadiusSlider.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
            navbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 50)
        }
        else
        {
            HourSlider.frame = CGRect(x: screenSize.size.width * 0.05, y: screenSize.size.height * 0.335, width: screenSize.size.width * 0.75, height: 30)
            RadiusSlider.frame = CGRect(x: screenSize.size.width * 0.05, y: screenSize.size.height * 0.435, width: screenSize.size.width * 0.75, height: 30)
            navbar.frame=CGRect(x: 0, y: 0, width: screenSize.size.width, height: 60)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    Functions that recieve input from altering the UI elements
    */
    
    @IBAction func changeHours(_ sender: UISlider) {
        selectedHour = Double(sender.value)
        let showHour = Int(selectedHour)
        
        HourLabel.text = String(stringInterpolationSegment: showHour)
        
    }
    
    @IBAction func changeRadius(_ sender: UISlider) {
        selectedRadius = Double(sender.value)
        let showRadius = Int(selectedRadius)
        RadiusLabel.text = String(stringInterpolationSegment: showRadius)
    }
    
    @IBAction func changeMondaySwitch(_ sender: UISwitch) {
        selectedMonday = sender.isOn
    }
    
    @IBAction func changeTuesdaySwitch(_ sender: UISwitch) {
        selectedTuesday = sender.isOn
    }
    
    @IBAction func changeWednesdaySwitch(_ sender: UISwitch) {
        selectedWednesday = sender.isOn
    }
    
    @IBAction func changeThursdaySwitch(_ sender: UISwitch) {
        selectedThursday = sender.isOn
    }
    
    @IBAction func changeFridaySwitch(_ sender: UISwitch) {
        selectedFriday = sender.isOn
    }
    
    @IBAction func changeSaturdaySwitch(_ sender: UISwitch) {
        selectedSaturday = sender.isOn
    }
    
    @IBAction func changeSundaySwitch(_ sender: UISwitch) {
        selectedSunday = sender.isOn
    }
    
    /*
    Functions for the Picker
    */
    
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        InterestPickerValue=colors[row]
    }
    
    /*
    Reads the file into a string array
    */
    
//    func readFile() {
//        var strFile = ""
//        let strpath = NSBundle.mainBundle().pathForResource("VolData", ofType: "csv")
//        do{
//            strFile = try String(contentsOfFile: strpath!, encoding: NSUTF8StringEncoding)
//        }
//        catch{
//            NSLog("There was a problem")
//        }
//        var data: [AnyObject] = [AnyObject]()
//        data = strFile.componentsSeparatedByString("\n")
//        for var y = 0; y < data.count; y += 1{
//            var translation = data[y].componentsSeparatedByString(",");
//            strArray.append(data[y].componentsSeparatedByString(","));
//            for var i = 0; i < 15; i += 1 {
//                strArray[y].append(translation [i]);
//            }
//        }
//    }
    
    /*
    Sorts the Agencies by order of their percent match
    */
    func shellSortAgencies(_ userPreferences: UserInput)
    {
        for (x, in 0 ..< RegSearchController.sortedListOfAgencies.count-1) {
            for(w in 0 ..< RegSearchController.sortedListOfAgencies.count-1)
            {
                if(RegSearchController.sortedListOfAgencies[w+1].percentMatch(userPreferences) > RegSearchController.sortedListOfAgencies[w].percentMatch(userPreferences))
                {
                    let temp = RegSearchController.sortedListOfAgencies[w];
                    RegSearchController.sortedListOfAgencies[w]=RegSearchController.sortedListOfAgencies[w+1];
                    RegSearchController.sortedListOfAgencies[w+1]=temp;
                }
            }
        }
    }

    @IBAction func StartSearching(_ sender: AnyObject) {
        
        let user = UserInput(areaOfInterest:InterestPickerValue, numberOfHours:selectedHour, distance:selectedRadius, isSelectedMonday: selectedMonday,isSelectedTuesday: selectedTuesday, isSelectedWednesday:selectedWednesday, isSelectedThursday:selectedThursday, isSelectedFriday:selectedFriday, isSelectedSaturday: selectedSaturday, isSelectedSunday:selectedSunday)
        
////        for (var x = 1; x < strArray.count; x += 1) {
////            name1 = ((strArray [x]) [0]) as! String
////            address1 = (strArray[x])[1] as! String
////            target1 = (strArray[x])[2] as! String
////            phoneNumber1 = (strArray[x])[3] as! String
////            email1 = (strArray[x])[4] as! String
////            hours1 =  Double((strArray[x])[5] as! String)!
////            if(((strArray[x])[6] as! String) == "TRUE"){monday1 = true}
////            else{monday1 = false}
////            if(((strArray[x])[7] as! String) == "TRUE"){tuesday1 = true}
////            else{tuesday1 = false}
////            if(((strArray[x])[8] as! String) == "TRUE"){wednesday1 = true}
////            else{wednesday1 = false}
////            if(((strArray[x])[9] as! String) == "TRUE"){thursday1 = true}
////            else{thursday1 = false}
////            if(((strArray[x])[10] as! String) == "TRUE"){friday1 = true}
////            else{friday1 = false}
////            if(((strArray[x])[11] as! String) == "TRUE"){saturday1 = true}
////            else{saturday1 = false}
////            if(((strArray[x])[12] as! String) == "TRUE"){sunday1 = true}
////            else{sunday1 = false}
////            url1 = (strArray[x])[14] as! String
////            newaddress1 = (strArray[x])[13] as! String
//        
//            let coord = address1.componentsSeparatedByString(" ")
//            
//            location = CLLocation(latitude: Double(coord[0])!, longitude: Double(coord[1])!)
//            
//            let dist = (userLocation.distanceFromLocation(location) / 1000) * 0.62137119
//            
//            listOfAgencies.append(Agency(name: name1, distance: dist, target: target1, phoneNumber: phoneNumber1, email: email1, numberOfHours: hours1, isSelectedMonday: monday1, isSelectedTuesday: tuesday1, isSelectedWednesday: wednesday1, isSelectedThursday: thursday1, isSelectedFriday: friday1, isSelectedSaturday: saturday1, isSelectedSunday: sunday1, newurl: url1, newaddress: newaddress1))
//            
//        }
        for y in 0 ..< AppDelegate.listOfAgencies.count
            {
            if(user.getUserAreaOfInterest() == AppDelegate.listOfAgencies[y].getTarget())
            {
            RegSearchController.sortedListOfAgencies.append(AppDelegate.listOfAgencies[y])
            }
        }
        
    shellSortAgencies(user);
        
    }
}
