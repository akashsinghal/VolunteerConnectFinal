//
//  RegSearchController.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/21/15.
//

import UIKit
import CoreLocation
import Firebase
import FirebaseDatabase
class RegSearchController: UIViewController {
    /*
    Instance Variables
    */
    var screenSize:CGRect = UIScreen.mainScreen().bounds

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
    var listOfAgencies = [Agency]()
    static var sortedListOfAgencies = [Agency]()
    var ref = FIRDatabaseReference.init()
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
        self.ref = FIRDatabase.database().reference()
        ref.child("Agency").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            for agency in snapshot.children {
                let readinaddress = agency.value!["Address"] as! String
                print(readinaddress)
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        super.viewDidLoad()
        var scrollFrame = CGRect();
        scrollFrame.origin = scrollViews.frame.origin;
        scrollFrame.size = CGSizeMake(screenSize.size.width, screenSize.size.height);
        backgroundimg.frame=CGRectMake(0, 0, screenSize.size.width, screenSize.size.height);
        let blur = UIBlurEffect (style: UIBlurEffectStyle.Light);
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
        listOfAgencies.removeAll()
        RegSearchController.sortedListOfAgencies.removeAll()
        HourSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.35)
        RadiusSlider.center = CGPoint(x: (screenSize.size.width/2) - (screenSize.size.width * 0.1) , y: screenSize.size.height * 0.452)
        HourLabel.center = CGPoint(x: (screenSize.size.width/2) + (screenSize.size.width * 0.46) , y: screenSize.size.height * 0.35)
        RadiusLabel.center = CGPoint (x: (screenSize.size.width/2) + (screenSize.size.width * 0.45) , y: screenSize.size.height * 0.452)
        InterestPicker.frame=CGRectMake(0, screenSize.size.height * 0.01, screenSize.size.width, screenSize.size.height * 0.3)
        if(screenSize.size.width <= 350)
        {
            HourSlider.transform = CGAffineTransformMakeScale(0.75, 0.75);
            RadiusSlider.transform = CGAffineTransformMakeScale(0.75, 0.75);
            navbar.frame=CGRectMake(0, 0, screenSize.size.width, 50)
        }
        else
        {
            HourSlider.frame = CGRectMake(screenSize.size.width * 0.05, screenSize.size.height * 0.335, screenSize.size.width * 0.75, 30)
            RadiusSlider.frame = CGRectMake(screenSize.size.width * 0.05, screenSize.size.height * 0.435, screenSize.size.width * 0.75, 30)
            navbar.frame=CGRectMake(0, 0, screenSize.size.width, 60)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    Functions that recieve input from altering the UI elements
    */
    
    @IBAction func changeHours(sender: UISlider) {
        selectedHour = Double(sender.value)
        let showHour = Int(selectedHour)
        
        HourLabel.text = String(stringInterpolationSegment: showHour)
        
    }
    
    @IBAction func changeRadius(sender: UISlider) {
        selectedRadius = Double(sender.value)
        let showRadius = Int(selectedRadius)
        RadiusLabel.text = String(stringInterpolationSegment: showRadius)
    }
    
    @IBAction func changeMondaySwitch(sender: UISwitch) {
        selectedMonday = sender.on
    }
    
    @IBAction func changeTuesdaySwitch(sender: UISwitch) {
        selectedTuesday = sender.on
    }
    
    @IBAction func changeWednesdaySwitch(sender: UISwitch) {
        selectedWednesday = sender.on
    }
    
    @IBAction func changeThursdaySwitch(sender: UISwitch) {
        selectedThursday = sender.on
    }
    
    @IBAction func changeFridaySwitch(sender: UISwitch) {
        selectedFriday = sender.on
    }
    
    @IBAction func changeSaturdaySwitch(sender: UISwitch) {
        selectedSaturday = sender.on
    }
    
    @IBAction func changeSundaySwitch(sender: UISwitch) {
        selectedSunday = sender.on
    }
    
    /*
    Functions for the Picker
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return colors[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        InterestPickerValue=colors[row]
    }
    
    /*
    Reads the file into a string array
    */
    
    func readFile() {
        var strFile = ""
        let strpath = NSBundle.mainBundle().pathForResource("VolData", ofType: "csv")
        do{
            strFile = try String(contentsOfFile: strpath!, encoding: NSUTF8StringEncoding)
        }
        catch{
            NSLog("There was a problem")
        }
        var data: [AnyObject] = [AnyObject]()
        data = strFile.componentsSeparatedByString("\n")
        for var y = 0; y < data.count; y += 1{
            var translation = data[y].componentsSeparatedByString(",");
            strArray.append(data[y].componentsSeparatedByString(","));
            for var i = 0; i < 15; i += 1 {
                strArray[y].append(translation [i]);
            }
        }
    }
    
    /*
    Sorts the Agencies by order of their percent match
    */
    func shellSortAgencies(userPreferences: UserInput)
    {
        for (var x = 0; x < RegSearchController.sortedListOfAgencies.count-1; x += 1) {
            for(var w=0; w < RegSearchController.sortedListOfAgencies.count-1; w+=1)
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

    @IBAction func StartSearching(sender: AnyObject) {
    
        var name1 = ""
        var address1 = ""
        var target1 = ""
        var phoneNumber1 = ""
        var email1 = ""
        var hours1 = 0.0
        var monday1 = true
        var tuesday1 = true
        var wednesday1 = true
        var thursday1 = true
        var friday1 = true
        var saturday1 = true
        var sunday1 = true
        var url1 = ""
        var newaddress1 = ""
        
        let user = UserInput(areaOfInterest:InterestPickerValue, numberOfHours:selectedHour, distance:selectedRadius, isSelectedMonday: selectedMonday,isSelectedTuesday: selectedTuesday, isSelectedWednesday:selectedWednesday, isSelectedThursday:selectedThursday, isSelectedFriday:selectedFriday, isSelectedSaturday: selectedSaturday, isSelectedSunday:selectedSunday)
        
        readFile()
        
        let userLocation = ViewController.userLocation
        var location: CLLocation
        
        for (var x = 1; x < strArray.count; x += 1) {
            name1 = ((strArray [x]) [0]) as! String
            address1 = (strArray[x])[1] as! String
            target1 = (strArray[x])[2] as! String
            phoneNumber1 = (strArray[x])[3] as! String
            email1 = (strArray[x])[4] as! String
            hours1 =  Double((strArray[x])[5] as! String)!
            if(((strArray[x])[6] as! String) == "TRUE"){monday1 = true}
            else{monday1 = false}
            if(((strArray[x])[7] as! String) == "TRUE"){tuesday1 = true}
            else{tuesday1 = false}
            if(((strArray[x])[8] as! String) == "TRUE"){wednesday1 = true}
            else{wednesday1 = false}
            if(((strArray[x])[9] as! String) == "TRUE"){thursday1 = true}
            else{thursday1 = false}
            if(((strArray[x])[10] as! String) == "TRUE"){friday1 = true}
            else{friday1 = false}
            if(((strArray[x])[11] as! String) == "TRUE"){saturday1 = true}
            else{saturday1 = false}
            if(((strArray[x])[12] as! String) == "TRUE"){sunday1 = true}
            else{sunday1 = false}
            url1 = (strArray[x])[14] as! String
            newaddress1 = (strArray[x])[13] as! String
            
            let coord = address1.componentsSeparatedByString(" ")
            
            location = CLLocation(latitude: Double(coord[0])!, longitude: Double(coord[1])!)
            
            let dist = (userLocation.distanceFromLocation(location) / 1000) * 0.62137119
            
            listOfAgencies.append(Agency(name: name1, distance: dist, target: target1, phoneNumber: phoneNumber1, email: email1, numberOfHours: hours1, isSelectedMonday: monday1, isSelectedTuesday: tuesday1, isSelectedWednesday: wednesday1, isSelectedThursday: thursday1, isSelectedFriday: friday1, isSelectedSaturday: saturday1, isSelectedSunday: sunday1, newurl: url1, newaddress: newaddress1))
            
        }
        
        for var y = 0; y < listOfAgencies.count; y += 1    {
            if(user.getUserAreaOfInterest() == listOfAgencies[y].getTarget())
            {
            RegSearchController.sortedListOfAgencies.append(listOfAgencies[y])
            }
        }
        
    shellSortAgencies(user);
    
        for (var y = 0; y < RegSearchController.sortedListOfAgencies.count; y++)    {
            print(RegSearchController.sortedListOfAgencies[y].getName());
            print(RegSearchController.sortedListOfAgencies[y].percentMatch(user));
       }
        
    }
}
