//
//  ContentSizeDemo.m
//  UIScrollView-simpleScroll
//
//  Created by TuanTa on 10/30/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "ContentSizeDemo.h"

@interface ContentSizeDemo () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation ContentSizeDemo
{
    UIImageView* photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* image = [UIImage imageNamed:@"1.jpg"];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - image.size.width) * 0.5,
                                                                     (self.view.bounds.size.height - 64 - image.size.height) * 0.5,
                                                                     image.size.width,
                                                                     image.size.height)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 4.0;
    self.scrollView.contentSize = CGSizeMake(image.size.width, image.size.height);
    //Thí nghiệm: bổ xung thêm contentOffset
    //self.scrollView.contentOffset = CGPointMake(40, 40);
    
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    
    //Thí nghiệm: bật tắt clipsToBounds rồi phóng to thu nhỏ ảnh con mèo. clipsToBounds = true --> Ảnh mèo to quá sẽ bị cắt
    self.scrollView.clipsToBounds = true;
    
    //Thí nghiệm: chuyển bounces từ true sang false.
    self.scrollView.bounces = true;
    
    //Thí nghiệm:
    self.scrollView.showsHorizontalScrollIndicator = true;
    self.scrollView.showsVerticalScrollIndicator = true;
    
    
    photo = [[UIImageView alloc] initWithImage: image];
    photo.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self.scrollView addSubview:photo];
    
    
    [self.view addSubview:self.scrollView];
}

@end
