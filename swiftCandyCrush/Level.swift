//
//  Level.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/29/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import Foundation

//purpose
/*
Level is a collection of cookie and tile objects.
*/


let NumColumns = 9
let NumRows = 9

class Level {
    //Level class is a special type of 2D array: holdings a collection of Cookies
    
    //cookie 2D array is private and can only be accessed by within
    private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
   
                if (tiles[column, row] != nil){
           
            
                // 2 For each row and column, generate a random cookie type
                var cookieType = CookieType.random()
                
                // 3 create the cookie
                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                cookies[column, row] = cookie
                
                // 4 add the cookie into the two-dimension of cookies
                set.addElement(cookie)
                }
      
            }
        }
        return set
    }
    
    init(filename: String) {
        // 1
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            // 2
            if let tilesArray: AnyObject = dictionary["tiles"] {
                // 3
                for (row, rowArray) in enumerate(tilesArray as [[Int]]) {
                    // 4
                    let tileRow = NumRows - row - 1
                    // 5
                    for (column, value) in enumerate(rowArray) {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()

                        }
                    }
                }
            }
        }
    }
    
    //since this cookie array is private, we must setup API for other classes to access cookies
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    

    func tileAtColumn(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    func performSwap(swap: Swap) {
        let columnA = swap.cookieA.column
        let rowA = swap.cookieA.row
        let columnB = swap.cookieB.column
        let rowB = swap.cookieB.row
        
        cookies[columnA, rowA] = swap.cookieB
        swap.cookieB.column = columnA
        swap.cookieB.row = rowA
        
        cookies[columnB, rowB] = swap.cookieA
        swap.cookieA.column = columnB
        swap.cookieA.row = rowB
    }
}