//
//  AdvUserInput.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/26/15.
//

import Foundation

var advUserAreaOfInterest = "";
var advUserNumberOfHoursLeft = 0.0;
var advUserIsSelectedMonday = true;
var advUserIsSelectedTuesday = true;
var advUserIsSelectedWednesday = true;
var advUserIsSelectedThursday = true;
var advUserIsSelectedFriday = true;
var advUserIsSelectedSaturday = true;
var advUserIsSelectedSunday = true;
var advUserNumDaysLeft = 0.0;

class AdvUserInput
{
    init(areaOfInterest:String, numberOfHoursLeft:Double, isSelectedMonday:Bool, isSelectedTuesday: Bool, isSelectedWednesday:Bool, isSelectedThursday:Bool, isSelectedFriday:Bool, isSelectedSaturday: Bool, isSelectedSunday:Bool, numDaysLeft:Double)
    {
        advUserAreaOfInterest = areaOfInterest;
        advUserNumberOfHoursLeft = numberOfHoursLeft;
        advUserIsSelectedMonday = isSelectedMonday
        advUserIsSelectedTuesday = isSelectedTuesday
        advUserIsSelectedWednesday = isSelectedWednesday
        advUserIsSelectedThursday = isSelectedThursday
        advUserIsSelectedFriday = isSelectedFriday
        advUserIsSelectedSaturday = isSelectedSaturday
        advUserIsSelectedSunday = isSelectedSunday
        advUserNumDaysLeft = numDaysLeft;
        
    }
    
    func advGetUserAreaOfInterest()->String
    {
        return advUserAreaOfInterest;
    }
    func advGetUserNumberOfHoursLeft()->Double
    {
        return advUserNumberOfHoursLeft;
    }
    func advGetUserIsSelectedMonday()->Bool
    {
        return advUserIsSelectedMonday;
    }
    func advGetUserIsSelectedTuesday()->Bool
    {
        return advUserIsSelectedTuesday;
    }
    func advGetUserIsSelectedWednesday()->Bool
    {
        return advUserIsSelectedWednesday;
    }
    func advGetUserIsSelectedThursday()->Bool
    {
        return advUserIsSelectedThursday;
    }
    func advGetUserIsSelectedFriday()->Bool
    {
        return advUserIsSelectedFriday;
    }
    func advGetUserIsSelectedSaturday()->Bool
    {
        return advUserIsSelectedSaturday;
    }
    func advgetUserIsSelectedSunday()->Bool
    {
        return advUserIsSelectedSunday;
    }
    func advGetUserNumDaysLeft() -> Double
    {
        return advUserNumDaysLeft;
    }
}