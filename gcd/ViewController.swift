//
//  ViewController.swift
//  gcd
//
//  Created by Felix 05 on 28/12/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //    doLongAsyncTaskInSerialQueue()
      //  doLongsyncTaskInSerialQueue()
   //     doLongSyncTaskInConcurrentQueue()
   //     doLongAsyncTaskInConcurrentQueue()
    //    blockOperationTest1()
       // testQOS()
     //   updateUI()
      //  checkDispatchAfter()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    // async mod of thread serial queue
    func doLongAsyncTaskInSerialQueue()
    {
        let serialQueue = DispatchQueue(label: "com.que.seral");
        for i in 1...10
        {
            serialQueue.async
                {
                    if Thread.isMainThread
                    {
                        print("Task is running on main thread \(i)");
                    }
                    else
                    {
                        print("Task is running on backround \(i)");
                    }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // sync mode of thread serial queue
    func doLongsyncTaskInSerialQueue()
    {
        let serialQueue = DispatchQueue(label: "com.queue.seral");
        for i in 1...10
        {
            serialQueue.sync
                {
                    if Thread.isMainThread
                    {
                        print("Task is running on main thread \(i)");
                    }
                    else
                    {
                        print("Task is running on backround \(i)");
                    }
            }
        }
    }
// Async concurrent queue
    func doLongAsyncTaskInConcurrentQueue()
    {
        let cocurrentQueue = DispatchQueue(label: "com.concurrent.queue",attributes: .concurrent)
        for i in 1...10
        {
            cocurrentQueue.async
                {
                    if Thread.isMainThread
                    {
                        print("Task is running in main thread \(i)");
                    } else
                    {
                        print("Task is running in backround thread \(i)");
                    }
            }
        }
    }
     // test QOS
    func testQOS()
    {
        let queue1 = DispatchQueue(label: "com.Qos.queue1", qos:
        DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.Qos.queue2",qos:
        DispatchQoS.background)
        queue1.async {
            for i in 1...10
            {
            print("👿")
            }
        }
        queue2.async {
            for i in 1...10
            {
                print("😈")
            }
        }
        
    }
    // updateUI
    func updateUI()
    {
        DispatchQueue.main.async {
            print("Update UI here")
        }
    }
    
    // do long task sync concurrent queue
    func doLongSyncTaskInConcurrentQueue()
    {
    let concurrentQueue = DispatchQueue(label: "com.concurrent.queue", attributes: .concurrent )
    for i in 1...10
    {
        concurrentQueue.sync {
            if Thread.isMainThread
            {
                print("Task is running in main thread \(i)")
            } else
            {
                print("Task is running in backround thread \(i)")
            }
        }
        }
    
    }
    
    // blockOperation test
    func blockOperationTest1()
    {
        let operationQueue = OperationQueue()
        let operation1 : BlockOperation = BlockOperation (block: {
            self.doCalculation()
            })
        let operation2 : BlockOperation = BlockOperation (block: {
            self.doSomeMoreCalculation()
            })
        operation1.addDependency(operation2)
        operationQueue.addOperation (operation2)
        operationQueue.addOperation (operation1)
        
    }
    func doCalculation ()
    {
        print("do Calculation")
        for j in 100...105
        {
            print("j in do some more calculation is \(j)")
            sleep (1)
        }
    }
    func doSomeMoreCalculation()
    {
        print("do Some More Calculation")
        for j in 1...5
        {
            print("j in do some more calculation is \(j)")
            sleep(1)
        }
    }
    func checkDispatchAfter()
    {
        let deadlineTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime)
        {
            print("test")
        }

    }
    
    
}

