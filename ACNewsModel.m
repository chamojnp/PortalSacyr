//
//  ACNewsModel.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 21/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACNewsModel.h"
#import "ACNews.h"

@interface ACNewsModel()

@property (strong,nonatomic) ACIntranetEngine *requestManager;
@end

@implementation ACNewsModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestManager=[[ACIntranetEngine alloc] init];
    }
    return self;
}

-(void)cargaNewsPruebas{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"json"];
    
    NSError *localError;
    NSData *jSONData = [NSData dataWithContentsOfFile:filePath options:0 error:&localError];
    if(jSONData && !localError){
        //todo ok
        [self generateNews:jSONData];
        
    }else
    {
        //en caso de error
        NSLog(@"ERROR al cargar el jSON de noticias");
    }
    
}

-(void) generateNews:(NSData*) jSONData{
    
    NSParameterAssert(jSONData);
    
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jSONData options:0 error:&localError];
    
    NSDictionary *parsedObject = (id)jsonObject;
    
    if(parsedObject == nil)
    {
        NSLog(@"ERROR parseando el jSON de noticias");
        return;
    }
    
    NSArray *newsParsed = [parsedObject objectForKey:@"news"];
    if(newsParsed == nil)
    {
        NSLog(@"Error parseando json noticias. No hay tad 'news'");
        return;
    }
    
    NSMutableArray* results = [[NSMutableArray alloc] init];
    
    for (NSDictionary *newsDic in newsParsed)
    {
        ACNews *acnew = [[ACNews alloc]init];
        acnew.title = [newsDic valueForKey:@"title"];
        acnew.image = [newsDic valueForKey:@"image"];
        acnew.descripcion = [newsDic valueForKey:@"descripcion"];
        
        [results addObject:acnew];
        
    }
    
    //esto se hace porque la propiedad no me interesa que sea mutable
    self.lastNews = results.copy;
    
    
}

- (void)getNewsWithSuccessBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock{
    NSString *path=@"news/news.json";
    NSDictionary *parameters=@{};
    [self.requestManager GET:path parameters:parameters successBlock:^(id data) {
        NSDictionary *parsedObject = (id)data;
        
        if(parsedObject == nil)
        {
            NSLog(@"ERROR parseando el jSON de noticias");
            return;
        }
        
        NSArray *newsParsed = [parsedObject objectForKey:@"news"];
        if(newsParsed == nil)
        {
            NSLog(@"Error parseando json noticias. No hay tad 'news'");
            return;
        }
        
        NSMutableArray* results = [[NSMutableArray alloc] init];
        
        for (NSDictionary *newsDic in newsParsed)
        {
            ACNews *acnew = [[ACNews alloc]init];
            acnew.title = [newsDic valueForKey:@"title"];
            acnew.image = [newsDic valueForKey:@"image"];
            acnew.descripcion = [newsDic valueForKey:@"descripcion"];
            
            [results addObject:acnew];
            
        }
        
        //esto se hace porque la propiedad no me interesa que sea mutable
         successBlock(results.copy);
        
    } errorBlock:^(NSError *error) {
         errorBlock(error);
        
    }];
    
}

- (void)getImageNewsFromURL:(NSString *)urlImage successBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock{
    
    NSDictionary *parameters=@{};
    [self.requestManager GET:urlImage parameters:parameters successBlock:^(id data) {
        
        UIImage *img = [UIImage imageWithData:data];
        successBlock(img);
        
    } errorBlock:^(NSError *error) {
        errorBlock(error);
        
    }];
    
    
}







@end


