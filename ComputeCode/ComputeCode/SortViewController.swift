//
//  SortViewController.swift
//  ComputeCode
//
//  Created by 郝靓 on 2021/9/1.
//

import UIKit

//对数组类型进行扩展
extension Array
{
    //扩展方法：用来交换数组中的两个位置的元素
    fileprivate mutating func swap(i:Int,j:Int)
    {
        //通过一个临时变量，交换数组中的两个不同位置的元素
        let temp = self[i]
        self[i] = self[j]
        self[j] = temp
    }
}


class SortViewController: UIViewController {

    var originAry: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.originAry = [6,1,9,2,10,22,9,8,0,-2]
        var resultAry = self.inserSort(self.originAry)
//        print(resultAry)
        
        var result = self.quickSort(arry: self.originAry)
        print(result)
    }
    

    
    //MARK:- 算法
        //冒泡排序
        func bubbleSort(_ arry:[Int]) -> [Int] {
            guard !arry.isEmpty else { return [] }
            var perArry = arry
            for i in 0 ..< (perArry.count - 1) {
                for j in 0 ..< i  {
                    if perArry[j] > perArry[i] {
                        perArry.swap(i: i, j: j)
                    }
                }
            }
            return perArry
        }
        
        // 选择排序  找最小索引
        // 从现有的无序序列中找出那个最小的值，然后与无序序列的第一个值进行交换
        func selectSort(_ arry:[Int]) -> [Int] {
            guard !arry.isEmpty else { return [] }
            var perArry = arry
            for i in 0 ..< (perArry.count - 1) {
                var minIndex = i
                for j in i+1 ..< perArry.count {
                    if perArry[j] < perArry[minIndex] {
                        minIndex = j
                    }
                }
                
                if minIndex != i {
                    perArry.swapAt(minIndex, i)
                }
                
            }
            return perArry
        }
        
        // 插入排序
        // 通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
        func inserSort(_ arry:[Int]) -> [Int] {
            guard !arry.isEmpty else { return [] }
            var perArry = arry
            for i in 1 ..< perArry.count {
                var j = i
                while j > 0 {
                    if perArry[j] < perArry[j - 1] {
                        perArry.swap(i: j - 1, j: j)
                        j = j - 1
                    } else{
                        break
                    }
                }
            }
            return perArry
        }
        
        // 快速排序 （2路 3路）
        func quickSort(arry:[Int])->[Int]{
            guard !arry.isEmpty else { return [] }
        
            var left:[Int] = []
            var right:[Int] = []
            let pivot = arry[arry.count - 1]
            for index in 0..<arry.count-1 {
                if arry[index] < pivot {
                    left.append(arry[index])
                }else{
                    right.append(arry[index])
                }
            }
            
            var result:[Int] = quickSort(arry: left)
            result.append(pivot)
            let rightresult = quickSort(arry: right)
            result.append(contentsOf: rightresult)
            return result
            
        }

}
