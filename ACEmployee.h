//
//  ACEmployee.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface ACEmployee : MTLModel


@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *lastname;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *telephone;
@property (copy, nonatomic) NSString *mobile;
@property (copy, nonatomic) NSString *mobileLocal;
@property (copy, nonatomic) NSString *urlImage;
@property (copy, nonatomic) NSString *idCentro;
@property (copy, nonatomic) NSString *codEmpresa;
@property (copy, nonatomic) NSString *codUO;

@property (copy, nonatomic) NSString *nameEmpresa;
@property (copy, nonatomic) NSString *nameCT;
@property (copy, nonatomic) NSString *nameUO;



- (NSString *)completeName;

@end
