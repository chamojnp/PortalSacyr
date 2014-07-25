//
//  ACDirectoryViewController.m
//  PortalSacyr
//
//  Created by Antonio Chamorro on 17/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDirectoryViewController.h"
#import "ACDirectoryResultsTableViewController.h"
#import "ACIntranetEngine.h"
#import "ACEmployee.h"


@interface ACDirectoryViewController ()<ACIntranetEngineDelegate>

@property(nonatomic,strong) NSMutableArray *empleadosArr;

@end

@implementation ACDirectoryViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonSearch:(id)sender {
    
    ACIntranetEngine *intra = [[ACIntranetEngine alloc]init];
    intra.delegate = self;
    //lanzo la consulta
    [intra searchEmployees:self.textName.text andLastName:self.textLastName.text andEmail:self.textEmail.text andCodEmpresa:@"" andCodDpt:@"" andCodCTrabajo:@""];
    
    
}



- (IBAction)tapScreen:(id)sender {
    [_textName resignFirstResponder];
    [_textEmail resignFirstResponder];
    [_textLastName resignFirstResponder];
}

-(void)searchEmployeeOK:(NSArray *)empArr{
    _empleadosArr = empArr.copy;
    if(_empleadosArr!=nil && _empleadosArr.count > 0)
    {
        
        [self performSegueWithIdentifier:@"resultSegue" sender:self];
        
    }else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"No se han encontrado empleados"
                                                          message:@"Por favor realice de nuevo la consulta con otros filtros, gracias."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];

        
    }
    
}

-(void)searchEmployeeError:(NSString *)error{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error en la consulta"
                                                      message:@"Por favor realice de nuevo la consulta"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"resultSegue"]) {
        
        ACDirectoryResultsTableViewController *resVc = segue.destinationViewController;
       // ACDirectoryResultsTableViewController *resVc = [vcTO.viewControllers firstObject];
        resVc.empleadosArr = _empleadosArr.copy;
        
        
    }
    
}


@end
