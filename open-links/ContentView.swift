//
//  ContentView.swift
//  open-links
//
//  Created by Nguyen Huynh Anh Khoa on 28/7/25.
//

import SwiftUI
import AppKit

struct ContentView: View {
    @State private var linksText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Open Links")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Paste links below, one per line")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            GroupBox("Links") {
                ZStack(alignment: .topLeading) {
                    if linksText.isEmpty {
                        Text("Paste or enter URLs here…")
                            .foregroundStyle(.tertiary)
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }
                    TextEditor(text: $linksText)
                        .font(.system(.body, design: .monospaced))
                        .frame(minHeight: 220)
                        .padding(.horizontal, 4)
                        .scrollContentBackground(.hidden)
                }
                .padding(6)
            }

            HStack(spacing: 8) {
                Spacer()
                Button(action: pasteFromClipboard) {
                    Label("Paste", systemImage: "doc.on.clipboard")
                }
                .keyboardShortcut("v", modifiers: [.command])
                .controlSize(.large)
                .buttonStyle(.bordered)

                Button(action: openAllLinks) {
                    Label("Open All", systemImage: "link.circle")
                }
                .keyboardShortcut(.return, modifiers: [.command])
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .tint(.accentColor)
                .disabled(extractURLs(from: linksText).isEmpty)

                Button(role: .destructive, action: clearAll) {
                    Label("Clear", systemImage: "trash")
                }
                .keyboardShortcut(.delete, modifiers: [.command])
                .controlSize(.large)
                .buttonStyle(.bordered)
                .disabled(linksText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(20)
        .frame(minWidth: 520, maxWidth: 640)
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Open Links Application")
        .accessibilityHint("Paste or enter URLs to open them in your default browser")
    }

    private func pasteFromClipboard() {
        if let clipboard = NSPasteboard.general.string(forType: .string) {
            linksText = clipboard
        }
    }

    private func clearAll() {
        linksText = ""
    }

    private func openAllLinks() {
        let urls = extractURLs(from: linksText)
        for url in urls {
            NSWorkspace.shared.open(url)
        }
    }

    private func extractURLs(from text: String) -> [URL] {
        let lines = text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        var urls: [URL] = []
        var seen = Set<String>()

        for line in lines {
            var candidate = line
            if !candidate.hasPrefix("http://"), !candidate.hasPrefix("https://") {
                candidate = "https://" + candidate
            }
            if let url = URL(string: candidate), let host = url.host, !host.isEmpty {
                let key = url.absoluteString
                if !seen.contains(key) {
                    seen.insert(key)
                    urls.append(url)
                }
            }
        }
        return urls
    }
}

// #Preview {
//     ContentView()
// }
