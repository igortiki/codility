/*
Write a function:

public func solution(_ A : inout [Int]) -> Int

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−1,000,000..1,000,000].
*/

//Solution 1
public func solution(_ A : inout [Int]) -> Int {

    var min = 1
    A.sort()
    
    for x in A {
        if x == min {
            min += 1
        }
    }
    return min
}


//Solution 2
public func solution(_ A : inout [Int]) -> Int {
  let result = 1
  var posList = Array(Set(A.filter {$0>0}))
 
  posList.sort()
 
  if posList.count > 0 {
      var currentItem = posList[0]
      if currentItem > 1 {
          return result
      }
      
      for x in 1..<posList.count {
         if currentItem + 1 != posList[x] {
           return currentItem + 1 
             
         }
         currentItem = posList[x]
      }
      return currentItem + 1 
  }
  
  return result
}

//Solution 3
public func solution(_ A : inout [Int]) -> Int {
  
    var result = 1
    var posList = A.filter{$0 > 0}
    var uniqList = Set(posList)
    
    while (uniqList.contains(result)) {
        result += 1
    }
    
    return result
}



//Pigeonhole principle.
public func solution(_ A : inout [Int]) -> Int {
    let result = 1
    var posList = A.filter{ $0 > 0 }
    var occurrence = Array(repeating: false, count: posList.count + 1)
    
   
    for item in posList {
          if item < posList.count + 1 {
            occurrence[item-1] = true
          }
    }
    
    for x in 0..<occurrence.count {
       if occurrence[x] == false {
            return x + 1
       }
    }
    
    return result
}
