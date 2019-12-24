//
//  Sort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class Sort<T: Comparable> {
    
    class func sort(arr: inout Array<T>) {
        print("sort")
        arr.sort()
    }
    class func compare(_ t1: T, _ t2: T) -> Int {
        return t1 > t2 ? 1 : (t1 < t2 ? -1 : 0)
    }
    
    class func swap(_ i: Int, _ j: Int, _ array: inout [T]) {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
}

func testSort() {
    var a1 = randomData(100, 200)
    var a2 = a1
    var a3 = a1
    var a4 = a1
    var a5 = a1
    var a6 = a1
    var a7 = a1
    var a8 = a1
    var a9 = a1
    var count = Int(arc4random()) % 100
    a1.sort()
    Sort.sort(arr: &a2)
    print(a2[count])
    BubbleSort.sort(arr: &a3)
    print(a3[count])
    SelectionSort.sort(arr: &a4)
    print(a4[count])
    InsertionSort.sort(arr: &a5)
    print(a5[count])
    HeapSort.sort(arr: &a6)
    print(a6[count])
    QuickSort.sort(arr: &a7)
    print(a7[count])
    MergeSort.sort(arr: &a8)
    print(a8[count])
    ShellSort.sort(arr: &a9)
    print(a9[count])
}

func randomData(_ count: Int, _ max: Int) -> [Int] {
    var array = [Int]()
    for _ in 0..<count {
        array.append(Int(arc4random())%max)
    }
    return array
}

func testCustomSort() {
    
    var persons = [Person]()
    for i in 0...10 {
        let j = arc4random() % 5
        let person = Person(Int(j), "test - \(i) - \(j)")
        persons.append(person)
    }
    
    persons.sort()
    
    for p in persons {
        print(p)
    }
}

class Person: Comparable, CustomStringConvertible {
    
    var description: String {
        return "P - age:\(age!) - name:\(name!)"
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs === rhs
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age! < rhs.age!
    }
    
    var age: Int?
    var name: String?
    init(_ age: Int, _ name: String) {
        self.age = age
        self.name = name
    }
}

