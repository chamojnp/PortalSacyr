//
//  ACUser.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACUser.h"

@interface ACUser () <MTLJSONSerializing>

@end

@implementation ACUser

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userName"      : @"UserName",
             @"password" : @"Pass",
             @"name" : @"Name",
             @"email" : @"Mail",
             @"lastname" : @"LastName"
             };
}

- (NSString *)completeName
{
    return [NSString stringWithFormat:@"%@ %@", self.name, self.lastname];
}





@end
