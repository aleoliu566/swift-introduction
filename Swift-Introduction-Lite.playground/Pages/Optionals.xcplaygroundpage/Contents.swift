/*:

 # Optionals

 You use **optionals** in situations where a value may be _absent_. 
 
 An optional represents two possibilities: 
 - Either there is a value, and you can unwrap the optional to access that value
 - or there isn’t a value at all
 
 We put _a question mark_ (`?`) after the type to indicate that this variable has
 an optional value.

 */
/*:
 
 Take following lines as example, converting strings into numbers may fail when
 the string is not composed by digits.

 */
let possibleNumber1 = "123"
let convertedNumber1 = Int(possibleNumber1)
let possibleNumber2 = "ABC1"
let convertedNumber2: Int? = Int(possibleNumber2)

/*:
 
 ## `nil`

 We use `nil` to denote that the value is absent.

 */
var concreteNumber: Int = 42
var optionalNumber: Int? = 42
optionalNumber = nil
//concreteNumber = nil  // Try to uncomment this line to see what Xcode yields.

//: --------------------------------------------------------------------------------------------------------------------
/*:
 
 ## Unwrapping optional values
 
 We have to unwrap the value from optionals before using it. 
 
 ### Forced unwrapping
 
 Use `if` statement to check whether it's `nil` or not, and then put a 
 _exclamation mark_ (`!`) after optionals to force unwrapping it.
 
 We called this way, using the `!` mark, as "forced unwrapping".
 
 */
func convertToNumber(from input: String) -> Int {
    let convertedOptionalNumber = Int(input)
    if convertedOptionalNumber == nil {
        return 0
    } else {
        return convertedOptionalNumber!
    }
}
convertToNumber(from: "1")
convertToNumber(from: "A")

/*:
 
 You should always check whether the value is nil or not before force unwrapping an optional.
 
 */

let answerString = "42"
let forcedUnwrappingNumber1 = Int(answerString)!
let helloWorldString = "Hello World!"
//let forcedUnwrappingNumber2 = Int(helloWorldString)!
// Try to uncomment the above line to see what happened.

/*:
 
 ### Optional binding
 
 You use optional binding to find out whether an optional contains a value,
 and if so, to make that value available as a temporary constant or variable.
 
 Optional binding can be used with `if`, `guard`, and `while` statements to 
 check for a value inside an optional, and to extract that value into a constant 
 or variable, as part of a single action.

 */
func parseInt(_ string: String) -> (isInteger: Bool, value: Int) {
    let possibleNumber = Int(string)
    if let actualNumber = possibleNumber {
        return (true, actualNumber)
    } else {
        return (false, 0)
    }
}
parseInt("12")
parseInt("XD")
//:
//: The `if` statement in `parseInt(_:)` could be read as
//:
//: “If the optional Int returned by `Int(possibleNumber)` contains a value,
//: set a new constant called `actualNumber` to the value contained in the optional.”
//:
//: > Try to "option+click" on `possibleNumber` and `actualNumber` to see their types.

func squareFloat(_ string: String) -> String? {
    guard let floatNumber = Float(string) else {
        return nil
    }
    return "\(floatNumber * floatNumber)"
}
squareFloat("16.0")
squareFloat("A")

/*:

 ### Nil-Coalescing Operator
 
 The _nil-coalescing operator_ (`a ?? b`) unwraps an optional a if it contains a value,
 or returns a default value b if a is nil.
 
 The expression `a` is always of an optional type. The expression `b` must match the type
 that is stored inside `a`.

 */
let someString1 = "XD"
let someString2 = "42"
let whateverNumber1 = Int(someString1) ?? -1
let whateverNumber2 = Int(someString2) ?? -1
//: > Try to "option+click" on `whateverNumber1` and `whateverNumber2` to see their types.

//: ---
//:
//: [<- Previous](@previous) | [Next ->](@next)
//:
