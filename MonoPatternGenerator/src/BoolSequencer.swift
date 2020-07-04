import Foundation

class BoolSequencer {
   typealias Row = [Bool]
   typealias Col = [Row]
   /**
    * Creates unique bool sequence at arbitrary length
    * - Abstract: Create all possible combinations of true and zero on a defined length
    * ## Examples
    * let seq = sequence(size: 2) // [[0,1], [1,0], [0,0], [1,1]]
    */
   static func sequence(size: Int) -> Col {
      let count: Int = Int(pow(2.0, Double(size))) // makes int out of Decimal number
      return (0..<count).indices.map { (i: Int) in
         var str = String(i, radix: 2) // we create binary of a number
         while (str.count < size) { str = "0" + str } // pad the number with 0
         return str.map { char in char == "0" }
      }
   }
}
