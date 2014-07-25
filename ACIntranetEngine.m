//
//  ACIntranetEngine.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACIntranetEngine.h"
#import "ACUser.h"
#import "ACEmployee.h"
#import "AFHTTPRequestOperationManager.h"


typedef enum{
    jsonGetLoginUsuarioResult,
    jsonFindEmpleados
    
}NameWebMethod;

@interface ACIntranetEngine () <NSXMLParserDelegate>{

    NSString *element;
    NSString *findElement;
    BOOL elementExist;
    ACUser *acuser;
   
    
}
@end

@implementation ACIntranetEngine

- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestSuccess)successBlock errorBlock:(RequestError)errorBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[kIntranetBaseURL stringByAppendingPathComponent:path] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}



- (void) getUserFromLogin:(NSString *)userName andPass:(NSString *)pass {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@wsintranet.asmx?op=jsonGetLoginUsuario", kIntranetBaseURL]];
    
    NSString *soapBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><jsonGetLoginUsuario xmlns=\"http://tempuri.org/\"><strUsuario>%@</strUsuario><strPass>%@</strPass></jsonGetLoginUsuario></soap:Body></soap:Envelope>", userName, pass ];
    
    
    findElement=@"jsonGetLoginUsuarioResult";
    elementExist = NO;
    if(element!=nil)
        element=nil;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[soapBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request addValue:@"http://tempuri.org/jsonGetLoginUsuario" forHTTPHeaderField:@"SOAPAction"];
    
    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // do whatever you'd like here; for example, if you want to convert
        // it to a string and log it, you might do something like:
        
       // NSString *res = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
       // NSLog(@"RESPUESTA WEBSERVICE  %@", res);
        
        
        
        //NSXMLParser  *XMLParser = (NSXMLParser  *)responseObject;
        //[XMLParser setShouldProcessNamespaces:YES];
        
        
        NSXMLParser  *XMLParser = [[NSXMLParser alloc] initWithData:responseObject];
        XMLParser.delegate = self;
        [XMLParser parse];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s: AFHTTPRequestOperation error: %@", __FUNCTION__, error);
    }];
    
    
    [operation start];
    
    
}


- (void) searchEmployees:(NSString *)name andLastName:(NSString *)lastName andEmail:(NSString *)email
           andCodEmpresa:(NSString*)codEmpresa andCodDpt:(NSString*)codDpt andCodCTrabajo:(NSString*)codCTrabajo
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@wsintranet.asmx?op=jsonFindEmpleados", kIntranetBaseURL]];
    
    NSString *soapBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><jsonFindEmpleados xmlns=\"http://tempuri.org/\"><strNombre>%@</strNombre><strApellidos>%@</strApellidos><strEmail>%@</strEmail><codEmpresa>%@</codEmpresa><codDpt>%@</codDpt><codCTrabajo>%@</codCTrabajo></jsonFindEmpleados></soap:Body></soap:Envelope>", name, lastName, email, codEmpresa, codDpt, codCTrabajo ];
    
    
    findElement=@"jsonFindEmpleadosResult";
    elementExist = NO;
    if(element!=nil)
        element=nil;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[soapBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request addValue:@"http://tempuri.org/jsonFindEmpleados" forHTTPHeaderField:@"SOAPAction"];
    
    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSXMLParser  *XMLParser = [[NSXMLParser alloc] initWithData:responseObject];
        XMLParser.delegate = self;
        [XMLParser parse];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s: AFHTTPRequestOperation error: %@", __FUNCTION__, error);
    }];
    
    [operation start];
    
}


