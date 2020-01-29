//
//  GenreCell.m
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import "GenreCell.h"

@implementation GenreCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.containerView.layer.cornerRadius = 5;
    self.containerView.clipsToBounds = YES;
}

@end
