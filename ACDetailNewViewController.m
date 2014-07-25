//
//  ACDetailNewViewController.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 21/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDetailNewViewController.h"
#import "ACIntranetEngine.h"

@interface ACDetailNewViewController ()

@end

@implementation ACDetailNewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self populateData];
}

-(void) populateData{
    if (self.detailNew!=nil){
        
        self.imgNew.image = [ACIntranetEngine getImageFromURL:self.detailNew.image];
        self.titleNew.text = self.detailNew.title;
        self.bodyNew.text = self.detailNew.descripcion;
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
