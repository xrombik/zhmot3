//
//  main.m
//  zhmot3
//
//  Created by Иван Иванов on 03.01.2020.
//  Copyright © 2020 Иван Иванов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    NSString * appDelegateClassName;
    @autoreleasepool
    {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }

    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
