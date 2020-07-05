### Example:
```swift
BinarySequencer.sequence(size: 4).forEach { print($0) }
```

## Output:
```
[true, true, true, true]
[true, true, true, false]
[true, true, false, true]
[true, true, false, false]
[true, false, true, true]
[true, false, true, false]
[true, false, false, true]
[true, false, false, false]
[false, true, true, true]
[false, true, true, false]
[false, true, false, true]
[false, true, false, false]
[false, false, true, true]
[false, false, true, false]
[false, false, false, true]
[false, false, false, false]
```

### Resources:

[https://github.com/almata/Combinatorics](https://github.com/almata/Combinatorics)

for all possible combinations of letters: [https://codereview.stackexchange.com/questions/52119/calculate-all-possible-combinations-of-an-array-of-arrays-or-strings](https://codereview.stackexchange.com/questions/52119/calculate-all-possible-combinations-of-an-array-of-arrays-or-strings)

```
function allPossibleCases(array, result, index) {
    if (!result) {
        result = [];
        index = 0;
        array = array.map(function(element) {
            return element.push ? element : [element];
        });
    }
    if (index < array.length) {
        array[index].forEach(function(element) {
            var a = array.slice(0);
            a.splice(index, 1, [element]);
            allPossibleCases(a, result, index + 1);
        });
    } else {
        result.push(array.join(' '));
    }

    return result;
}

var t1 = ["x", "y", "z"];
var t2 = [["a", "b"], "c", "d"];
var t3 = [["a", "b"], ["c", "d"], "e"];

console.log(allPossibleCases(t1)); // ["x y z"]
console.log(allPossibleCases(t2)); // ["a c d", "b c d"]
console.log(allPossibleCases(t3)); // ["a c e", "a d e", "b c e", "b d e"]
```
