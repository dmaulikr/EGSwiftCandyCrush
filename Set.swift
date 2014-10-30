//
//  Set.swift
//  swiftCandyCrush
//
//  Created by Eric Gu on 10/29/14.
//  Copyright (c) 2014 Eric Gu. All rights reserved.
//

import Foundation

struct Set<T: Hashable>: SequenceType, Printable {
    /*
    A set is a collection, like an array, but it allows each element to appear only once, and it does not store the elements in any particular order.
    //Reason for SequenceType is so that we can iterate using for-in loop*/
    
    private var dictionary = Dictionary<T, Bool>()
    
      //must add mutating keyword to change instance methods
    
      /*Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods. However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.You can opt in to this behavior by placing the mutating keyword before the func keyword for that method.*/
    
    mutating func addElement(newElement: T) {
        dictionary[newElement] = true
    }
    
    mutating func removeElement(element: T) {
        dictionary[element] = nil
    }
    
    func containsElement(element: T) -> Bool {
        return dictionary[element] != nil
    }
    
    func allElements() -> [T] {
        return Array(dictionary.keys)
    }
    
    var count: Int {
        return dictionary.count
    }
    
    func unionSet(otherSet: Set<T>) -> Set<T> {
        var combined = Set<T>()
        
        for obj in dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        return combined
    }
    
    //must implement Generate() in order to comply with SequenceType protocol
    //this is the simplest implementation of generator
    func generate() -> IndexingGenerator<Array<T>> {
        return allElements().generate()
    }
    
    var description: String {
        return dictionary.description
    }
}