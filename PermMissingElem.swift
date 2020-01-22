/*
An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

public func solution(_ A : inout [Int]) -> Int

that, given an array A, returns the value of the missing element.

For example, given array A such that:

  A[0] = 2
  A[1] = 3
  A[2] = 1
  A[3] = 5
the function should return 4, as it is the missing element.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
the elements of A are all distinct;
each element of array A is an integer within the range [1..(N + 1)].
*/

//Mark: This problem has a mathematical solution, based on the fact that the sumof consecutive integers from 1 to n is equal to n(n+1)/2

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
  var sum = 0
  
  for x in 0..<A.count {
      sum += A[x]
  }
     
 return ((A.count + 1) * (A.count + 2)) / 2 - sum
}
