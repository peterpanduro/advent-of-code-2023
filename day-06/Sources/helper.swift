import Foundation

 public func resourceWithName(_ name: String) throws -> String {
   let currentFile = URL(fileURLWithPath: #file)
    let currentDirectory = currentFile.deletingLastPathComponent().deletingLastPathComponent()
    let fileURL = currentDirectory.appendingPathComponent("Resources/\(name)")
    return try String(contentsOf: fileURL)
}
