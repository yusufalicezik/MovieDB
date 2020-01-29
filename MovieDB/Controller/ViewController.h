//
//  ViewController.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 28.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *dataList;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegment;

- (IBAction)segmentChanged:(id)sender;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)fetchData: (NSInteger) type; //0 discover, 1 top rated
@end

