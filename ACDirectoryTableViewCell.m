//
//  ACDirectoryTableViewCell.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACDirectoryTableViewCell.h"

@implementation ACDirectoryTableViewCell

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
    
    self.imgDir.layer.borderWidth = 0;
    
    self.imgDir.clipsToBounds=YES;
    self.imgDir.layer.cornerRadius = 16;
    
    
    self.imgDir.image = [UIImage imageNamed:@"directorio.png"];
    self.selectDir.text = @"Directory";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
