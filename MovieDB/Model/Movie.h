//
//  NSObject+Movie.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Movie: NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *posterPath;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *date;

@end

