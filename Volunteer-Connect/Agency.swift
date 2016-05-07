//
//  Agency.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/23/15.
//

import Foundation

class Agency{
    
    var agencyName: String
    var agencyDistance: Double
    var agencyTarget: String
    var agencyPhoneNumber: String
    var agencyEmail: String
    var agencyHours: Double
    var agencyOpenMonday: Bool
    var agencyOpenTuesday: Bool
    var agencyOpenWednesday: Bool
    var agencyOpenThursday: Bool
    var agencyOpenFriday: Bool
    var agencyOpenSaturday: Bool
    var agencyOpenSunday: Bool
    var agencyURL: String
    var agencyAddress: String
    
    init(name: String, distance: Double, target:String, phoneNumber:String, email:String, numberOfHours:Double, isSelectedMonday:Bool,isSelectedTuesday: Bool, isSelectedWednesday:Bool, isSelectedThursday:Bool, isSelectedFriday:Bool, isSelectedSaturday: Bool, isSelectedSunday:Bool, newurl:String, newaddress: String)
    {
        agencyName = name
        agencyDistance = distance
        agencyTarget = target
        agencyPhoneNumber = phoneNumber
        agencyEmail = email
        agencyHours = numberOfHours
        agencyOpenMonday = isSelectedMonday
        agencyOpenTuesday = isSelectedTuesday
        agencyOpenWednesday = isSelectedWednesday
        agencyOpenThursday = isSelectedThursday
        agencyOpenFriday = isSelectedFriday
        agencyOpenSaturday = isSelectedSaturday
        agencyOpenSunday = isSelectedSunday
        agencyURL = newurl;
        agencyAddress = newaddress;
    }
    
    init()  {
        agencyName = ""
        agencyDistance = 0.0
        agencyTarget = ""
        agencyPhoneNumber = ""
        agencyEmail = ""
        agencyHours = 0
        agencyOpenMonday = false
        agencyOpenTuesday = false
        agencyOpenWednesday = false
        agencyOpenThursday = false
        agencyOpenFriday = false
        agencyOpenSaturday = false
        agencyOpenSunday = false
        agencyURL = ""
        agencyAddress = ""

    }
    
