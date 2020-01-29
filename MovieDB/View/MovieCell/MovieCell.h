//
//  MovieCell.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBCircularProgressBar/MBCircularProgressBarView.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieDescLabel;
@property (weak, nonatomic) IBOutlet MBCircularProgressBarView *rateProgres;


@end

NS_ASSUME_NONNULL_END
