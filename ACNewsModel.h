//
//  ACNewsModel.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 21/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACIntranetEngine.h"


@interface ACNewsModel : NSObject


@property (nonatomic,strong) NSArray *lastNews;

-(void)cargaNewsPruebas;

- (void)getNewsWithSuccessBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock;

- (void)getImageNewsFromURL:(NSString *)urlImage successBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock;

@end

