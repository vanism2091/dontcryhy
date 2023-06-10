//
//  PeriodWrite.swift
//  Whatever
//
//  Created by sei on 2023/06/07.
//

import SwiftUI

struct PeriodWrite: View {
    @Environment(\.managedObjectContext)
    private var viewContext
    @Environment(\.dismiss)
    private var dismiss
    @State
    private var selectedFlowLevel: FlowLevelType = .none
    
    @State
    private var selectedPadType: PadTypeEnum = .panla
    
    var body: some View {
        VStack {
            HStack {
                Text("Flow Level: ")
                Picker("Selected Flow Level", selection: $selectedFlowLevel) {
                    ForEach(FlowLevelType.allCases) {
                        Text($0.description)
                    }
                }
            }
            HStack {
                Text("Pad Type: ")
                Picker("Selected Pad Type", selection: $selectedPadType) {
                    ForEach(PadTypeEnum.allCases) {
                        Text($0.description)
                    }
                }
            }
            addButton
        }
        
    }
    
    var addButton: some View {
        Button {
            withAnimation {
                addCycleLog()
            }
            dismiss()
        } label: {
            Text("추가하기")
        }

    }
    
    
    // MARK: - Add Cycle Log
    func addCycleLog() {
        print("pressed cycleLog")
        let cycleLog = CycleLog(context: viewContext)
        cycleLog.date = Date()
        cycleLog.flowLevel = Int64(selectedFlowLevel.rawValue)
        cycleLog.padType = Int64(selectedPadType.rawValue)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}

struct PeriodWrite_Previews: PreviewProvider {
    static var previews: some View {
        PeriodWrite()
    }
}
