//
//  Persistence+CycleLog.swift
//  Whatever
//
//  Created by sei on 2023/06/09.
//

import Foundation

extension PersistenceController {
    func update(of cycleLog: CycleLog, padType: PadTypeEnum? = nil, flowLevel: FlowLevelType? = nil) {
        if let padType {
            cycleLog.padType = Int64(padType.rawValue)
        }
        if let flowLevel {
            cycleLog.flowLevel = Int64(flowLevel.rawValue)
        }
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
}
