//
//  library.swift
//  video Game Library
//
//  Created by Kirk Brown on 9/13/18.
//  Copyright © 2018 Kirk Brown. All rights reserved.
//

import Foundation

class Library {
    
    var gameArray : [Game] = [Game(title: "Dying Light"), Game(title:"FinalFantasy XV"), Game(title: "GTA V"), Game(title: "Detroit: Become Human")]
    
    func addGame() { //allow the user to add a game, so later they can choose to check in or check it out.
        print("Please enter the title of the game you would like to add")
        
        var newGameTitle = readLine() // allows the user to enter a game title
      
        // if the user has entered an invalid repsonse, they will prompted to enter a game's title
        while newGameTitle == nil || newGameTitle == "" {
            print("invalid title. Please enter the game's title")
            newGameTitle = readLine()
        }
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
    }
    func listAvailableGames()  { // the available games so the user will know which game they can choose, if game is not checked in
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
                
            }
        }
    }
    func removeGame() { // allows the user to remove a game title that they choose.
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        print("Please enter the number of the game you want to remove:")
        
        var userInput = Int(readLine()!)// user will be able to enter a int for their selection, so they can enter an int instead a string for the whole game
        let validGameIndex = Array(0..<gameArray.count)
        
        //check to make sure input is not nil and the number enterd is not beyond the index of our array
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid Input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gameArray.remove(at: userInput!)// removes the game at the user's input
    }
    
    func checkOutGame() {
        //loop through our game array and print index and title if game is available to be checked out
        for index in 0..<gameArray.count {
            // since checkedIn is set to true the code will only show the games that are checked out 
            if gameArray[index].checkedIn == true {
                print("\(index). \(gameArray[index].title)")
            }
        }
      
        print("Please enter the index of the game you wish to check out")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid Input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        if userInput != gameArray.count {
            print("Please select a game within the games givin.")
        }
       
        
        // change the checkedIn value of our game element at the index provided by the user
        gameArray[userInput!].checkedIn = false
        
        //use calendar to add time and establish due date
        let currentCalendar = Calendar.current
        
        let dueDate = currentCalendar.date(byAdding: .day,value: 14,to: Date())
        gameArray[userInput!].dueDate = dueDate
        
        //use dateFormtter to print out date as a readable string for the user
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The game is due on \(dateFormatter.string(from: dueDate!))")
    }
    
    func checkGameIn() {
        for index in 0..<gameArray.count {
            
            // since checkedIn is false it will only show the opposite and show the checked out games
            if gameArray[index].checkedIn == false {
                print("\(index). \(gameArray[index].title)")
                
            }
        }
        
        print("Please enter the index of the game you wish to check in ")
        var userInput = Int(readLine()!) // allows the user to select a int to pick the game
        
        //the user will prompted to enter a valid int 
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
            
        }
        
        // if the game has been checked back in the user will know if it has been checked back in
        gameArray[userInput!].checkedIn = true
        
        gameArray[userInput!].dueDate = nil
        print("Your game has been checked backed in.")
        
    }
    
    func listOfUnavailableGames() {// tells the users if a game is unavailable, they know when they can check it out
        for game in gameArray {
            if !game.checkedIn {// if the game is checked out it will show the game title
                print(game.title)
                //shows the date that the game is due
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    
    
}
