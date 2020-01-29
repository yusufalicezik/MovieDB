//
//  NSObject+Movie.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Movie: NSObject {
    
}

@property (strong, nonatomic) NSString *movieTitle;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, readwrite) NSString *photoUrl;
@property (nonatomic, assign) int movieId;
@property (nonatomic, assign) double vote_average;

//Detail
@property (strong, readwrite) NSString *status;
@property (nonatomic, assign) int runtime;
@property (strong, readwrite) NSString *countryName;
@property (nonatomic, assign) int vote_count;
@property (nonatomic, strong) NSMutableArray *categoryArray;

@end

