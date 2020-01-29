//
//  GenreCell.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GenreCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *genreNameLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;


@end

NS_ASSUME_NONNULL_END
