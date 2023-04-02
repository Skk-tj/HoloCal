//
//  VideoSorting.swift
//  holo-wtf
//
//
//

import Foundation

/// The video that started most recently goes first
func liveSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? (l1.startScheduled ?? Date.distantFuture) > l2.startActual ?? (l2.startScheduled ?? Date.distantFuture)
}

/// The video that starts the soonest goes first
func upcomingSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? (l1.startScheduled ?? Date.distantFuture) < l2.startActual ?? (l2.startScheduled ?? Date.distantFuture)
}

/// The video that ended most recently goes first
func pastSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.endedAt > l2.endedAt
}
