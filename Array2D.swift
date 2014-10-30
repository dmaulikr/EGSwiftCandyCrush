//
//  Array2D.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/29/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import Foundation

struct Array2D<T> {
    //creation of a custom Generic Type that serves as a two-dimensional array
    //takes advantage of subscripting, which allows us to easily access and get any object
    //myCookie = cookies[column, row]
    
    let columns: Int
    let rows: Int
    //must be optional because of the presence of nils
    private var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: self.rows * self.columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get{
            return array[row*columns + column]
        }
        set{
            array[row*columns + column] = newValue
        }
    }
    
}
