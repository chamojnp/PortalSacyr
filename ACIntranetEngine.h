//
//  ACIntranetEngine.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

//#import "AFHTTPSessionManager.h"
#import <AFNetworking.h>
#import "ACUser.h"
#import "ACDirectoryEmployeeTableViewCell.h"


@protocol ACIntranetEngineDelegate;

typedef void (^RequestSuccess)(id data);
typedef void (^RequestError)(NSError *error);


@interface ACIntranetEngine : NSObject



@property(nonatomic) id<ACIntranetEngineDelegate> delegate;
          

- (void) getUserFromLogin:(NSString *)userName andPass:(NSString *)pass;

- (void) searchEmployees:(NSString *)name andLastName:(NSString *)lastName andEmail:(NSString *)email
           andCodEmpresa:(NSString*)codEmpresa andCodDpt:(NSString*)codDpt andCodCTrabajo:(NSString*)codCTrabajo;


- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock;

+ (void)downloadImageUsingUrl:(NSString *)url completion:(void(^)(UIImage *image))completion;

+(void)downLoadImageWithUrlAsync:(NSString *)urlImage completion:(void(^)(UIImage *image))completion;


+(UIImage *)getImageFromURL:(NSString *)url;


@end

@protocol ACIntranetEngineDelegate <NSObject>

-(void)loginOK:(ACUser *)acuser;

-(void)loginError:(NSString *)error;

-(void)searchEmployeeOK:(NSArray *)empArr;

-(void)searchEmployeeError:(NSString*)error;


@end
