//
//  DetailVC.m
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import "DetailVC.h"
#import "DataService.h"
#import "GenreCell.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.addWishButon.layer.cornerRadius = 5;
    self.addWishButon.layer.borderWidth = 1;
    self.addWishButon.layer.borderColor = [UIColor redColor].CGColor;
    [self.addWishButon setTitleEdgeInsets:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
    [self.addWishButon setContentEdgeInsets:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
    self.MarkAsSeenButton.layer.cornerRadius = 5;
    self.MarkAsSeenButton.layer.borderWidth = 1;
    self.MarkAsSeenButton.layer.borderColor = [UIColor greenColor].CGColor;
    [self.MarkAsSeenButton setTitleEdgeInsets:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
    [self.MarkAsSeenButton setContentEdgeInsets:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
    self.genresColelctionView.delegate = self;
    self.genresColelctionView.dataSource = self;
    // Do any additional setup after loading the view.
    [self fetchDetail];
}

-(void) fetchDetail{
    DataService *service = [[DataService alloc] init];
    [service getMovieDetail:[self movieId] handler:^(Movie * _Nonnull movie) {
        self.movieCountryLabel.text = movie.countryName;
        self.movieNameLabel.text = movie.movieTitle;
        NSString *movieTime = [NSString stringWithFormat:@"%d%@", movie.runtime, @" minutes"];
        self.movieMinuteLabel.text = movieTime;
        self.movieStatusLabel.text = movie.status;
        self.movieOverviewFullLabel.text = movie.overview;
        self.movieRatingLabel.value = movie.vote_average * 10;
        self.movieRatingCountLabel.text = [NSString stringWithFormat:@"%d%@", movie.vote_count, @" Ratings"];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [dateFormat dateFromString:movie.releaseDate];
        [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormat setDateFormat:@"MMMM yyyy"];
        NSString *finalDate = [dateFormat stringFromDate:date];
        self.movieYearLabel.text = finalDate;
        self.genreList = movie.categoryArray;
        NSLog(@"dd %@", movie.categoryArray );
        self.genresColelctionView.reloadData;
    }];
}


- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GenreCell *cell = [[self genresColelctionView] dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.genreNameLabel.text = self.genreList[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self genreList ]count];
}


@end
