//
//  addressBookViewController.h
//  Retrieve Contacts
//
//  Created by Suniket Wagh on 04/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface addressBookViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>
{

    IBOutlet UIButton *contactButton;
    IBOutlet UILabel *firstNameTextField;

    IBOutlet UILabel *numberTextField;
    IBOutlet UILabel *lastNameTextField;
}
- (IBAction)getContact:(id)sender;
@end
