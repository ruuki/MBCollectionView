//
//  UIView+MBView.m
//  MBCollectionViewExample
//
//  Created by Mert Buran on 15/04/2015.
//  Copyright (c) 2015 Mert Buran. All rights reserved.
//

#import "UIView+MBView.h"

@implementation UIView (MBView)

-(NSArray *)addSubview:(UIView *)childView withInset:(UIEdgeInsets)edgeInsets {
    [childView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:childView];
    NSDictionary *viewsDictionary = @{@"newView": childView};
    
    NSString *verticalVisualFormat = [NSString stringWithFormat:@"%@%@%@%@", @"V:", (edgeInsets.top >= 0.0 ? @"|-topInset-" : @""), @"[newView]", (edgeInsets.bottom >= 0.0 ? @"-bottomInset-|" : @"")];
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat options:0 metrics:@{@"topInset": @(edgeInsets.top), @"bottomInset": @(edgeInsets.bottom)} views:viewsDictionary];
    
    NSString *horizontalVisualFormat = [NSString stringWithFormat:@"%@%@%@%@", @"H:", (edgeInsets.left >= 0.0 ? @"|-leftInset-" : @""), @"[newView]", (edgeInsets.right >= 0.0 ? @"-rightInset-|" : @"")];
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:horizontalVisualFormat options:0 metrics:@{@"leftInset": @(edgeInsets.left), @"rightInset": @(edgeInsets.right)} views:viewsDictionary];
    
    [self addConstraints:constraint_V];
    [self addConstraints:constraint_H];
    
    NSArray *allConstraintsArray = [constraint_V arrayByAddingObjectsFromArray:constraint_H];
    return allConstraintsArray;
}

- (CGFloat)getMinY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)getMaxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    [self setFrame:frame];
}

- (void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    [self setFrame:frame];
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    [self setFrame:frame];
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    [self setFrame:frame];
}

- (void)removeAllSubviewsOfClass:(Class)aClass {
    NSArray *copySubviewsArray = [self.subviews copy];
    for (UIView *subview in copySubviewsArray) {
        if ([subview isKindOfClass:aClass]) {
            [subview removeFromSuperview];
        }
    }
}

@end
