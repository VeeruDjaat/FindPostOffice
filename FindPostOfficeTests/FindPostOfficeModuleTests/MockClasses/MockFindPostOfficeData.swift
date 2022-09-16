//
//  MockFindPostOfficeData.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
@testable import FindPostOffice

class MockFindPostOfficeData {

    static var postOfficeDomainData: FindPostOfficeDomainData {
        
        guard let data = readLocalJSONFile(forName: "PostOffice") else {
            return FindPostOfficeDomainData()
            
        }
        
        guard let modal = parse(jsonData: data) else {
            return FindPostOfficeDomainData()
            
        }
        
        guard let domainmodal = modal.first?.toDomain() else {
            return FindPostOfficeDomainData()
            
        }
        
        return domainmodal
    }
    
    static var postOfficeData:Data {
        guard let data = readLocalJSONFile(forName: "PostOffice") else {return Data()}
        return data
    }
    
    
    static var postOffice: PostOffice {
        
        guard let data = readLocalJSONFile(forName: "PostOffice") else {return PostOffice()}
        guard let modal = parse(jsonData: data) else {return PostOffice()}
        
        return modal
    }
    
    static  func readLocalJSONFile(forName name: String) -> Data? {
        do {
            
            let bundle = Bundle(for: MockFindPostOfficeData.self)
            
            if let filePath = bundle.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    static  func parse(jsonData: Data) -> PostOffice? {
        do {
            let decodedData = try JSONDecoder().decode(PostOffice.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}

