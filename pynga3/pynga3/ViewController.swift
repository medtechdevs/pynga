//
//  ViewController.swift
//  pynga3
//
//  Created by Esuabom David Dijemeni on 05/12/2015.
//  Copyright © 2015 MedTechDevs. All rights reserved.
//

import UIKit

import p2_OAuth2

//OAuth2

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let settings = [
            "client_id": "my_swift_app",
            "client_secret": "C7447242-A0CF-47C5-BAC7-B38BA91970A9",
            "authorize_uri": "https://authorize.smarthealthit.org/authorize",
            "token_uri": "https://authorize.smarthealthit.org/token",   // code grant only!
            "scope": "profile email",
            "redirect_uris": ["myapp://oauth/callback"],   // don't forget to register this scheme
            "keychain": false,     // if you DON'T want keychain integration
            "title": "My Service"  // optional title to show in views
            ] as OAuth2JSON
        
        let oauth2 = OAuth2CodeGrant(settings: settings)
        
        oauth2.onAuthorize = { parameters in
            print("Did authorize with parameters: \(parameters)")
            
            
            
            
        }
        
        oauth2.onFailure = { error in        // `error` is nil on cancel
            
            if nil != error {
                //print("Authorization went wrong: \(error!.localizedDescription)")
                print("Authorization went wrong:")
            }
            
        }
        
        oauth2.authConfig.authorizeEmbedded = true
        //oauth2.authConfig.authorizeContext = self.window.
        // see **Advanced Settings** for more options
        oauth2.authorize()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

