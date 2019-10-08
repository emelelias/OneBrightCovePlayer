//
//  OneBrightcovePlayer.swift
//  OneBrightcovePlayer
//
//  Created by Emel Elias on 2019-10-08.
//  Copyright © 2019 Emel Elias. All rights reserved.
//

import Foundation
import UIKit
import BrightcovePlayerSDK

public class OneBrightCovePlayer: NSObject, OnePlayer, BCOVPlaybackControllerDelegate {
    private let accountID: String
    private let policyKey: String
    private let brightCoveManager: BCOVPlayerSDKManager = BCOVPlayerSDKManager.shared()
    private var bcovPlaybackController: BCOVPlaybackController?

    public init(policyKey: String, accountId: String) {
        self.policyKey = policyKey
        self.accountID = accountId
        super.init()
        self.bcovPlaybackController = brightCoveManager.createPlaybackController(
            with: sessionProvidersWithoutAds(),
            viewStrategy: nil)

    }

    public func playerView() -> UIView? {
        print("here in playerView!!")
        let playerView = BCOVPUIPlayerView(playbackController: self.bcovPlaybackController, options: nil)
        return playerView
    }
    
    public func play(url: String) {
        let playbackService: BCOVPlaybackService? = {
               guard let playbackServiceRequestFactory = BCOVPlaybackServiceRequestFactory(
                   accountId: self.accountID,
                   policyKey: self.policyKey ) else {
                       return nil
               }
               return BCOVPlaybackService(requestFactory: playbackServiceRequestFactory)
           }()
           print("in play call")
           /// Retrieves a `BCOVVideo` with the given video ID from the `BCOVPlaybackService`.
           playbackService?.findVideo(withVideoID: url, parameters: nil) { video, _, error in
                      guard let video = video else {
                          return
                      }
                    print("found BCOVideo \(video)!!")
                    DispatchQueue.main.async {

                    self.bcovPlaybackController?.setVideos(NSArray(array: [video]))
                    self.bcovPlaybackController?.play()
                    }
            }
               
    }
    private func brightcoveServiceRequestDidFail(error: Error?) {
    }
    
    public func pause() {
        
    }
    
    private func sessionProvidersWithoutAds() -> BCOVPlaybackSessionProvider {
           let proxy = BCOVFPSBrightcoveAuthProxy(publisherId: nil, applicationId: nil)
           
           let fairPlaySessionProvider: BCOVPlaybackSessionProvider = brightCoveManager.createFairPlaySessionProvider(
               with: proxy!,
               upstreamSessionProvider: nil)
           
           let sidercarSessionProvider: BCOVPlaybackSessionProvider = brightCoveManager.createSidecarSubtitlesSessionProvider(
               withUpstreamSessionProvider: fairPlaySessionProvider)
           
           return sidercarSessionProvider
       }
    
}

extension OneBrightCovePlayer {
    
    public func playbackController(
          _ controller: BCOVPlaybackController!,
          didAdvanceTo session: BCOVPlaybackSession!) {
        
    }
}
