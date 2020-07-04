# Notes for making MonoPatternGenerator

### Doodeling

```swift
/*1*/
0111
1011
1101
1110
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
