//
//  AppDelegate.h
//  Retrieve Contacts
//
//  Created by Suniket Wagh on 04/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addressBookViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    addressBookViewController *viewController;

}
@property (strong, nonatomic) UIWindow *window;

@end
