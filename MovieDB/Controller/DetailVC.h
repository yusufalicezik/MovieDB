//
//  DetailVC.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBCircularProgressBar/MBCircularProgressBarView.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailVC : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource> {
}
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieMinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCountryLabel;
@property (weak, nonatomic) IBOutlet MBCircularProgressBarView *movieRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieRatingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieOverviewFullLabel;
@property (weak, nonatomic) IBOutlet UIButton *addWishButon;
@property (weak, nonatomic) IBOutlet UIButton *MarkAsSeenButton;
@property (weak, nonatomic) IBOutlet UICollectionView *genresColelctionView;

@property (nonatomic, assign) int movieId;
@property (nonatomic, strong) NSMutableArray *genreList;


- (IBAction)backButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
