//
//  Cookie.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/29/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import SpriteKit

class Cookie: Printable, Hashable {
    //class representing Cookie object
    
    //properties: column, row, type, sprite(optional image), description, hashvalue
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    //description property is required to conform to Printable protocol
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row*10 + column
    }
    
    //initialization of a Cookie
    init(column: Int, row: Int, cookieType: CookieType){
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
}

// a function '==' is required to conform to HASHABLE protocol by defining equality for Swift
func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}

//enumeration that extends cookietype; type is an int but using enumeration allows us to work with names
//enumerations can have members and functions
enum CookieType: Int {
    case
    Unknown = 0,
    Croissant,
    Cupcake,
    Danish,
    Donut,
    Macaroon,
    SugarCookie
    
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String{
        return spriteName + " -Highlighted"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
}


