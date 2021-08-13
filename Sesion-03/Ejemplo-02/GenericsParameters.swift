//
//  GenericsParameters.swift
//

import Foundation

func anotherMethod<T> (first: T, second: T) {
  print("Mismo tipo de datos")
}
func anotherMethod<T, U> (first: T, second: U) {
   print("Distinto tipo de datos")
}

// Implementation
anotherMethod(first: 123, second: 456)
anotherMethod(first: 123, second: "456")

