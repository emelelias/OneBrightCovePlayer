//
//  OnePlayer.swift
//  OneBrightcovePlayer
//
//  Created by Emel Elias on 2019-10-08.
//  Copyright © 2019 Emel Elias. All rights reserved.
//

import Foundation
import UIKit
public protocol OnePlayer {

    func playerView() -> UIView?

    func play(url: String)

    func pause()
}
