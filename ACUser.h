//
//  ACUser.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import <Mantle.h>

@interface ACUser : MTLModel

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *lastname;

- (NSString *)completeName;


@end
