//
//  HoloCalTests.swift
//  HoloCalTests
//
//
//

import XCTest

final class VideoSortingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSortLives1() throws {
        /// This live actually started 1 minutes ago
        let live1 = LiveVideo(id: "0", title: "test live1", topicId: nil, startScheduled: Date() - 5 * 60, startActual: Date() - 1 * 60, availableAt: Date(), publishedAt: Date() - 3 * 60 * 24, liveViewers: 0, mentions: [], duration: 0, channel: Channel.testChannel)
        
        /// This live actually started 2 minutes ago
        let live2 = LiveVideo(id: "1", title: "test live2", topicId: nil, startScheduled: Date() - 5 * 60, startActual: Date() - 2 * 60, availableAt: Date(), publishedAt: Date() - 3 * 60 * 24, liveViewers: 0, mentions: [], duration: 0, channel: Channel.testChannel)
        
        let sorted = [live1, live2].sorted(by: liveSortStrategy)
        
        XCTAssertEqual(sorted, [live1, live2])
    }

    func testSortLives2() throws {
        /// This live actually started 3 minutes ago
        let live1 = LiveVideo(id: "0", title: "test live1", topicId: nil, startScheduled: Date() - 5 * 60, startActual: Date() - 3 * 60, availableAt: Date(), publishedAt: Date() - 3 * 60 * 24, liveViewers: 0, mentions: [], duration: 0, channel: Channel.testChannel)
        
        /// This live actually started 2 minutes ago
        let live2 = LiveVideo(id: "1", title: "test live2", topicId: nil, startScheduled: Date() - 5 * 60, startActual: Date() - 2 * 60, availableAt: Date(), publishedAt: Date() - 3 * 60 * 24, liveViewers: 0, mentions: [], duration: 0, channel: Channel.testChannel)
        
        let sorted = [live1, live2].sorted(by: liveSortStrategy)
        
        XCTAssertEqual(sorted, [live2, live1])
    }
}
