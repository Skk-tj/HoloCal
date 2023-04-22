//
//  holo_wtfApp.swift
//  holo-wtf
//
//
//

import SwiftUI
import Sentry

@main
struct MainApp: App {
    @AppStorage(UserDefaultKeys.dstDays) var dstDays: Int = 5
    @AppStorage(UserDefaultKeys.isShowingDSTReminder) var isShowingDSTReminder = false
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    @AppStorage("generationListSelection") var generationSelected = Set(Generation.allCases)
    @AppStorage("excludedGenerations") var excludedGenerations = Set<Generation>()
    
    @AppStorage("generationListOrderNew") var generateListOrder: Data = (try? JSONEncoder().encode(agencyEnumToGenerations)) ?? Data()
    
    init() {
        if let sentryDsn = Bundle.main.object(forInfoDictionaryKey: "SENTRY_DSN") as? String {
            SentrySDK.start { options in
                options.dsn = sentryDsn
                // options.debug = true // Enabled debug when first installing is always helpful
#if DEBUG
                options.environment = "Debug"
                // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
                // We recommend adjusting this value in production.
                options.tracesSampleRate = 1.0
#else
                options.environment = "Release"
                options.tracesSampleRate = 0.5
#endif
            }
        }
        
        // MARK: - Setup DST Warning
        let tz = TimeZone.current
        
        if let nextDSTTransition = tz.nextDaylightSavingTimeTransition {
            if let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDSTTransition).day {
                if days <= dstDays {
                    isShowingDSTReminder = true
                } else {
                    isShowingDSTReminder = false
                }
            }
        } else {
            isShowingDSTReminder = false
        }
        
        // MARK: - Migrate displayed generation
        // When we add generations, we need to handle previous user preferences
        generationSelected = Set(Generation.allCases).subtracting(excludedGenerations)
        
        // MARK: - Migrate generation order
        // Also add the new generation to the order list
        for agency in AgencyEnum.allCases {
            let defaultGenerationOrder = agencyEnumToGenerations[agency]!
            let userSavedGenerationOrder = getGenerationOrderList(from: generateListOrder, agency: agency)
            
            if userSavedGenerationOrder.count != defaultGenerationOrder.count {
                let difference = Set(defaultGenerationOrder).symmetricDifference(userSavedGenerationOrder)
                appendNewGenerationOrderList(to: generateListOrder, order: Array(difference), agency: agency)
            }
        }
        
        // MARK: - Clean up orphaned favourites
        let toRemove: [String] = favourited.filter { TalentEnum(rawValue: $0) == nil }
        
        favourited.removeAll { favourite in
            toRemove.contains(where: { $0 == favourite })
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                TabletSplitView()
            } else {
                PhoneTabView()
            }
        }
    }
}
