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

// spelled out rather than using @main, so the startup sequence is visible.
let application = NSApplication.shared
let app_delegate = AppDelegate()
application.delegate = app_delegate
application.setActivationPolicy(.regular)
application.run()
