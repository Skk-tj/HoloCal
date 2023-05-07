//
//  VideoSorting.swift
//  holo-wtf
//
//
//

import Foundation

/// The video that started most recently goes first
func liveSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? l1.availableAt > l2.startActual ?? l2.availableAt
}

/// The video that starts the soonest goes first
func upcomingSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startScheduled ?? l1.availableAt < l2.startScheduled ?? l2.availableAt
}

/// The video that ended most recently goes first
func pastSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.endedAt > l2.endedAt
}
