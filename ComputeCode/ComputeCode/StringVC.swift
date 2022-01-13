//
//  StringVC.swift
//  ComputeCode
//
//  Created by 郝靓 on 2021/9/2.
//

import UIKit

class StringVC: UIViewController {

//    给你一个字符串 s，找到 s 中最长的回文子串。
//    输入：s = "babad"
//    输出："bab"
    override func viewDidLoad() {
        super.viewDidLoad()

        let string = "babad"
        self.longestPalindrome(string)
//        print(self.longestPalindrome(string))
        print(self.longestPalindrome1(string))
    }
    
    
    // 动态规划  又问题 奶奶的
    func longestPalindrome(_ s: String) -> String {
        if (s == ""){ return "" }
        let length = s.count
        let originString = s
        let reverString = String(originString.reversed());
        var arry2D = Array2D(columns: 5, rows: 5, initialValue: 0)
        
        var maxLen = 0;
        var maxEnd = 0;
        for i in 0..<length {
            for j in 0..<length {
                if originString.charIndex(index: i) == reverString.charIndex(index: i){
                    if (i == 0 || j == 0) {
                        arry2D[i,j] = 1;
                    } else {
                        arry2D[i,j] = arry2D[i - 1,j - 1] + 1;
                    }
                }
                if  arry2D[i,j] > maxLen {
                    maxLen = arry2D[i,j]
                    maxEnd = i
                }
            }
        }
        return originString[maxEnd - maxLen + 1 ..< maxEnd + 1]
    }
    
    // 扩散中心法
    func longestPalindrome1(_ s: String) -> String {
        
        let array = Array(s)
        let length = array.count
        if length < 2 {
            return s
        }
        
        var maxLength = 1
        var begain = 0
        
        for index in 0..<length-1{
            let oldLength = centerLength(array, left: index, right: index)
            let eventLength = centerLength(array, left: index, right: index + 1)
            let oeMax = max(oldLength,eventLength)
            
            if oeMax > maxLength {
                maxLength = oeMax
                begain = index - (maxLength - 1)/2
            }
        }
        
        
        
        return String(array[begain..<begain+maxLength])
    }
    

    
    func centerLength(_ s: [String.Element], left: Int, right: Int) -> Int {
        let length = s.count
        var i = left
        var j = right
        while i >= 0 && j <= length {
            if s[i] == s[j] {
                i -= 1
                j += 1
            }else{
                break
            }
        }
        
        return j - i - 1
    }
}

extension String{
   
    func charIndex(index: Int) -> String {
        let postion = self.index(self.startIndex, offsetBy: 2)
        let char = self[postion]
        return String(char)
    }
}

extension String {
    subscript(_ indexs: ClosedRange<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[beginIndex...endIndex])
    }
    
    subscript(_ indexs: Range<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[beginIndex..<endIndex])
    }
    
    subscript(_ indexs: PartialRangeThrough<Int>) -> String {
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[startIndex...endIndex])
    }
    
    subscript(_ indexs: PartialRangeFrom<Int>) -> String {
        let beginIndex = index(startIndex, offsetBy: indexs.lowerBound)
        return String(self[beginIndex..<endIndex])
    }
    
    subscript(_ indexs: PartialRangeUpTo<Int>) -> String {
        let endIndex = index(startIndex, offsetBy: indexs.upperBound)
        return String(self[startIndex..<endIndex])
    }
}




public struct Array2D<T> {
  public let columns: Int
  public let rows: Int
  fileprivate var array: [T]
  
  public init(columns: Int, rows: Int, initialValue: T) {
    self.columns = columns
    self.rows = rows
    array = .init(repeating: initialValue, count: rows*columns)
  }
  
  public subscript(column: Int, row: Int) -> T {
    get {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      return array[row*columns + column]
    }
    set {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      array[row*columns + column] = newValue
    }
  }
}
