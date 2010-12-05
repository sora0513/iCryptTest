    //
//  RootViewController.m
//  CryptTest
//
//  Created by tkawano on 12/4/10.
//  Copyright 2010 Fusic. All rights reserved.
//

#import "RootViewController.h"

#import "NSDataAdditions.h"


@interface RootViewController()
@end


@implementation RootViewController

- (id)init {
	self = [super init];
	if (self != nil) {
		
		// 画面作成
		CGSize frameSize = self.view.frame.size;
		
		NSUInteger height = 0;
		textField_ = [[UITextField alloc] initWithFrame:CGRectMake(0, 
																   0, 
																   frameSize.width, 
																   height + 50)];
		textField_.backgroundColor = [UIColor whiteColor];
		textField_.delegate = self;
		textField_.placeholder = @"ここに何かを入力してください。";
		textField_.keyboardType = UIKeyboardTypeASCIICapable;
		textField_.returnKeyType = UIReturnKeyDone;
		[self.view addSubview:textField_];
		height += 50;
		
		cryptLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 
																height, 
																frameSize.width, 
																((frameSize.height - height) / 2))];
		cryptLabel_.backgroundColor = [UIColor grayColor];
		cryptLabel_.textColor = [UIColor whiteColor];
		[self.view addSubview:cryptLabel_];
		
		decryptLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 
																  ((frameSize.height - height) / 2), 
																  frameSize.width, 
																  ((frameSize.height - height) / 2))];
		[self.view addSubview:decryptLabel_];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField*)textField {
	// キーの作成
	NSString *key = @"fufufufufufusic-";

	// 暗号化
	NSData *plain = [textField.text dataUsingEncoding:NSUTF8StringEncoding];
	NSData *cipher = [plain AES256EncryptWithKey:key];
	NSLog(@"%@", [cipher description]);
	cryptLabel_.text = [cipher newStringInBase64FromData];

	// 暗号化解除
	plain = [cipher AES256DecryptWithKey:key];
	NSLog(@"%@", [[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding]);
	decryptLabel_.text = [[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // キーボードを隠す
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[textField_ release];
	[cryptLabel_ release];
	[decryptLabel_ release];
    [super dealloc];
}


@end
