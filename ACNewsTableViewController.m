//
//  ACNewsTableViewController.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACNewsTableViewController.h"
#import "ACNewsModel.h"
#import "ACNews.h"
#import "ACNewsListTableViewCell.h"
#import "ACDetailNewViewController.h"


@interface ACNewsTableViewController ()

@property (nonatomic,strong) ACNewsModel* modelNews;
@property(nonatomic,strong) NSMutableArray *newsArr;



@end

@implementation ACNewsTableViewController

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
    
    _modelNews =[[ACNewsModel alloc]init];
    _newsArr = [NSMutableArray array];
    
    [self loadNews];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
  
}

- (void)loadNews{
    
    [self.modelNews getNewsWithSuccessBlock:^(id data) {
        self.newsArr = data;
        [self.tableView reloadData];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error peticion");
        
    }];
    

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
    return self.newsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ACNewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newCell" forIndexPath:indexPath];
    
    ACNews *acnew = [self.newsArr objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.titleNew.text = acnew.title;
 
    cell.imgNew.image = [ACIntranetEngine getImageFromURL:acnew.image];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"detailNew"]){
        ACDetailNewViewController *detailNew = (ACDetailNewViewController *) segue.destinationViewController;
        
        detailNew.detailNew = [self.newsArr objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        
    }
}


@end
