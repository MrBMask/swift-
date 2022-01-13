//
//  SingleList.swift
//  ComputeCode
//
//  Created by 郝靓 on 2021/9/3.
//

import Foundation

public class SingleList<Value>{
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public var count: Int = 0
    
    public init(value: Value?){
        if let value = value {
            head = Node(value: value)
            tail = head
            count = 1
        }
    }
    
    public var isEmpty: Bool{
        return count == 0
    }
    // 查找
    public func node(at index: Int) -> Node<Value>? {
        guard index < count else {
            return head
        }
        
        var currentIndex = 0
        var currentNode = head
        while currentIndex < index, currentNode != nil {
            currentIndex += 1
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    // push
    public func push(_ value: Value){
        let newNode = Node(value: value, next: head)
        head = newNode
        if tail == nil {
            tail = head
        }
        count += 1
    }
    // append
    public func append(_ value: Value){
        if isEmpty {
            push(value)
            return
        }
        let newNode = Node(value: value)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    // insert after
    public func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        if node === tail {
          append(value)
          return tail!
        }

        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // 递归 reverse
    public func reverse1(_ head: Node<Value>) -> Node<Value> {
        
        if head == nil || head.next == nil {
            return head
        }
        
        // 递归调用 找到newhead
        let newHead = reverse1(head.next!)
        // 反转最后一个节点
        head.next?.next = head
        // 断链
        head.next = nil
        return newHead
        
    }
    
    // 迭代 reverse
    public func reverse(_ head: Node<Int>) -> Node<Int>? {

        if head == nil || head.next == nil {
            return head
        }


        var newHead : Node?  = Node.init(value: 0).next
        var p = head
        while p != nil {
            let temp = p.next
            p.next = newHead
            newHead = p
            p = temp ?? head

        }
        return newHead

    }
    

    // after at
@discardableResult
    public func insert(_ value: Value, at index: Int) -> Node<Value>? {
       guard count > 0 else {
         push(value)
         return head!
       }

       guard index > 0 else {
         insert(value, after: head!)
         return head!.next!
       }

       if let node = node(at: index - 1) {
         return insert(value, after: node)
       }

       return nil
     }
    
    
    //pop
    @discardableResult
    public func pop() -> Value? {
      guard !isEmpty else { return nil }
      let oldHead = head
      head = oldHead?.next
      count -= 1
      if tail === oldHead {
        tail = nil
      }
      return oldHead?.value
    }
    
    //removeLast
    @discardableResult
      public func removeLast() -> Value? {
        guard count > 1 else {
          return pop()
        }

        let removedNode = tail
        let pre = node(at: count - 2)
        pre?.next = nil
        tail = pre
        count -= 1
        return removedNode?.value
      }
    
    
    // remove after
    @discardableResult
      public func remove(after node: Node<Value>) -> Value? {
        defer {
          if node.next === tail {
            tail = node
          }
          node.next = node.next?.next
        }
        if node.next != nil {
          count -= 1
        }
        return node.next?.value
      }
    
    // remove at
    @discardableResult
      public func remove(at index: Int) -> Value? {
        guard index >= 0, index < count - 1 else { return nil }
        if index == 0 {
          return pop()
        }
        if let node = node(at: index - 1) {
          return remove(after: node)
        }
        return nil
      }
    
    
}


extension SingleList: CustomStringConvertible{
    public var description: String{
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}


