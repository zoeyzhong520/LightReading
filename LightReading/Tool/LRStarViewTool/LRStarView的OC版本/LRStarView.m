//
//  LRStarView.m
//  LightReading
//
//  Created by zhifu360 on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

#import "StarView.h"

#define LRStarViewRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define LRStarViewRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@implementation StarView

///LRStarView的OC版本
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.starSize = 13.0f;
        self.emptyColor = LRStarViewRGB(167, 167, 167);
        self.fullColor = LRStarViewRGB(255, 121, 22);
        self.maxStar = 100;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString *stars = @"★★★★★";
    
    rect = self.bounds;
    UIFont *font = [UIFont boldSystemFontOfSize:self.starSize];
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize starSize = [stars sizeWithAttributes:attributes];
    rect.size = starSize;
    [self.emptyColor set];
    [stars drawInRect:rect withAttributes:attributes];
    
    CGRect clip = rect;
    clip.size.width = clip.size.width * self.showStar / self.maxStar;
    CGContextClipToRect(context, clip);
    [self.fullColor set];
    [stars drawInRect:rect withAttributes:attributes];
}

@end












