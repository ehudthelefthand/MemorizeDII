//
//  Struct.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import Foundation


struct Person {
    private var firstname: String
    private var lastname: String

    init(firstname: String, lastname: String) {
        self.firstname = firstname
        self.lastname = lastname
    }

//    var fullname: String {
//        firstname + " " + lastname
//    }

    var fullname: String {
        get {
            return "\(firstname) \(lastname)"
        }
        set {
            let splited = newValue.split(separator: " ")
            firstname = String(splited[0])
            lastname = String(splited[1])
        }
    }
}

func main2() {
    var p1 = Person(firstname: "Peerawat", lastname: "Poombua")
    print(p1.fullname)
}
