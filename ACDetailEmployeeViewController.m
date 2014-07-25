//
//  ACDetailEmployeeViewController.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDetailEmployeeViewController.h"
#import "ACIntranetEngine.h"

@interface ACDetailEmployeeViewController ()

@end

@implementation ACDetailEmployeeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.empCTrabajo.text = self.emp.nameCT;
    self.empDpt.text = self.emp.nameUO;
    self.empEmail.text = self.emp.email;
    self.empEmpresaName.text = self.emp.nameEmpresa;
    
    if(self.emp.urlImage.length>0){
        [ACIntranetEngine downLoadImageWithUrlAsync:self.emp.urlImage completion:^(UIImage *image) {
            if(image!=nil)
                self.empImage.image = image;
        }];
    }
    if(self.empImage.image==nil)
        self.empImage.image = [UIImage imageNamed:@"sinfoto.jpg"];
    
    
    self.empImage.layer.borderWidth = 1;
    self.empImage.layer.borderColor = [UIColor orangeColor].CGColor;
    self.empImage.clipsToBounds=YES;
    self.empImage.layer.cornerRadius = self.empImage.frame.size.width / 2;

    
    self.empLastname.text = self.emp.lastname;
    self.empMobile.text = self.emp.mobile;
    self.empMobileLocal.text = self.emp.mobileLocal;
    self.empName.text = self.emp.name;
    self.empTelephone.text = self.emp.telephone;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
