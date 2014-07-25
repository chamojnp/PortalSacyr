//
//  ACRoomsTableViewCell.h
//  PortalSacyr
//
//  Created by ANTONIO CHAMORRO MORAL on 18/07/14.
//  Copyright (c) 2014 sacyr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACRoomsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgRoom;

@property (weak, nonatomic) IBOutlet UILabel *nextMeetingRoom;

@property (weak, nonatomic) IBOutlet UILabel *selectRoom;

@end
