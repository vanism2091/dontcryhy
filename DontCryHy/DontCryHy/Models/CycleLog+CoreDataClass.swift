//
//  CycleLog+CoreDataClass.swift
//  DontCryHy
//
//  Created by sei on 2023/06/07.
//
//

import Foundation
import CoreData

@objc(CycleLog)
public class CycleLog: NSManagedObject {
    var wrappedPadType: String {
//        sweet maple
        let padTypeEnum = PadTypeEnum(rawValue: Int(padType)) ?? .panla
        return padTypeEnum.description
    }
    
    var wrappedFlowLevel: String {
        let flowLevelType = FlowLevelType(rawValue: Int(flowLevel)) ?? .none
        return flowLevelType.description
    }
    
    var wrappedDate: Date {
        date ?? Date()
    }
    
    static var preview: CycleLog {
        let viewContext = PersistenceController.preview.container.viewContext
        
        let cycleLog = CycleLog(context: viewContext)
        cycleLog.date = Date()
        cycleLog.flowLevel = 3
        cycleLog.padType = 3
        
        return cycleLog
    }
}
