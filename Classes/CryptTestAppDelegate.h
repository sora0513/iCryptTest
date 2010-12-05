//
//  CryptTestAppDelegate.h
//  CryptTest
//
//  Created by tkawano on 12/4/10.
//  Copyright 2010 Fusic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface CryptTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
@private
	RootViewController *rootViewController_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

