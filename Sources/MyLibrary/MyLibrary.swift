// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit

public struct Test {
    public static func getDocumentsDirectory() -> URL? {
        let directoryPath =  NSHomeDirectory().appending("/Documents/")
        if !FileManager.default.fileExists(atPath: directoryPath) {
            do {
                try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
        return URL(string: directoryPath)
    }

    
    public static func loadScreenshot() -> UIImage? {
        guard let directory = getDocumentsDirectory() else { return nil }
        let filePath = directory.appendingPathComponent("screenshot.png")
        
        if FileManager.default.fileExists(atPath: filePath.path) {
            return UIImage(contentsOfFile: filePath.path)
        }
        
        print("Screenshot not found")
        return nil
    }

}
