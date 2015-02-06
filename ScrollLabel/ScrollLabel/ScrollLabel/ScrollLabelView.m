//
//  ScrollLabelView.m
//  ScrollLabel
//
//  Created by zbq on 15-1-21.
//  Copyright (c) 2015年 zbq. All rights reserved.
//

#import "ScrollLabelView.h"

#define ScrollSpeed 0.5
#define TextFontSize 13

@interface ScrollLabelView (){
    UILabel *lblContent;
    UIScrollView *scrollView;
    BOOL bCanAnimation;
}

@end

@implementation ScrollLabelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        [self initSubView];
    }
    return self;
}

- (void)initSubView{
    if (!scrollView) {
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.scrollEnabled = NO;
        scrollView.backgroundColor = [UIColor redColor];
        [self addSubview:scrollView];
    }
    
    if (!lblContent) {
        lblContent = [[UILabel alloc] initWithFrame:self.bounds];
        [scrollView addSubview:lblContent];
        lblContent.text = _content;
        lblContent.font = [UIFont systemFontOfSize:TextFontSize];
        lblContent.textColor = [UIColor blackColor];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    scrollView.frame = self.bounds;
    lblContent.frame = self.bounds;
}

- (void)setContent:(NSString *)content{
    _content = content;
    lblContent.text = content;
    
    NSDictionary *dic = @{NSFontAttributeName:lblContent.font};
    CGSize size = [_content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lblContent.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    CGRect rect = lblContent.frame;
    rect.size.width = size.width;
    lblContent.frame = rect;
    
//    NSInteger iLabelNumber = floor(size.width / scrollView.frame.size.width);//向下取整
//    iLabelNumber ++;
    scrollView.contentSize = CGSizeMake(size.width/*iLabelNumber*scrollView.frame.size.width*/, scrollView.frame.size.height);
    if (size.width <= scrollView.frame.size.width) {
        bCanAnimation = NO;
    }else{
        bCanAnimation = YES;
    }
}

- (void)startAnimation{
    if (bCanAnimation) {
        if (scrollView.contentOffset.x >= scrollView.contentSize.width) {
            scrollView.contentOffset = CGPointMake(-scrollView.frame.size.width, scrollView.contentOffset.y);//.x = - scrollView.contentOffset.x;
        }
        
        [UIView animateWithDuration:0.01 animations:^{
            [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x+ScrollSpeed, scrollView.contentOffset.y)];
        } completion:^(BOOL finished) {
            [self startAnimation];
        }];
    }
}

- (void)stopAnimation{
    
}



@end
