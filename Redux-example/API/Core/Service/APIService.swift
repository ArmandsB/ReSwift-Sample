//
//  APIService.swift
//  CoreAPI
//
//  Created by Armands Baurovskis on 23/05/2019.
//  Copyright © 2019 iOSCoder All rights reserved.
//

import Foundation

public protocol APIService {
  var service: APIClient { get }
}
