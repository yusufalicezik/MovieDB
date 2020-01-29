//
//  NSObject+DataService.m
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import "DataService.h"
#import "Movie.h"

@implementation DataService

- (void)getDataFromService: (NSString *)apiUrl handler:(void(^) (NSMutableArray *result))callback {
    //NSString *urlString = @"https://api.themoviedb.org/3/movie/top_rated?api_key=ae32fbb3535e8e640aff557640da5021";
    NSURL *url = [NSURL URLWithString:apiUrl];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray <Movie *> *movies = NSMutableArray.new;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSArray *movieResults = [json objectForKey:@"results"];
            for(NSDictionary *movieDict in movieResults){
                Movie *movie = Movie.new;
                movie.overview = movieDict[@"overview"];
                movie.movieTitle = movieDict[@"title"];
                movie.photoUrl = movieDict[@"poster_path"];
                movie.releaseDate = movieDict[@"release_date"];
                [movies addObject:movie];
            }
            callback(movies);
            //NSLog(@"data: %@", dataString);
        });

    }] resume ];
}

@end
