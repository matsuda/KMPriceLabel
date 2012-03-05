//
//  KMPriceLabel.h
//  KMPriceLabel
//
//  Created by matsuda on 12/03/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMPriceLabel : UILabel

@property (nonatomic, copy) NSString *yenMark;

- (NSString *)formattedPriceText;

@end
