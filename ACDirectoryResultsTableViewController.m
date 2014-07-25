//
//  ACDirectoryResultsTableViewController.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDirectoryResultsTableViewController.h"
#import "ACDirectoryEmployeeTableViewCell.h"
#import "ACDetailEmployeeViewController.h"
#import "ACEmployee.h"
#import "ACIntranetEngine.h"

@interface ACDirectoryResultsTableViewController ()

@end

@implementation ACDirectoryResultsTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:220.0/256.0 green:220.0/256.0 blue:220.0/256.0 alpha:1.0];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.empleadosArr.count;
    //return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    ACDirectoryEmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    
    ACEmployee *acEmp = [self.empleadosArr objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    cell.imgEmp.image = [UIImage imageNamed:@"sinfoto.jpg"];
    
    cell.nameEmp.text = acEmp.completeName;
    cell.emailEmp.text = acEmp.email;
    cell.descBusinessEmp.text = acEmp.nameEmpresa;
 
    if(acEmp.urlImage.length>0){
       
        [ACIntranetEngine downLoadImageWithUrlAsync:acEmp.urlImage completion:^(UIImage *image) {
            cell.imgEmp.image = image;
            
        }];
        
    }else{
         cell.imgEmp.image = [UIImage imageNamed:@"sinfoto.jpg"];
        
    }
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"detailEmployee"]){
        ACDetailEmployeeViewController *detailEmp = (ACDetailEmployeeViewController *) segue.destinationViewController;
        
        detailEmp.emp = [self.empleadosArr objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        
    }
}

@end
