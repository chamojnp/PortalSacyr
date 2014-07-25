//
//  ACRoomsTableViewCell.m
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import "ACRoomsTableViewCell.h"

@implementation ACRoomsTableViewCell

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
    self.imgRoom.layer.borderWidth = 1;
    self.imgRoom.layer.borderColor = [UIColor blueColor].CGColor;
    
    self.imgRoom.clipsToBounds=YES;
    self.imgRoom.layer.cornerRadius = self.imgRoom.frame.size.width / 2;
    self.backgroundColor =[UIColor redColor];
    
    self.imgRoom.image = [UIImage imageNamed:@"rooms.png"];
    self.selectRoom.text = @"Rooms";

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
