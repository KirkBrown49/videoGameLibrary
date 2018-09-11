//
//  menu.swift
//  video Game Library
//
//  Created by Kirk Brown on 9/11/18.
//  Copyright © 2018 Kirk Brown. All rights reserved.
//

import Foundation

class Menu {
    var shouldQuit = false // when this is true , we should quit running the video game library
    func go() {
        // this function will handle making the menu run. it will display the menu and take user input until the user wishes to quit the application
        while !shouldQuit {
            printMenu()
            print(getInput())
            quit()
        }
    }
    func printMenu() {
        if shouldQuit == false {
            print("""

        Video Game Library Menu
    1 Add game
    2 Remove Game
    3 List Availabe Games
    4 Check Out Games
    5 Check In Game
    6 List Checked Out Games
    7 Quit

    """)
        } else {
            print("Menu Closed")
            shouldQuit = true
        }
        
    }
    func quit() {
        shouldQuit = true
        print("Thanks for using the application")
    }
    
    func getInput() -> String {
        
        var userInput = readLine()
        while userInput == nil || userInput == ""{
            print("please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
}

