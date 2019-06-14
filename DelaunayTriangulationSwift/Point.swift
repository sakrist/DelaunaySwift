//
//  Point.swift
//  DelaunayTriangulationSwift
//
//  Created by Volodymyr Boichentsov on 14/11/2017
//  Copyright © 2017 sakrist. All rights reserved.
//

import CoreGraphics

/// A structure that contains a point in a two-dimensional coordinate system.
public struct Point : Hashable {
    public var x: Double
    public var y: Double
    public var index: Int = -1// Default is -1.
    
    public init(x: Double, y: Double, i:Int = -1) {
        self.x = x
        self.y = y
        self.index = i
    }
    
    public static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func -(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func *(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }

    public static func /(lhs: Point, rhs: Double) -> Point {
        return Point(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    public func lengthSqrt() -> Double {
        return x * x + y * y
    }
    
    public func distanceSqrt(_ point:Point) -> Double {
        let d = Point(x: (x - point.x), y: (y - point.y) )
        return d.lengthSqrt()
    }
    
    public func distance(_ point:Point) -> Double {
        return sqrt(self.distanceSqrt(point))
    }
    
    public func length() -> Double {
        return sqrt(self.lengthSqrt())
    }
    
    public func dot(_ point:Point) -> Double {
        return x * point.x + y * point.y
    }
    
    public func cross(_ point:Point) -> Double {
        return x * point.y - y * point.x
    }
    
    public func pointValue() -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(UInt(bitPattern: x.hashValue))
        hasher.combine(UInt(bitPattern: y.hashValue))
    }
}


extension Array {
    mutating func pop() -> Element? {
        let last = self.last
        self.removeLast()
        return last
    }
}


//  Created by Alex Littlejohn on 2016/01/08.

extension Point: Equatable { 
    static public func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Array where Element:AnyObject {
    mutating func remove(object: Element) {
        if let index = firstIndex(where: { $0 === object }) {
            remove(at: index)
        }
    }
}

extension Array where Element:Equatable {
    
    public func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}

