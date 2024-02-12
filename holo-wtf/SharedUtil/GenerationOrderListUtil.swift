//
//  GenerationOrderListUtil.swift
//  holo-wtf
//
//
//

import Foundation
import SwiftUI

enum GenerationOrderListError: Error {
    case cannotDecode(String)
    case cannotEncode(GenerationOrderList)
}

typealias GenerationOrderList = [AgencyEnum: [Generation]]

func getGenerationOrderList(@AppStorage("generationListOrderNew") from data: Data, agency: AgencyEnum) -> [Generation] {
    guard let deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        return agencyEnumToGenerations[agency]!
    }
    
    return deserialized[agency] ?? agencyEnumToGenerations[agency]!
}

func appendNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: [Generation], agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        return
    }
    deserialized[agency]!.append(contentsOf: order)
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        data = serialized
    } else {
        data = Data()
    }
}

func overwriteNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: [Generation], agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        return
    }
    deserialized[agency] = order
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        data = serialized
    } else {
        data = Data()
    }
}
