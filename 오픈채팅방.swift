//
//  오픈채팅방.swift
//  Programmers-Swift
//
//  Created by 한상민 on 2022/05/26.
//

import Foundation

func parse(_ record:[String])-> ([String:String], [(String, String)]){
    var rtn :([String:String], [(String,String)]) = ([:],[]);
    for words in record{
        let temp = words.split(separator: " ");
        rtn.1.append((String(temp[0]),String(temp[1])));
        if (temp.count != 2) {
            rtn.0[String(temp[1])] = String(temp[2]);
        }
    }
    return rtn  // ([id:name],[(act,id)])
}

func solution(_ record:[String]) -> [String] {
    var rtn : [String] = [];
    let (id_name, actIds) : ([String:String], [(String,String)]) = parse(record);
    for actId in actIds {
        if (actId.0 == "Enter"){
            rtn.append("\(id_name[actId.1]!)님이 들어왔습니다.");
        }
        if (actId.0 == "Leave"){
            rtn.append("\(id_name[actId.1]!)님이 나갔습니다.");
        }
    }
    return rtn;
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]));
