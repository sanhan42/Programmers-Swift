//
//  거리두기_확인하기.swift
//  Programmers-Swift
//
//  Created by 한상민 on 2022/05/17.
//

import Foundation

func valid(row:Int, col:String.Index, _ room:[String])-> Bool{
    if(row > 4){
        return false;}
    if(col == room[row].endIndex){
        return false;}
    return true;
}

func solution(_ places:[[String]]) -> [Int] {
    var answer = [Int]();
nextRoom:for room in places {
    var r = 0;
nextRow:while(r < 5) {
    var c = room[r].startIndex;
    while (c < room[r].endIndex) {
        if (room[r][c] == "P")
        {
            if(valid(row: r+1, col: c, room) && room[r+1][c]=="P")
            {// 한줄 아래 체크
                answer.append(0);
                continue nextRoom;
            }
            if(valid(row: r+2, col: c, room) && room[r+2][c]=="P" && room[r+1][c] != "X")
            {// 두줄 아래 체크
                answer.append(0);
                continue nextRoom;
            }
            if(c != room[r].startIndex){
                let bef_i = room[r].index(before: c)
                if(valid(row: r+1, col: bef_i, room) && room[r+1][bef_i] == "P" && (room[r][bef_i] != "X" || room[r+1][c] != "X"))
                {// 왼쪽 대각선 아래 체크
                    answer.append(0);
                    continue nextRoom;
                }
            }
            if(c != room[r].endIndex) {
                let nex_i = room[r].index(after: c);
                if(valid(row: r, col: nex_i, room) && room[r][nex_i] == "P"){// 오른쪽 옆 체크
                    answer.append(0);
                    continue nextRoom;
                }
                if(valid(row: r+1, col: nex_i, room) && room[r+1][nex_i] == "P" && (room[r][nex_i] != "X" || room[r+1][c] != "X")) // 오른쪽 대각선 아래 체크
                {
                    answer.append(0);
                    continue nextRoom;
                }
                if(nex_i != room[r].endIndex) {let n_nex_i = room[r].index(after: nex_i);
                    if(valid(row: r, col: n_nex_i, room) && room[r][n_nex_i] == "P" && room[r][nex_i] != "X") { // 오른쪽 옆 옆 체크
                        answer.append(0);
                        continue nextRoom;
                    }
                } else {r+=1;continue nextRow};
                
            } else {r+=1;continue nextRow}
        }
        c = room[r].index(after: c);
    }
    r += 1;
}
    answer.append(1);
}
    return answer;
}
