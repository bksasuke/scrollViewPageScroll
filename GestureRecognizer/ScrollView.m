//
//  ScrollView.m
//  UIScrollView
//
//  Created by TuanTa on 10/28/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "ScrollView.h"

@interface ScrollView () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ScrollView
{
    UIImageView *photo;
    CGFloat cameraItem;
    UIBarButtonItem *rightButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"people.jpg"]];
    [self.scrollView addSubview:photo];
    self.scrollView.delegate =self;
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 4.0;
    [self.view addSubview:self.scrollView];
      rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Test"
                                                  style:UIBarButtonItemStylePlain
                                                 target:self
                                                 action:nil];
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"%3.2f",self.scrollView.zoomScale);
    
    
    NSString *myString = [NSString stringWithFormat:@"%1.2f",_scrollView.zoomScale];
    rightButton.title = myString;
    self.navigationItem.rightBarButtonItem = rightButton;

}

@end
