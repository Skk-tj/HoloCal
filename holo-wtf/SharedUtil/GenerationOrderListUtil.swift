//
//  GenerationOrderListUtil.swift
//  holo-wtf
//
//
//

import Foundation
import SwiftUI
import Sentry

enum GenerationOrderListError: Error {
    case cannotDecode(String)
    case cannotEncode(GenerationOrderList)
}

typealias GenerationOrderList = [AgencyEnum: [Generation]]

func getGenerationOrderList(@AppStorage("generationListOrderNew") from data: Data, agency: AgencyEnum) -> [Generation] {
    guard let deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        SentrySDK.capture(error: GenerationOrderListError.cannotDecode(String(decoding: data, as: UTF8.self)) as NSError)
        return agencyEnumToGenerations[agency]!
    }
    
    return deserialized[agency] ?? agencyEnumToGenerations[agency]!
}

func appendNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: [Generation], agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        SentrySDK.capture(error: GenerationOrderListError.cannotDecode(String(decoding: data, as: UTF8.self)) as NSError)
        return
    }
    deserialized[agency]!.append(contentsOf: order)
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        data = serialized
    } else {
        SentrySDK.capture(error: GenerationOrderListError.cannotEncode(deserialized) as NSError)
        data = Data()
    }
}

func overwriteNewGenerationOrderList(@AppStorage("generationListOrderNew") to data: Data, order: [Generation], agency: AgencyEnum) {
    guard var deserialized = try? JSONDecoder().decode(GenerationOrderList.self, from: data) else {
        SentrySDK.capture(error: GenerationOrderListError.cannotDecode(String(decoding: data, as: UTF8.self)) as NSError)
        return
    }
    deserialized[agency] = order
    
    if let serialized = try? JSONEncoder().encode(deserialized) {
        data = serialized
    } else {
        SentrySDK.capture(error: GenerationOrderListError.cannotEncode(deserialized) as NSError)
        data = Data()
    }
}
