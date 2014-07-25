//
//  ACEmployee.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACEmployee.h"


@interface ACEmployee () <MTLJSONSerializing>

@end


@implementation ACEmployee



#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userName"      : @"UserName",
             @"name" : @"Name",
             @"lastname" : @"LastName",
             @"email" : @"Mail",
             @"telephone" : @"Telephone",
             @"mobile" : @"Mobile",
             @"mobileLocal" : @"MobileLocal",
             @"urlImage" : @"URLImage",
             @"idCentro" : @"IDCentro",
             @"codEmpresa" : @"CodEmpresa",
             @"codUO" : @"CodUO",
             @"nameEmpresa" : @"NameEmpresa",
             @"nameCT" : @"NameCT",
             @"nameUO" : @"NameUO"
             };
}



- (NSString *)completeName
{
    return [NSString stringWithFormat:@"%@ %@", self.name, self.lastname];
}





@end