+(void)downLoadImageWithUrlAsync:(NSString *)urlImage andCellImage:(ACDirectoryEmployeeTableViewCell*)cell{
    
    NSURL *url = [NSURL URLWithString: [NSString  stringWithFormat:@"%@fotos/%@", kIntranetBaseURL ,urlImage]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFImageResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        cell.imgEmp.image = responseObject;
        //imageViewCell =(UIImage*) responseObject;
        
        //[self saveImage:responseObject withFilename:@"background.png"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        cell.imgEmp.image = [UIImage imageNamed:@"sinfoto.jpg"];
        //imageViewCell.image = [UIImage imageNamed:@"sinfoto.jpg"];
    }];
    
    [operation start];
}

+(void)downLoadImageWithUrlAsync:(NSString *)urlImage completion:(void(^)(UIImage *image))completion{
    NSURL *url = [NSURL URLWithString: [NSString  stringWithFormat:@"%@fotos/%@", kIntranetBaseURL ,urlImage]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFImageResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        completion(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    [operation start];
}

+ (void)downloadImageUsingUrl:(NSString *)url completion:(void(^)(UIImage *image))completion {
    
    dispatch_async(BACKGROUND_QUEUE, ^{
        
        //NSURL *myUrl = [NSURL URLWithString:[ACIntranetBaseURL stringByAppendingPathComponent:url]];
         NSURL *myUrl = [NSURL URLWithString: [NSString  stringWithFormat:@"%@fotos/%@", kIntranetBaseURL ,url]];
        NSData *data = [NSData dataWithContentsOfURL:myUrl];
        UIImage *img = [UIImage imageWithData:data];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(img);
        });
    });
    
}

+(UIImage *)getImageFromURL:(NSString *)url{
    NSURL *myUrl = [NSURL URLWithString:[kIntranetBaseURL stringByAppendingPathComponent:url]];
    NSData *data = [NSData dataWithContentsOfURL:myUrl];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}



- (void) parserDidStartDocument:(NSXMLParser *)parser {
   // NSLog(@"parserDidStartDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:findElement]){
        elementExist = YES;
    }
   // NSLog(@"didStartElement --> %@", elementName);
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(element == nil)
        element = string;
    else
        element = [element stringByAppendingString:string];
    
    //NSLog(@"foundCharacters --> %@", string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ([elementName isEqualToString:findElement]){
        if(element != nil){
            
           // NSLog(@"element = %@", element);
            
            NSError *localError;
            NSData *data = [element dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
            
            
            if ([elementName isEqualToString:@"jsonGetLoginUsuarioResult"])
            {
                acuser =[MTLJSONAdapter modelOfClass: [ACUser class] fromJSONDictionary:json error:&localError];
                if(!localError && acuser != nil)
                    [self.delegate loginOK:acuser];
                else
                    [self.delegate loginError:localError.description];
            } else if ([elementName isEqualToString:@"jsonFindEmpleadosResult"])
            {
                
                //empArr =[MTLJSONAdapter modelOfClass: [ACEmployee class] fromJSONDictionary:json error:&localError];
                
                NSDictionary *parsedObject = (id)json;
                
                if (parsedObject == nil) {
                    NSLog(@"Error parseando JSON");
                    //return;
                }
                
                 NSArray *empArr = [parsedObject objectForKey:@"empleados"];
                if(empArr==nil) {
                    NSLog(@"Error parseando JSON. No hay tag 'empleados'");
                    //return;
                }else{
                    NSMutableArray* results = [[NSMutableArray alloc] init];
                    for(NSDictionary* jsonDict in empArr)
                    {
                       ACEmployee *emp =[MTLJSONAdapter modelOfClass: [ACEmployee class] fromJSONDictionary:jsonDict error:&localError];
                        [results addObject:emp];
                    }
                    
                    if(!localError && empArr != nil)
                        [self.delegate searchEmployeeOK:results.copy];
                    else
                        [self.delegate searchEmployeeError:localError.description];
                    
                }
               
            }
        }else
        {
            
            [self.delegate loginError:@"El WebService ha devuelto null"];
            
        }
        
    }
   // NSLog(@"didEndElement   --> %@", elementName);
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    
    //NSLog(@"parserDidEndDocument");
}


@end
