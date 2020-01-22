/*
A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.

Count the minimal number of jumps that the small frog must perform to reach its target.

Write a function:

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int

that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.

For example, given:

  X = 10
  Y = 85
  D = 30
the function should return 3, because the frog will be positioned as follows:

after the first jump, at position 10 + 30 = 40
after the second jump, at position 10 + 30 + 30 = 70
after the third jump, at position 10 + 30 + 30 + 30 = 100
Write an efficient algorithm for the following assumptions:

X, Y and D are integers within the range [1..1,000,000,000];
X ≤ Y.
*/

//Solution 1
public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {

    var intPart = Int((Y - X) / D)

    if  (intPart * D) + X >= Y {
        return intPart
    }
    
    intPart = intPart + 1
    return intPart
}


//Solution 2
public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
  
  var result = 0
  var floatResult : Double = 0.0
  
  if  D <= 0 {
      return result
  }
  
  floatResult = (Double(Y-X) / Double(D)).rounded(.up)
  return Int(floatResult)
}
