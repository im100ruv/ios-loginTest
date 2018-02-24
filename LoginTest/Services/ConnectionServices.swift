//
//  ConnectionServices.swift
//  LoginTest
//
//  Created by Im100ruv on 23/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import Foundation
import SQLite

class ConnectionServices {
    static let instance = ConnectionServices()
    
    var database_conect: Connection!
    
    let userTbl = Table("users")
    let id = Expression<Int>("id")
    let userName = Expression<String>("userName")
    let firstName = Expression<String>("firstName")
    let lastName = Expression<String>("lastName")
    let email = Expression<String>("email")
    let age = Expression<Int>("age")
    let password = Expression<String>("password")
    
    var users = [Users]()
    
    
    func db_Create() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("users1").appendingPathExtension("sqlite3")
            print(fileURL)
            let database = try Connection(fileURL.path)
            database_conect = database
            
            createTable()
        } catch {
            print(error)
        }
    }
    
    func createTable() {
        do {
            let userTable = userTbl.create{ t in
                t.column(id, primaryKey: true)
                t.column(userName)
                t.column(firstName)
                t.column(lastName)
                t.column(email, unique: true)
                t.column(age)
                t.column(password)
            }
            
            try database_conect.run(userTable)
        } catch {
            print(error)
        }
    }
    
    func insertRecord(uname: String, fname: String, lname: String, age: Int, email: String, passwd: String) {
        let insertUser = userTbl.insert(self.userName <- uname, self.firstName <- fname, self.lastName <- lname, self.age <- age, self.email <- email, self.password <- passwd)
        print("\(self.userName) <- \(uname), \(self.firstName) <- \(fname), \(self.lastName) <- \(lname), \(self.age) <- \(age), \(self.email) <- \(email), \(self.password) <- \(passwd)")
        print("\(insertUser)")
        do {
            try database_conect.run(insertUser)
            print("user inserted!")
        } catch {
            print(error)
        }
    }
    
//    func listRecord(email: String) {
//        let showUser = users.insert(self.userName <- uname, self.firstName <- fname, self.lastName <- lname, self.age <- age, self.email <- email, self.password <- password)
//        do {
//            try database_conect.run(insertUser)
//            print("user inserted!")
//        } catch {
//            print(error)
//        }
//    }
    
    func countOfRecords() -> Int {
        do {
            let num = try database_conect.scalar("SELECT count(*) FROM users")
            print(num as! Int)
            return (num as! Int)
        } catch {
            print(error)
            return 0
        }
    }
    
    func loginCheck(email: String, pswd: String) -> Bool {
        var valid = false
        do {
            let records = try database_conect.prepare(self.userTbl)
            for user in records {
                print("\(user[self.email]) \(email) \(String(user[self.password])) \(pswd)")
                if user[self.email] == email && user[self.password] == pswd {
                    valid = true
                }
            }
        } catch {
            print(error)
        }
        return valid
//        return true
    }
    
    func getUsers() {
        do {
            let records = try database_conect.prepare(self.userTbl)
            for user in records {
                var temp = Users()
                temp.uname = user[self.userName]
                temp.fname = user[self.firstName]
                temp.lname = user[self.lastName]
                temp.age = user[self.age]
                temp.email = user[self.email]
                
                users.append(temp)
            }
        } catch {
            print(error)
        }
    }
}
