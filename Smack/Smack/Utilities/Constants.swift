//
//  Constants.swift
//  Smack
//
//  Created by Bari Abdul on 1/22/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

let BASE_URL = "https://mychatappv1.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
