import Foundation

class MonoPatternGenerator {
   typealias Row = [Bool]
   typealias Column = [Row]
   /**
    * Create all possible combinations of true and zero on a defined length
    * - Fixme: ⚠️️ rename to sequencepattern?
    * ## Examples:
    * makeRange(digitCount: 2) // [[01, 10], [00], [11]]
    */
   static func makeRange(digitCount: Int) -> Column {
      let positiveRow: [Bool] = Array.init(repeating: true, count: digitCount) // Create the base row to modify (111)
      // let firstBase: [Bool] = iterate(base: base)
      let blankColumn: Column = Array.init(repeating: positiveRow, count: digitCount)
      let firstColumn: Column = shift(column: blankColumn) // accumulated sequences
      firstColumn.forEach {
         Swift.print("$0:  \($0)")
      }
      Swift.print("-")
      var prevColumn: Column = firstColumn
      var result: Column = firstColumn // accumulated
      
      for i in (0..<digitCount).indices {
         prevColumn = shift(column: prevColumn, offset: i + 1)
         prevColumn.forEach { Swift.print("$0:  \($0)") }
         Swift.print("--")
         result += (prevColumn)// add the result to accumulated sequence
      }
      Swift.print("positiveRow:  \(positiveRow)")
      // Fixme: ⚠️️ Remember to add baseRow to end etc
      
      let negativeRow: [Bool] = Array.init(repeating: false, count: digitCount)
      Swift.print("negativeRow:  \(negativeRow)")
      result += [negativeRow, positiveRow]
      return removeDuplicateRows(column: result)
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
//   private static func shift(row: Row) -> Column {
//      row.indices.map { (i: Int) in // 0..3 amount of false
//         var newRow = row // copy
//         newRow[i] = false // set bool at index
//         return newRow
//      }
//   }
   /**
    * Shift column
    */
   static func shift(column: Column, offset: Int = 0) -> Column {
      var column = column
      column.indices.forEach { (i: Int) in // 0..3 amount of false
         let idx: Int = i + offset
         let normalizedIdx: Int = idx < column.count ? idx : idx % column.count
         column[i][normalizedIdx] = false // set bool at index
      }
      return column
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
