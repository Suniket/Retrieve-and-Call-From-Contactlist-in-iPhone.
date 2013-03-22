//
//  addressBookViewController.m
//  Retrieve Contacts
//
//  Created by Suniket Wagh on 04/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "addressBookViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface addressBookViewController ()

@end

@implementation addressBookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getContact:(id)sender {
    
    // creating the picker
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
	// place the delegate of the picker to the controll
	picker.peoplePickerDelegate = self;
	
	// showing the picker
	[self presentViewController:picker animated:YES completion:nil];
	// releasing
	
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    // assigning control back to the main controller
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	// setting the first name
    firstNameTextField.text = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
	
	// setting the last name
    lastNameTextField.text = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
	
	// setting the number
	/*
	 this function will set the first number it finds
	 
	 if you do not set a number for a contact it will probably
	 crash
	 */
	ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
	numberTextField.text = (__bridge NSString*)ABMultiValueCopyValueAtIndex(multi, 0);
	
    NSString* msg = [NSString stringWithFormat:@"Do you want to call %@ ", firstNameTextField.text];
    
    UIAlertView *callAlert = [[UIAlertView alloc]
                               initWithTitle:msg
                               message: numberTextField.text
                               delegate:self
                               cancelButtonTitle:@"No"
                               otherButtonTitles:@"Yes", nil];
    [callAlert show];
    
      
	// remove the controller
   
     [self dismissViewControllerAnimated:YES completion:Nil];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        NSLog(@"buttonIndex: 0");


    }else if (buttonIndex == 1){
        phone_number = numberTextField.text;
        phoneStr = [[NSString alloc] initWithFormat:@"tel:%@",phone_number];
        NSURL *phoneURL = [[NSURL alloc] initWithString:phoneStr];
        [[UIApplication sharedApplication] openURL:phoneURL];
        NSLog(@"buttonIndex: 1");
    }
}

@end
