//
//  키패드누르기.swift
//  Programmers-Swift
//
//  Created by 한상민 on 2022/05/13.
//

import Foundation
func cal_len(pos :(Int,Int), num_pos:(Int,Int)) -> Int{
    return abs(pos.0-num_pos.0) + abs(pos.1-num_pos.1)
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = "";
    let keyPad = [(1,0), (0,3), (1,3), (2,3), (0,2), (1,2),(2,2),(0,1),(1,1),(2,1)];
    var l_pos = (0,0);
    var r_pos = (2,0);
    var l_len = 0;
    var r_len = 0;
    for num in numbers {
        if (num == 1 || num == 4 || num == 7){
            answer += "L";
            l_pos = keyPad[num];
            continue;
        } else if (num == 3 || num == 6 || num == 9){
            answer += "R";
            r_pos = keyPad[num];
            continue;
        }
        let keyPos = keyPad[num];
        l_len = cal_len(pos: l_pos, num_pos: keyPos);
        r_len = cal_len(pos: r_pos, num_pos: keyPos);
        if (l_len < r_len) {
            answer += "L";
            l_pos = keyPad[num];
            continue;
        } else if (l_len > r_len) {
            answer += "R";
            r_pos = keyPad[num];
            continue;
        }
        if (hand == "left")
        {
            answer += "L";
            l_pos = keyPad[num];
            continue;
        } else {
            answer += "R";
            r_pos = keyPad[num];
            continue;
        }
    }
    return answer;
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"));
