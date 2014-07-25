//
//  ACDetailEmployeeViewController.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACEmployee.h"

@interface ACDetailEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *empImage;

@property (weak, nonatomic) IBOutlet UILabel *empName;

@property (weak, nonatomic) IBOutlet UILabel *empLastname;

@property (weak, nonatomic) IBOutlet UILabel *empEmail;

@property (weak, nonatomic) IBOutlet UILabel *empTelephone;

@property (weak, nonatomic) IBOutlet UILabel *empMobile;

@property (weak, nonatomic) IBOutlet UILabel *empMobileLocal;

@property (weak, nonatomic) IBOutlet UILabel *empEmpresaName;

@property (weak, nonatomic) IBOutlet UILabel *empDpt;

@property (weak, nonatomic) IBOutlet UILabel *empCTrabajo;


@property(strong,nonatomic) ACEmployee *emp;

@end
