//
//  음양_더하기.swift
//  Programmers-Swift
//
//  Created by 한상민 on 2022/05/20.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0;
    for i in 0..<absolutes.count{
        var num = absolutes[i];
        if (!signs[i]){
            num *= -1;
        }
        answer += num;
    }
    return answer;
}

//func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
//    return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
//}
