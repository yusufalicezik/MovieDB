//
//  NSObject+DataService.h
//  MovieDB
//
//  Created by Yusuf ali cezik on 29.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataService : NSObject{
    @public int sayi;
}
-(void)getDataFromService:(void(^) (NSMutableArray *result))callback;

@end

NS_ASSUME_NONNULL_END
