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
                movie.movieId = [movieDict[@"id"] intValue];
                movie.overview = movieDict[@"overview"];
                movie.vote_average = [movieDict[@"vote_average"] doubleValue];
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

-(void)getMovieDetail: (NSInteger *)movieId handler:(void(^) (Movie *movie))callback {
    // NSString *urlString = @"https://api.themoviedb.org/3/movie/19404"; //?api_key=ae32fbb3535e8e640aff557640da5021
    NSString *allUrl = [NSString stringWithFormat:@"%@%d%@", @"https://api.themoviedb.org/3/movie/", movieId, @"?api_key=ae32fbb3535e8e640aff557640da5021"];
    NSURL *url = [NSURL URLWithString:allUrl];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            Movie *movie = [[Movie alloc]init];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            movie.vote_count = [json[@"vote_count"] intValue];
            movie.vote_average = [json[@"vote_average"] doubleValue];
            movie.movieTitle = json[@"title"];
            movie.runtime = [json[@"runtime"] intValue];
            movie.overview = json[@"overview"];
            movie.status = json[@"status"];
            movie.releaseDate = json[@"release_date"];
            NSArray *production_countries = [json objectForKey:@"production_countries"];
            for(NSDictionary *countiesDict in production_countries){
                movie.countryName = countiesDict[@"name"];
            }
            
            NSArray *genres = [json objectForKey:@"genres"];
            NSMutableArray *array = NSMutableArray.new;
            for(NSDictionary *genresDict in genres){
                [array addObject:genresDict[@"name"]];
            }
            movie.categoryArray = array;            
            callback(movie);
        });

    }] resume ];
}


@end
