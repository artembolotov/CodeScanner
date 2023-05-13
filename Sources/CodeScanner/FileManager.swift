//
//  FileManager.swift
//  TwinKey
//
//  Created by artembolotov on 13.05.2023.
//

import Foundation

extension FileManager {
    static func clearTmpDir() {
        let fileManager = self.default
        let tempDirURL = fileManager.temporaryDirectory

        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: tempDirURL, includingPropertiesForKeys: .none)

            for file in directoryContents {
                do {
                    try fileManager.removeItem(at: file)
                } catch {
                    print("Error while deleting file. \(error.localizedDescription)")
                }
            }
        } catch {
            print("Error! \(error.localizedDescription)")
        }
    }
}
