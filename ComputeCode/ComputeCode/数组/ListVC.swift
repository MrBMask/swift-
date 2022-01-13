//
//  ListVC.swift
//  ComputeCode
//
//  Created by 郝靓 on 2021/9/1.
//

import UIKit


class ListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
// MARK:- 俩数之和
        let  nums = [2,11,15,7]
        let target = 9
        let restult = twoSum1(nums, target)
//        print(restult)
        
        
        let list = SingleList.init(value: 0)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)
        print(list)
        let list1 = list.reverse1(list.head!)
        
        print(list1)
    
      
        
        
    }
    
   
    
    // 俩数之和
    // 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 { return [] }
        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (index, value) in nums.enumerated(){
            
            dict[value] = index
            
            let reminder = target - value
            if dict.keys.contains(reminder) {
                if let reminderIndex = dict[reminder], reminderIndex != index {
                    return [reminderIndex, index]
                }
            }
        }
        return []
    }


}
