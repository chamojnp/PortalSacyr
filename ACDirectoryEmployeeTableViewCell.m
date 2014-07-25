//
//  ACDirectoryEmployeeTableViewCell.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 23/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDirectoryEmployeeTableViewCell.h"

@implementation ACDirectoryEmployeeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.imgEmp.layer.borderWidth = 1;
    self.imgEmp.layer.borderColor = [UIColor orangeColor].CGColor;
    
    self.imgEmp.clipsToBounds=YES;
    self.imgEmp.layer.cornerRadius = self.imgEmp.frame.size.width / 2;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
