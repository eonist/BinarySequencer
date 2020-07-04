import Foundation

class BinarySequencer {
   typealias Row = [Bool]
   typealias Col = [Row]
   /**
    * Creates unique bool sequence at arbitrary length
    * - Abstract: Create all possible combinations of true and false on at a defined length
    * ## Examples
    * let seq = sequence(size: 2) // [[0,1], [1,0], [0,0], [1,1]]
    */
   static func sequence(size: Int, row: Row = []) -> Col {
      if size == 0 { return [row] }
      let a: Col = sequence(size: size - 1, row: row + [true])
      let b: Col = sequence(size: size - 1, row: row + [false])
      return a + b
   }
}
