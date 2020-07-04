import Foundation

class MonoPatternSequencer {
   typealias Row = [Bool] // [0,1,0]
   typealias Col = [Row] // [[0,1],[1,0]]
   /**
    * Creates unique bool sequence at arbitrary length
    * - Abstract: Create all possible combinations of true and zero on a defined length
    * - Fixme: ⚠️️ for count = 8 this algo creates 554240 variations, which it reduces to 256 after removing dups. it works, but is only efficient at generating mono patterns at dev time
    * - Fixme: ⚠️️ create a faster algo that doesnt produce dups?
    * ## Examples:
    * sequence(count: 2) // [[0,1], [1,0], [0,0], [1,1]]
    */
   static func sequence(count: Int) -> Col {
      let row = Array(repeating: true, count: count) // row with 4 positive bool values
      let col = Array(repeating: row, count: count) // column with 4 rows
      let result = makeBranch(col: col, index: 0)
      Swift.print("result.count:  \(result.count)")
      let negRow = Array(repeating: false, count: count)
      return removeDuplicateRows(column: result + [negRow, row]) // append the negative and positive row for completness
   }
}
/**
 * Private helper methods
 */
extension MonoPatternSequencer {
   /**
    * Make branch
    */
   private static func makeBranch(col: Col, index: Int) -> Col {
      let cols: [Col] = col.map { (row: Row) in // creates 4 branches from 1 source
         let newCol: Col = iterateOver(row: row) // makes 4 new columns
         guard index < row.count - 2 else { return newCol } // if you have reached branching count of the same count as row, stop branching
         return newCol + makeBranch(col: newCol, index: index + 1)
      }
      return cols.flatMap { $0 }
   }
   /**
    * Run false at one integer over every index
    * ## Examples:
    * iterateOver(row: [1,0,1]) // [[0,0,1], [1,0,0]]
    * Only return rows that hasn't already been set to false (avoids duplicates)
    */
   private static func iterateOver(row: Row) -> Col {
      return (0..<row.count).indices.compactMap { (i: Int) in
         var row = row // make copy
         if row[i] {
            row[i] = false
            return row
         }
         return nil
      }
   }
}
extension MonoPatternSequencer {
   /**
    * Removes duplicates
    */
   private static func removeDuplicateRows(column: Col) -> Col {
      var result: Col = []
      column.forEach { (row: Row) in
         if !result.contains(row) { result.append(row) } // append if doesn't exists
      }
      return result
   }
}
