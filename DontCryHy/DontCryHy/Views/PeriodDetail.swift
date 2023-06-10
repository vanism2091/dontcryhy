//
//  PeriodDetail.swift
//  DontCryHy
//
//  Created by sei on 2023/06/07.
//

import SwiftUI
import CoreData

struct PeriodDetail: View {
    var cycleLog: FetchedResults<CycleLog>.Element
    @State private var isEditing: Bool = false
    @State private var selectedPadType: PadTypeEnum
    @State private var selectedFlowLevel: FlowLevelType
    
    init(cycleLog: CycleLog, context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<CycleLog> = CycleLog.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \CycleLog.date, ascending: true)]
        fetchRequest.predicate = NSPredicate(value: true)
        self.cycleLog = cycleLog
        self._selectedPadType = State(initialValue: PadTypeEnum(rawValue: Int(cycleLog.padType)) ?? .panla)
        self._selectedFlowLevel = State(initialValue: FlowLevelType(rawValue: Int(cycleLog.flowLevel)) ?? .none)
    }
    
    var body: some View {
        VStack {
            dictRow(key: "date", val: "\(cycleLog.wrappedDate)")
            HStack(spacing: 10) {
                Text("Pad Type: ")
                Picker("Selected Pad Type", selection: $selectedPadType) {
                    ForEach(PadTypeEnum.allCases) {
                        Text($0.description)
                    }
                }
                .disabled(!isEditing)
            }
            .padding(.horizontal, 10)
            HStack(spacing: 10) {
                Text("Flow Level: ")
                Picker("Selected Flow Level", selection: $selectedFlowLevel) {
                    ForEach(FlowLevelType.allCases) {
                        Text($0.description)
                    }
                }
                .disabled(!isEditing)
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    if isEditing {
                        updateCycleLog()
                        isEditing = false
                    } else {
                        isEditing = true
                    }
                } label: {
                    Text(isEditing ? "Done" : "Edit")
                }
            }
        }
    }
    
    // MARK: - Update Cycle Log
    func updateCycleLog() {
        print("tapped update cycle log")
        PersistenceController.shared.update(of: cycleLog, padType: selectedPadType, flowLevel: selectedFlowLevel)
    }
    
    func dictRow(key: String, val: String) -> some View {
        HStack(spacing: 10) {
            Text(key)
            Spacer()
            Text(val)
        }
        .padding(.horizontal, 10)
    }
}

struct PeriodDetail_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) private static var viewContext
    
    static var previews: some View {
        PeriodDetail(cycleLog: .preview, context: viewContext)
    }
}
