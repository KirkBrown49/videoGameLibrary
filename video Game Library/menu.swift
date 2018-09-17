//
//  menu.swift
//  video Game Library
//
//  Created by Kirk Brown on 9/11/18.
//  Copyright © 2018 Kirk Brown. All rights reserved.
//

import Foundation

class Menu {
    
    let gameLibrary = Library()
    
    var shouldQuit = false // when this is true , we should quit running the video game library
    func go() {
        // this function will handle making the menu run. it will display the menu and take user input until the user wishes to quit the application
        while !shouldQuit {
            printMenu()
            var input = getInput()
            while validateInput(input) == false {
                //display the menu
                printMenu()
                //get new input
                input = getInput()
            }
            handleInput(input)
            
        }
    }
    
    func validateInput(_ input:String) -> Bool {
        let validMenuOption = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOption.contains(number)
    }
    
    
    func printMenu() {
        if shouldQuit == false {
            print("""

    Video Game Library Menu
    1 Add game
    2 Remove Game
    3 List Available Games
    4 Check Out Games
    5 Check In Game
    6 List Unavailable Games
    7 Print Menu
    8 Quit
    
        Please enter a number between 1 and 8
    """)
        } else {
            print("Menu Closed")
            shouldQuit = true
        }
        
        
        
    }
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            gameLibrary.addGame()
        case "2":
            gameLibrary.removeGame()
        case "3":
            gameLibrary.listAvailableGames()
        case "4":
          gameLibrary.checkOutGame()
        case "5" :
            gameLibrary.checkGameIn()
        case "6":
           gameLibrary.listOfUnavailableGames()
        case "7":
            print("")
            printMenu()
        case "8":
          quit()
           
            
        default:
            break
            
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