    func getName()->String  {
        return agencyName
    }
    func getURL() ->String{
        return agencyURL
    }
    func getAddress() -> String{
        return agencyAddress
    }
    func getTarget()->String
    {
        return agencyTarget
    }
    func getPhoneNumber()->String
    {
        return agencyPhoneNumber
    }
    func getEmail()->String
    {
        return agencyEmail
    }
    func getHours()->Double
    {
        return agencyHours
    }
    func getIsOpenMonday()-> Bool
    {
        return agencyOpenMonday
    }
    func getIsOpenTuesday()-> Bool
    {
        return agencyOpenTuesday
    }
    func getIsOpenWednesday()-> Bool
    {
        return agencyOpenWednesday
    }
    func getIsOpenThursday()-> Bool
    {
        return agencyOpenThursday
    }
    func getIsOpenFriday()-> Bool
    {
        return agencyOpenFriday
    }
    func getIsOpenSaturday()-> Bool
    {
        return agencyOpenSaturday
    }
    func getIsOpenSunday()-> Bool
    {
        return agencyOpenSunday
    }
    func getDistance()->Double
    {
        return agencyDistance; 
    }

    
    func percentMatch(userPicks: UserInput)->Double{
        let DISTANCE_WEIGHTAGE = 0.0 //percent weightage
        let HOURS_WEIGHTAGE = 20.0
        let DAYS_WEIGHTAGE = 80.0
        
        var percentMatch = 0.0
        if(agencyTarget == userPicks.getUserAreaOfInterest())
        {
            let distance = agencyDistance
            
            percentMatch = percentMatch + (DISTANCE_WEIGHTAGE - ((distance/userPicks.getRadius()) * DISTANCE_WEIGHTAGE) )
            var daysSelected = 0.0
            var daysMatched = 0.0
            
            
            if(userPicks.getUserIsSelectedMonday())
            {
                daysSelected += 1
                if(agencyOpenMonday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedTuesday())
            {
                daysSelected += 1
                if(agencyOpenTuesday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedWednesday())
            {
                daysSelected += 1
                if(agencyOpenWednesday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedThursday())
            {
                daysSelected += 1
                if(agencyOpenThursday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedFriday())
            {
                daysSelected += 1
                if(agencyOpenFriday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedSaturday())
            {
                daysSelected += 1
                if(agencyOpenSaturday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.getUserIsSelectedSunday())
            {
                daysSelected += 1
                if(agencyOpenSunday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(daysSelected==0){daysSelected=1; daysMatched=1}
            percentMatch = (percentMatch + (DAYS_WEIGHTAGE*(daysMatched/daysSelected))) //percentMatch increases based on how many days matched out of days selected
            var hoursDifference = 0.0
            hoursDifference = abs(userPicks.getUserNumberOfHours() - agencyHours)
            percentMatch = (percentMatch + (HOURS_WEIGHTAGE-(12*hoursDifference))) //should be +-<=2.5 hour difference or else the hour match isn't close enough
        }
        return percentMatch
    }
    func percentMatch(userPicks: AdvUserInput) -> Double
    {
        var calcNumDaysWeight = 0.0
        calcNumDaysWeight = 70-(userPicks.advGetUserNumDaysLeft()/3)
        
        let NUMDAYS_WEIGHTAGE = calcNumDaysWeight
        let DISTANCE_WEIGHTAGE = (80-calcNumDaysWeight) //will range from 10 to 20 ...
        let DAYS_WEIGHTAGE = 20.0
        
        var advancedPercentMatch = 0.0
        
        var totalDaysNeeded = 0.0
        let hoursLeft = userPicks.advGetUserNumberOfHoursLeft()
        if(agencyTarget == userPicks.advGetUserAreaOfInterest())
        {
            let distance = agencyDistance
            
            advancedPercentMatch = advancedPercentMatch + (DISTANCE_WEIGHTAGE - ((distance/50.0) * DISTANCE_WEIGHTAGE) )
            var daysSelected = 0.0
            var daysMatched = 0.0
            
            if(userPicks.advGetUserIsSelectedMonday())
            {
                daysSelected += 1
                if(agencyOpenMonday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advGetUserIsSelectedTuesday())
            {
                daysSelected += 1
                if(agencyOpenTuesday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advGetUserIsSelectedWednesday())
            {
                daysSelected += 1
                if(agencyOpenWednesday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advGetUserIsSelectedThursday())
            {
                daysSelected += 1
                if(agencyOpenThursday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advGetUserIsSelectedFriday())
            {
                daysSelected += 1
                if(agencyOpenFriday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advGetUserIsSelectedSaturday())
            {
                daysSelected += 1
                if(agencyOpenSaturday==true)
                {
                    daysMatched += 1
                }
            }
            
            if(userPicks.advgetUserIsSelectedSunday())
            {
                daysSelected += 1
                if(agencyOpenSunday==true)
                {
                    daysMatched += 1
                }
            }
            totalDaysNeeded = hoursLeft/agencyHours
            
            var daysOpen = 0.0
            if(agencyOpenMonday==true){daysOpen += 1}
            if(agencyOpenTuesday==true){daysOpen += 1}
            if(agencyOpenWednesday==true){daysOpen += 1}
            if(agencyOpenThursday==true){daysOpen += 1}
            if(agencyOpenFriday==true){daysOpen += 1}
            if(agencyOpenSaturday==true){daysOpen += 1}
            if(agencyOpenSunday==true){daysOpen += 1}
            
            let totalWeeksNeeded = totalDaysNeeded/daysOpen
            advancedPercentMatch = advancedPercentMatch + (NUMDAYS_WEIGHTAGE-(((totalWeeksNeeded*7)/userPicks.advGetUserNumDaysLeft())*NUMDAYS_WEIGHTAGE))
            if(daysSelected==0){daysSelected=1; daysMatched=1} 
            advancedPercentMatch = (advancedPercentMatch + (DAYS_WEIGHTAGE*(daysMatched/daysSelected))) //advancedPercentMatch increases based on how many days matched out of days selected
        }
        return advancedPercentMatch
        
    }
    
}
