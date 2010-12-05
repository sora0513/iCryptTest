//
//  RootViewController.h
//  CryptTest
//
//  Created by tkawano on 12/4/10.
//  Copyright 2010 Fusic. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController <UITextFieldDelegate> {
@private
	UITextField *textField_;
	UILabel *cryptLabel_;
	UILabel *decryptLabel_;
}

@end
