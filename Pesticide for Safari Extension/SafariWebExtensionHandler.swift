//
//  SafariWebExtensionHandler.swift
//  Pesticide for Safari Extension
//
//  Created by Alex Crocker on 2/3/21.
//

import SafariServices

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    // Receive a message from the JavaScript component of the Web Extension.
    // Unpack the message, and then wrap in an object to send as the response.
    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as? NSExtensionItem
        let message = item?.userInfo?[SFExtensionMessageKey]

        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "Response to": message ] ]
        
        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
    
}
