# BinarySequencer
Create all possible combinations of true and false on at a defined length

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
