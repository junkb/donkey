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
import Martin

final class DonkeyAppDelegate: NSObject, NSApplicationDelegate {

    private var main_window_controller: MainWindowController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        install_main_menu()

        // proves martin is linked and loadable in the app process. nothing is
        // connected yet; tier 2 replaces this with a real service layer.
        let client = XMPPClient()
        NSLog("donkey: martin linked, xmppclient is %@", String(describing: type(of: client)))

        let controller = MainWindowController()
        controller.showWindow(self)
        main_window_controller = controller

        NSApp.activate()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // a chat client should outlive its windows. this becomes false once
        // there is a status item or dock badge to run behind.
        true
    }

    // MARK: - menu

    /// built in code rather than loaded from a mainmenu nib. macos needs an
    /// application menu before the first window appears, or standard key
    /// equivalents — cmd-q, cmd-w — silently do nothing.
    private func install_main_menu() {
        let name = "donkey"
        let main_menu = NSMenu()

        let app_item = NSMenuItem()
        let app_menu = NSMenu()
        app_menu.addItem(withTitle: "about \(name)",
                         action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)),
                         keyEquivalent: "")
        app_menu.addItem(.separator())
        app_menu.addItem(withTitle: "hide \(name)",
                         action: #selector(NSApplication.hide(_:)),
                         keyEquivalent: "h")
        app_menu.addItem(.separator())
        app_menu.addItem(withTitle: "quit \(name)",
                         action: #selector(NSApplication.terminate(_:)),
                         keyEquivalent: "q")
        app_item.submenu = app_menu
        main_menu.addItem(app_item)

        let window_item = NSMenuItem()
        let window_menu = NSMenu(title: "window")
        window_menu.addItem(withTitle: "close",
                            action: #selector(NSWindow.performClose(_:)),
                            keyEquivalent: "w")
        window_menu.addItem(withTitle: "minimize",
                            action: #selector(NSWindow.performMiniaturize(_:)),
                            keyEquivalent: "m")
        window_item.submenu = window_menu
        main_menu.addItem(window_item)

        NSApp.mainMenu = main_menu
        NSApp.windowsMenu = window_menu
    }
}
