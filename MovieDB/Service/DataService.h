//
//  NSObject+DataService.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataService : NSObject{
}
-(void)getDataFromService: (NSString *)url handler:(void(^) (NSMutableArray *result))callback;
-(void)getMovieDetail: (NSInteger *)movieId handler:(void(^) (Movie *movie))callback;

@end

NS_ASSUME_NONNULL_END
