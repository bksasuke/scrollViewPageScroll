//
//  ContentSizeBasic.m
//  UIScrollView+ToolBar
//
//  Created by TuanTa on 10/29/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "ContentSizeBasic.h"

@interface ContentSizeBasic ()
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ContentSizeBasic
{
    UIImageView *photo;
    CGFloat cameraItem;
    UIBarButtonItem *rightButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage *image = [UIImage imageNamed:@"people.jpg"];
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(8, 8, self.view.bounds.size.width-16, 300)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(image.size.width, image.size.height);
    
    //Thí nghiệm : chuyển bounce từ true sang false.
    self.scrollView.bounces = true;
    //Thí nghiệm :
    self.scrollView.showsHorizontalScrollIndicator =true;
    self.scrollView.showsVerticalScrollIndicator = true;
    
    photo =[[UIImageView alloc]initWithImage:image];
    [self.scrollView addSubview:photo];
    [self.view addSubview:self.scrollView];
    
}

@end
