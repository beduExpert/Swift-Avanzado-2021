//
//  GenericsParameters.swift
//

import Foundation

func middleVal<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1)/2]
}
