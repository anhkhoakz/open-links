//
//  open_linksApp.swift
//  open-links
//
//  Created by Nguyen Huynh Anh Khoa on 28/7/25.
//

import SwiftUI

@main
struct open_linksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: NSWindow.willCloseNotification)) { notification in
                    if let window = notification.object as? NSWindow, window.isMainWindow {
                        NSApplication.shared.terminate(nil)
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .commands {
            CommandGroup(replacing: .newItem) { }
            CommandGroup(after: .windowArrangement) {
                Button("Quit Open Links") {
                    NSApplication.shared.terminate(nil)
                }
                .keyboardShortcut("q")
            }
            CommandGroup(after: .newItem) {
                Button("Settings...") {
                    // This will be handled by the ContentView's settings button
                }
                .keyboardShortcut(",", modifiers: [.command])
            }
        }
    }
}
