//
//  ACDetailNewViewController.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 21/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACNews.h"

@interface ACDetailNewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgNew;

@property (weak, nonatomic) IBOutlet UILabel *titleNew;

@property (weak, nonatomic) IBOutlet UITextView *bodyNew;

@property (strong, nonatomic) ACNews *detailNew;

@end
