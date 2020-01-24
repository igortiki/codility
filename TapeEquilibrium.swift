/*
A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

For example, consider array A such that:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
We can split this tape in four places:

P = 1, difference = |3 − 10| = 7
P = 2, difference = |4 − 9| = 5
P = 3, difference = |6 − 7| = 1
P = 4, difference = |10 − 3| = 7
Write a function:

public func solution(_ A : inout [Int]) -> Int

that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

For example, given:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
the function should return 1, as explained above.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [2..100,000];
each element of array A is an integer within the range [−1,000..1,000]./

//solution 1
public func solution(_ A : inout [Int]) -> Int {
 var diff = Int.max
 if A.count == 0 {
      return 0
 }
    
 var head = [Int]()
 head.append(A[0])

 for x in 1..<A.count - 1 {
    head.append (head[x - 1] + A[x])
 }
     
 var tail = Array(repeating: 0, count: A.count-1)
 tail[tail.count-1] = A[A.count-1]

 var x = tail.count - 2
 while (x >= 0) {
    tail[x] = A[x + 1]  + tail[x+1]
    x = x - 1
 }

 for x in 0..<tail.count {
    let  sum = abs(head[x] - tail[x])
    if sum < diff {
        diff = sum
    }
 }
     
 return diff
}


//solution 2
public func solution(_ A : inout [Int]) -> Int {
 let totalT = A.reduce(0, +)
 var leftP = 0
 var rightP = totalT
 var minDiff = Int.max
 
 for x in 0..<A.count-1 {
     leftP += A[x]
     rightP -= A[x]
     
     let diff = abs(leftP - rightP)
     minDiff = min(minDiff, diff)
 }
 

 return minDiff   // write your code in Swift 4.2.1 (Linux)
}
