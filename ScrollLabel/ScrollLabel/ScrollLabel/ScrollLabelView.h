//
//  ScrollLabelView.h
//  ScrollLabel
//
//  Created by zbq on 15-1-21.
//  Copyright (c) 2015年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollLabelView : UIView

@property(nonatomic, strong) NSString *content;

- (void)startAnimation;

- (void)stopAnimation;

@end
