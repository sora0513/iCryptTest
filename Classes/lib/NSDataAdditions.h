//
//  NSDataAdditions.h
//  CryptTest
//
//  Created by sora on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString; 

@interface NSData (Additions)

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
- (NSString *)newStringInBase64FromData;

@end
