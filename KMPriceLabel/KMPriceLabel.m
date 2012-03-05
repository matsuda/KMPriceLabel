//
//  KMPriceLabel.m
//  KMPriceLabel
//
//  Created by matsuda on 12/03/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KMPriceLabel.h"

static NSString * defaultYenMark = @"¥";

@implementation NSString (KMPriceLabel)

+ (NSString *)stringWithFormattedPrice:(NSInteger)price;
{
    NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    // [formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    // [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    // [formatter setLocale:[NSLocale currentLocale]];
    NSNumber *num = [NSNumber numberWithInt:price];
    return [formatter stringFromNumber:num];
}

@end

@implementation KMPriceLabel

@synthesize yenMark = _yenMark;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.yenMark = defaultYenMark;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.yenMark = defaultYenMark;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [_yenMark release], _yenMark = nil;
    [super dealloc];
}

- (void)drawTextInRect:(CGRect)rect
{
    NSString *defaultText = [[self.text copy] autorelease];
    CGRect priceRect = rect;
    self.text = [self formattedPriceText];
    CGSize size = [self.text sizeWithFont:self.font forWidth:rect.size.width lineBreakMode:self.lineBreakMode];
    priceRect.size.width = size.width;
    [super drawTextInRect:priceRect];
    self.text = defaultText;
}

- (NSString *)formattedPriceText
{
    @try {
        NSInteger price = [self.text intValue];
        NSString *priceText = @"";
        priceText = [priceText stringByAppendingString:self.yenMark];
        priceText = [priceText stringByAppendingString:[NSString stringWithFormattedPrice:price]];
        return priceText;
    }
    @catch (NSException *exception) {
        return self.text;
    }
    @finally {
    }
}

@end
