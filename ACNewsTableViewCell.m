//
//  ACNewsTableViewCell.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACNewsTableViewCell.h"

@implementation ACNewsTableViewCell

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
    self.imgNew.layer.borderWidth = 0;
    self.imgNew.layer.borderColor = [UIColor blueColor].CGColor;
    
    self.imgNew.clipsToBounds=YES;
    self.imgNew.layer.cornerRadius = 16;
    
    self.titleNew.text = @"";
    self.imgNew.image = [UIImage imageNamed:@"pedrizaspeq.png"];
    self.selectNew.text = @"News";

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
