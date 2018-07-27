//
//  StarView.m
//  LightReading
//
//  Created by zhifu360 on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "StarView.h"

@implementation StarView

@synthesize starSize = _starSize;
@synthesize maxStar = _maxStar;
@synthesize showStar = _showStar;
@synthesize emptyColor = _emptyColor;
@synthesize fullColor = _fullColor;

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.starSize = 13.0f;
        self.emptyColor = [UIColor colorWithRed:167.0f/255.0f green:167.0f/255.0f blue:167.0f/255.0f alpha:1.0f];//灰色
        self.fullColor = [UIColor colorWithRed:255.0f/255.0f green:121.0f/255.0f blue:22.0f/255.0f alpha:1.0f];//亮黄色
        self.maxStar = 100;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString *stars = @"★★★★★";
    
    rect = self.bounds;
    UIFont *font = [UIFont boldSystemFontOfSize:_starSize];
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize starSize = [stars sizeWithAttributes:attributes];
    rect.size = starSize;
    [_emptyColor set];
    [stars drawInRect:rect withAttributes:attributes];
    
    CGRect clip = rect;
    clip.size.width = clip.size.width * _showStar / _maxStar;
    CGContextClipToRect(context, clip);
    [_fullColor set];
    [stars drawInRect:rect withAttributes:attributes];
    self.backgroundColor = [UIColor redColor];
}

@end












