//
//  Swap.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/30/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import Foundation

struct Swap: Printable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}