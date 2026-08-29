//
//  donkey — an xmpp client for macos
//
//  copyright 2026 the donkey authors
//
//  this program is free software: you can redistribute it and/or modify it
//  under the terms of the gnu general public license as published by the free
//  software foundation, either version 3 of the license or, at your option,
//  any later version.
//
//  this program is distributed in the hope that it will be useful, but
//  without any warranty; without even the implied warranty of merchantability
//  or fitness for a particular purpose. see the gnu general public license for
//  more details.
//
//  you should have received a copy of the gnu general public license along
//  with this program. if not, see https://www.gnu.org/licenses/
//

import AppKit

/// holds the contact list.
final class MainWindowController: NSWindowController {

    convenience init() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 260, height: 520),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "donkey"
        window.center()

        // remembers position and size across launches, under this name.
        window.setFrameAutosaveName("main-window")

        self.init(window: window)
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        let label = NSTextField(labelWithString: "no accounts")
        label.textColor = .secondaryLabelColor
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        guard let content_view = window?.contentView else { return }
        content_view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: content_view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: content_view.centerYAnchor),
        ])
    }
}
