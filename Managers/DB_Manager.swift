//
//  DB_Manager.swift
//  SolveHunger
//
//  Created by Varsha Narasiman on 4/16/23.
//

import Foundation

import SQLite

class DB_Manager {
    
    private var db: Connection!
    private var users: Table!
    private var id: Expression<Int64>!
    private var firstName: Expression<String>!
    private var lastName: Expression<String>!
    private var email: Expression<String>!
    private var password: Expression<String>!
    
    
    //constructor
    init() {
        
        do {
            
          // let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
           // let path: String  = "/Users/VarshaNarasiman/Desktop/db"
            
//            let home = "/Users/VarshaNarasiman/Desktop"
//
//            let url = URL(string: "/Users/VarshaNarasiman/Desktop")
//            let path = "/db/solve-hunger.sqlite"
//            let urlWithPath = url.flatMap { URL(string: $0.absoluteString + path) }
            
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("solve-hunger").appendingPathExtension("sqlite3")
            
            //print(path)
            //create database connection
            //db = try Connection("\(path)/solve-hunger.sqlite")
            db = try Connection(fileURL.path)
            
           // db = try Connection("\(urlWithPath)")
            users = Table("users")
            
            id = Expression<Int64>("id")
            firstName = Expression<String>("firstName")
            lastName = Expression<String>("lastName")
            email = Expression<String>("email")
            password = Expression<String>("password")
            
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                try db.run(users.create {
                    (t) in t.column(id, primaryKey: true)
                    t.column(firstName)
                    t.column(lastName)
                    t.column(email, unique: true)
                    t.column(password)
                })
                
                UserDefaults.standard.set(true, forKey: "is_db_created")
                
            }
            
        } catch {
            
            print(error.localizedDescription)
        }
        
    }
    
    public func addUser(firstNameValue: String, lastNameValue: String, emailValue: String, passwordValue: String) {
        
        do {
            
            try db.run(users.insert(firstName <- firstNameValue, lastName <- lastNameValue, email <- emailValue, password <- passwordValue))
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    public func getUsers() -> [UserModel] {
        
        var userModels: [UserModel] = []
        users = users.order(id.desc)
        
        do {
            
            for user in try db.prepare(users) {
                let userModel: UserModel = UserModel()
                userModel.id = user[id]
                userModel.firstName = user[firstName]
                userModel.lastName = user[lastName]
                userModel.email = user[email]
                userModel.password = user[password]
                
                userModels.append(userModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return userModels
    }
    
}
