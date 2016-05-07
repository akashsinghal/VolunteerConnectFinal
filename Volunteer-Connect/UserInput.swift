//
//  User.swift
//  Volunteer-Connect
//
//  Created by Akash Singhal on 12/21/15.
//

import Foundation

var userAreaOfInterest = "";
var userNumberOfHours=0.0;
var userRadius = 0.0;
var userIsSelectedMonday = true;
var userIsSelectedTuesday = true;
var userIsSelectedWednesday = true;
var userIsSelectedThursday = true;
var userIsSelectedFriday = true;
var userIsSelectedSaturday = true;
var userIsSelectedSunday = true;

class UserInput
{
    init(areaOfInterest:String, numberOfHours:Double, distance:Double, isSelectedMonday:Bool, isSelectedTuesday: Bool, isSelectedWednesday:Bool, isSelectedThursday:Bool, isSelectedFriday:Bool, isSelectedSaturday: Bool, isSelectedSunday:Bool)
    {
        userAreaOfInterest = areaOfInterest;
        userNumberOfHours = numberOfHours;
        userRadius = distance;
        userIsSelectedMonday = isSelectedMonday;
        userIsSelectedTuesday = isSelectedTuesday;
        userIsSelectedWednesday = isSelectedWednesday;
        userIsSelectedThursday = isSelectedThursday;
        userIsSelectedFriday = isSelectedFriday;
        userIsSelectedSaturday = isSelectedSaturday;
        userIsSelectedSunday = isSelectedSunday;
    }

func getUserAreaOfInterest()->String
{
    return userAreaOfInterest;
}
func getUserNumberOfHours()->Double
{
    return userNumberOfHours;
}
func getUserIsSelectedMonday()->Bool
{
    return userIsSelectedMonday;
}
func getUserIsSelectedTuesday()->Bool
{
    return userIsSelectedTuesday;
}
func getUserIsSelectedWednesday()->Bool
{
    return userIsSelectedWednesday;
}
func getUserIsSelectedThursday()->Bool
{
    return userIsSelectedThursday;
}
func getUserIsSelectedFriday()->Bool
{
    return userIsSelectedFriday;
}
func getUserIsSelectedSaturday()->Bool
{
    return userIsSelectedSaturday;
}
func getUserIsSelectedSunday()->Bool
{
    return userIsSelectedSunday;
}
func getRadius()->Double
{
    return userRadius;
}

}