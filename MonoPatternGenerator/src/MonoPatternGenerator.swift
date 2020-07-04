import Foundation

class MonoPatternGenerator {
   typealias Row = [Bool]
   typealias Column = [Row]
   /**
    * Create all possible combinations of true and zero on a defined length
    * ## Examples:
    * makeRange(digitCount: 2) // [[01, 10], [00], [11]]
    */
   static func makeRange(digitCount: Int) -> Column {
      let baseRow: [Bool] = Array.init(repeating: true, count: digitCount) // Create the base row to modify (111)
      // let firstBase: [Bool] = iterate(base: base)
      
      let firstColumn: Column = shift(row: baseRow) // accumulated sequences
      var column: Column = firstColumn // accumulated
      var prevColumn: Column = firstColumn
      
      (0..<digitCount).indices.forEach { (i: Int) in
         // 🏀
         // you have to store some interim indecies. look at the output and it will make sense
         let row: Row = prevColumn[i]
         prevColumn = shift(row: row) // we iterate on prev iteration
         prevColumn.forEach {
            Swift.print("$0:  \($0)")
         }
         Swift.print("--")
         column += (prevColumn)// add the result to accumulated sequence
      }
      // Fixme: ⚠️️ Remember to add baseRow to end etc
      column.append(baseRow)
      return removeDuplicateRows(column: column)
   }
}
/**
 *
 */
extension MonoPatternGenerator {
   /**
    * Run false at one integer over every index
    * ## Examples:
    * shift(base: [true, true, true]) // [[011], [101], [110]]
    */
   private static func shift(row: Row) -> Column {
      row.indices.map { (i: Int) in // 0..3 amount of false
         var newRow = row // copy
         newRow[i] = false // set bool at index
         return newRow
      }
   }
   /**
    * Removes duplicates
    */
   private static func removeDuplicateRows(column: Column) -> Column {
      var result: Column = []
      column.forEach { (row: Row) in
         if !result.contains(row) { result.append(row) } // append if doesn't exists
      }
      return result
   }
}
