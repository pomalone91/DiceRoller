# DiceRoller
A simple dice roller for iPhones

## Model
### DieStructure
The `DieStructure` uses an enumeration of the common table-top roleplaying game die types, called `DieType`, to determine the behavior of instances of the `DieStructure`.

#### Properties
- `type: DieType` -- Default initializer is `d4`. This denotes what type of die the instance is.
- `totalDice: Int` -- Default initializer is 1. Represented the number of dice to be rolled. For example, if two six sided die need to be rolled, then this value should be two.
- `modifier: int` -- Default initializer is 0. Represents the modifier that is to be added to the result of all the dice rolls of that type. `totalDice` and `modifier`, combined with the `type` property represent the short hand expressions used in table top RPGs to represent how many dice to roll, and the modifier added to that result, such as 2d6+3 represents two six sided die being rolled, and the integer value 3 being added to that. Using the properties of `DieStructure`: `DieType` is d6, `totalDice` is 2, and `modifier` is 3.

#### Methods
- `mutating func addDie()` -- Increments the `totalDie` property by 1. If `totalDie` would be greater than 99, it is set to 1, as 99 is the maximum number of die, and representing a negative or zero amount of die would be meaningless. This function is called when the user taps the plus button to the left of the roll button.
- `mutating func removeDie()` -- Decrements `totalDie` by 1. If the value is already at 1, it will remain at one, as representing a negative or zero amount of die would be meaningless. This function is called when the user taps the plus button to the left of the roll button.
- `mutating func addModifier()` -- Increments the `modifier` property by 1. If the modifier is greater than 99, it changes it to -99, as these are the maximum and minimum values for the modifier. This function is called when the user taps on the plus buttons to the right of the roll button.
- `mutating func removeModifier()` -- Decrements the `modifier` property by 1. This function is called when the user taps on the minus buttons to the right of the roll button.
- `mutating func resetDie()` -- Sets `modifier` and `totalDie` to 0 and 1 respectively. This function is called when the user taps the clear button.
- `rollDie() -> Int` -- This function produces a random number based on the type of die. It first uses a switch statment to determine which type of die is being rolled. Based on which type it is, a value is assigned to `upperBound: UInt32`. A variable is created to hold the value of the roll, `rollValue: UInt32`. An index variable `i` is created to be used as the exit condition for a while loop. In the while loop, `arc4random_uniform(__upper_bound: UInt32)` is used passing `upperBound` as its argument to generate a random number between 0 and the value of `upperBound`. The loop runs a number of times equal to the number of dice, represented by `i`, which id decermented during each loop. Finally, the value returned by `rollDie()` is the `rollValue` as an Int + 1 so it is within the correct range of values, plus the modifier to that roll. The modifier is applied after all the die are rolled, as is custom in most TTRPGs.

