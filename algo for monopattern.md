# Notes for making MonoPatternGenerator

### Doodeling

```swift
/*1*/
0111 // <- move over this 0..3 // 🏀 if value is same as setter, skip
1011 // <- move over this 0..3
1101 // <- move over this 0..3
1110 // <- move over this 0..3
/*2*/
0011
1001
1100
0101
1010
0110
/*3*/
1000
0100
0010
0001
/*4*/
0000
1111
```

```swift
/**
 * Creates unique bool sequence at arbitrary length
 */
func sequence(count: Int) -> Col {
	let row = Array(repeating: true, count: count) // row with 4 positive bool values
	let col = Array(repeating: row, count: digitCount) // column with 4 rows
	return makeBranch(col: baseCol, index: 1)
}
/**
 * Make branch
 */
func makeBranch(col: Col, index: Int) -> Col {
	col.flatMap { row in // creates 4 branches from 1 source
		let newCol = iterateOver(row) // makes 4 new columns
		guard index < row.count else { return newCol } // if you have reached branching count of the same count as row, stop branching
		return newCol + makeBranch(col: newCol, index: index + 1)
	}
}
/**
 * ## Examples:
 * iterateOver(row: [1,0,1]) // [[0,0,1], [1,0,0]]
 * Only return rows that hasn't already been set to false (avoids duplicates)
 */
func iterateOver(row: Row) -> Col {
	var row = row // make copy
	return (0..<row.count).indicies.compactMap { (i: Int) in
		if !row[i] {
			row[i] = false
			return row
		}
		return nil
	}
}
```

0011
1001
1100
0110

### Test with 3 digits
```swift
/*1*/
011
101
110
/*2*/
001
100
010
/*3*/
000
111
```

### Pseudo code

```swift
class MonoPatternGenerator {
	typealias Row = [Bool]
	typealias Column = [Row]
	/**
	 * Create all possible combinations of true and zero on a defined length
	 * ## Examples:
	 *
	 */
	func makeRange(digitCount: Int) -> Column {
		let baseRow: [Bool] = repeatElement(true, count: digitCount) // Create the base row to modify (111)
		// let firstBase: [Bool] = iterate(base: base)

		let firstColumn: Column = shift(row: baseRow) // accumulated sequences
		var column: Column = [firstColumn] // accumulated
		var prevColumn: Column = firstColumn

		return prevColumn.forEach { (row: Row) in
			prevColumn = shift(row: row) // we iterate on prev iteration
			column += (prevColumn)// add the result to accumulated sequence
		}
		// fixme: ⚠️️remember to add baseRow to end etc
		coulumn.append(baseRow)
		return column.removeDuplicates()
	}
	/**
	 * Run false at one integer over every index
	 * ## Examples
	 * shift(base: [true, true, true]) // [[011], [101], [110]]
	 */
	func shift(row: Row) -> Column {
		row.indecies().map { (i: Int) in // 0..3 amount of false
		  let newRow = row // copy
		  newRow[i] = false // set bool at index
		  return newRow
	  }
	}
}
/**
 *
 */
extension Array {
	/**
	 * Removes duplicates
	 * - Note: the following two lines may be more efficient try to factor them and see if they are good
	 * ## Examples:
	 * var arr: Array = ["a","b","b","c","b","d","c"]
	 * let arr: [String] = ["a","b","b","c","b","d","c"];var z:[String] = [] Swift.print(arr.forEach{if(z.index(of: $0) == nil) {z.append($0)}})//["a", "b", "c", "d"]
	 */
	fileprivate func removeDuplicates<T>() -> [T] where T: Comparable {
		 var result: [T] = []
		 self.forEach {
			  if !result.contains($0) { result.append($0) } // append if doesn't exists
		 }
		 return result
	}
}

```
