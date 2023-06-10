//
//  FlowLevel.swift
//  DontCryHy
//
//  Created by sei on 2023/06/10.
//

import Foundation

enum FlowLevelType: Int, CaseIterable, Identifiable {
    case none = 0, small, medium, alot, flood
    
    var description: String {
        switch self {
        case .none: return "거의없음"
        case .small: return "적음"
        case .medium: return "중간"
        case .alot: return "많음"
        case .flood: return "넘침"
        }
    }
    
    var id: Self { self }
}


enum PadTypeEnum: Int, CaseIterable, Identifiable {
    case panla = 0, small, mid, big, over
    
    var description: String {
        switch self {
        case .panla: return "팬라"
        case .small: return "소형"
        case .mid: return "중형"
        case .big: return "대형"
        case .over: return "오버"
        }
    }
    var id: Self { self }
}
