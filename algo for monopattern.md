

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
// continue here 🏀
```

### Pseudo code

```swift
/**
 * Create all possible combinations of true and zero on a defined length
 * - Fixme: ⚠️️
 */
func makeRange(digitCount: Int) -> [[Bool]] {
	let base: [Bool] = repeatElement(true, count: digitCount) // Create the base to modify
	// let firstBase: [Bool] = iterate(base: base)
	let completed: [[Bool]] = []
	var accuBase: [Bool] = base
	return (0..digitCount).indecies().forEach {
		accuBase = iterate(base: accuBase)
		completed.append(accuBase)
	}
}
func iterate(base: [Bool]) {
	base.indecies().map { i in // 0..3 amount of false
	  let newBase = base // copy
	  base[i] = bool
  }
}
/**
 * Just shift from left to right (one bool at the time)
 * ## Example:
 * shift(base: [true, true, true], false) // [false,true,true], [true, false, true], [true, true, false]
 */
func shift(base: [Bool], bool: Bool) -> [[Bool]] {
	base.indecies().map { i in // 0..3 amount of false
		let newBase = base // copy
	  	base[i] = bool
  }
}
// func insert(base: [Bool], insertion: [Bool], at: Int) {
//     base.replaceSubrange(from...to, with: ) // optionally use insertAt
// }
```
