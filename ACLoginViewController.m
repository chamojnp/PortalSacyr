//
//  ACLoginViewController.m
//  PortalSacyr
//
//  Created by Antonio Chamorro on 17/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACLoginViewController.h"
#import "ACNewsTableViewController.h"
#import "ACIntranetEngine.h"
#import "ACUser.h"

@interface ACLoginViewController () <ACIntranetEngineDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textUserName;

@property (weak, nonatomic) IBOutlet UITextField *textPass;

//property (strong, nonatomic) ACUser *user;

@end

@implementation ACLoginViewController

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
    
    //self.view.backgroundColor = [UIColor colorWithRed:(100.0/255.0) green:(50.0/255.0) blue:(50.0/255.0) alpha:1];
    
    //obtengo el username si existe
    //load data
    self.textUserName.text = [FXKeychain defaultKeychain][kKCUserName];
    
    self.textUserName.placeholder = @"User name";
    self.textPass.placeholder = @"Password";
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapView:(id)sender {
    //gestionamos el teclado
    [_textUserName resignFirstResponder];
    [_textPass resignFirstResponder];
    
}


- (IBAction)loginButton:(id)sender {
   
    ACIntranetEngine *intra = [[ACIntranetEngine alloc]init];
    intra.delegate = self;
    //lanzo el login
    [intra getUserFromLogin:self.textUserName.text andPass:self.textPass.text];
   
    
}

-(void)loginOK:(ACUser *)acuser{

    [FXKeychain defaultKeychain][kKCUserName] = acuser.userName;
    [FXKeychain defaultKeychain][kKCEMail] = acuser.email;
    
    [self performSegueWithIdentifier:@"loginSegue" sender:self];
}

-(void)loginError:(NSString *)error{

    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error de acceso"
                                                      message:@"Por favor introduzca correctamente su usuario y contraseña"
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
    if([segue.identifier isEqualToString:@"loginSegue"]) {
     
        UINavigationController *vcTO = segue.destinationViewController;
        ACNewsTableViewController *rootVc = [vcTO.viewControllers firstObject];
    
        
    }
    
}


@end
