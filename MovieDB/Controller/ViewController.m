//
//  ViewController.m
//  MovieDB
//
//  Created by Yusuf ali cezik on 28.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import "ViewController.h"
#import "MovieCell.h"
#import "DataService.h"
#import "Movie.h"
#import "DetailVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setupView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self fetchData:0]; //first discover
}

-(void)setupView{
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.tintColor = [UIColor blackColor];
    searchBar.backgroundColor = [UIColor blackColor];
    searchBar.placeholder = @"Search any movies";
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
    self.navigationItem.titleView = searchBar;
    [[UISegmentedControl appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = false;
    [self setupView];
}


- (IBAction)segmentChanged:(id)sender {
    [self fetchData:self.typeSegment.selectedSegmentIndex];
}

- (void)fetchData:(NSInteger)type{
    NSString *apiUrl;
    if(type == 0){
        apiUrl = @"https://api.themoviedb.org/3/discover/movie?api_key=ae32fbb3535e8e640aff557640da5021&language=en-US";
    }else{
        apiUrl = @"https://api.themoviedb.org/3/movie/top_rated?api_key=ae32fbb3535e8e640aff557640da5021";
    }
  DataService *service = [[DataService alloc] init];
    [service getDataFromService:apiUrl handler:^(NSMutableArray * _Nonnull result) {
        self->dataList = result;
        [self.tableView reloadData];
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.movieNameLabel.text = [dataList[indexPath.row] movieTitle];
    cell.movieDescLabel.text = [dataList[indexPath.row] overview];
    cell.rateProgres.value = [dataList[indexPath.row] vote_average] * 10;
    cell.rateProgres.unitString = @"%";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:[dataList[indexPath.row] releaseDate]];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormat setDateFormat:@"EEEE, MMMM yyyy"];
    NSString *finalDate = [dateFormat stringFromDate:date];
    cell.movieDateLabel.text = finalDate;
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString * allUrl = [NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/w500", [self->dataList[indexPath.row] photoUrl]];
        NSLog(@"YCC-> %@", allUrl);
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: allUrl]];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.movieImageView.image = [UIImage imageWithData:imageData];
        });
    });
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self->dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:false];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailVC *detailVC = (DetailVC *)[storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    detailVC.movieId = [dataList[indexPath.row] movieId];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
