//
//  DSTReminderView.swift
//  holo-wtf
//
//
//

import SwiftUI

enum DSTChangeType {
    case starting
    case ending
}

struct DSTReminderView: View {
    let numberOfDaysToChange: Int
    let changeType: DSTChangeType
    
    @Binding var isShowingDSTReminder: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("DST_REMINDER_VIEW_TITLE")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isShowingDSTReminder = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.secondary)
                })
                .buttonStyle(.borderless)
            }
            .padding(.bottom)
            
            Text("DST_REMINDER_VIEW_TEXT \(changeType == .starting ? "starting" : "ending") \(numberOfDaysToChange)")
                .padding(.bottom)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Text("DST_REMINDER_VIEW_FOOTER")
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct DSTReminderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DSTReminderView(numberOfDaysToChange: 5, changeType: .starting, isShowingDSTReminder: Binding.constant(true))
                .padding(.horizontal)
                .preferredColorScheme(.dark)
                
            DSTReminderView(numberOfDaysToChange: 5, changeType: .ending, isShowingDSTReminder: Binding.constant(false))
                .padding(.horizontal)
        }
    }
}
