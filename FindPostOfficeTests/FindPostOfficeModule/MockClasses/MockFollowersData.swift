//
//  MockFindPostOfficeData.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
@testable import FindPostOffice

struct MockFindPostOfficeData {

    static let follower: [Follower]? = [Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" )]
}

extension MockFindPostOfficeData {
    static func mockDictionary() -> Data {
        let encoded = try? JSONEncoder().encode(follower)
        return encoded ?? Data()
    }
}
