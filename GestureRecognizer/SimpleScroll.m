//
//  SimpleScroll.m
//  UIScrollView-taptozoom
//
//  Created by TuanTa on 10/29/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "SimpleScroll.h"
#define PHOTO_WIDTH 320
#define PHOTO_HEIGHT 480
#define NUM_PHOTO 6

@interface SimpleScroll () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong,nonatomic) UIBarButtonItem *rightButton;
@end

@implementation SimpleScroll

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((size.width - PHOTO_WIDTH) * 0.5,  0,
                                                                     PHOTO_WIDTH, PHOTO_HEIGHT)];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(PHOTO_WIDTH * (NUM_PHOTO), PHOTO_HEIGHT);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.bounces = true;
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 160, 0, 160);

    
    for (int i = 1; i < NUM_PHOTO +1; i++) {
        NSString * fileName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:fileName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake((i - 1) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT);
        [self.scrollView addSubview:imageView];
    }
    
    [self.view addSubview:self.scrollView];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, size.height - 64- 40, size.width, 40)];
    self.pageControl.backgroundColor = [UIColor lightGrayColor];
    self.pageControl.numberOfPages = NUM_PHOTO ;
    [self.pageControl addTarget:self
                         action:@selector(onPageChange:)
               forControlEvents:UIControlEventValueChanged];
    self.pageControl.currentPage = self.scrollView.contentOffset.x/ PHOTO_WIDTH;
   [self.view addSubview:self.pageControl];

  printf("on viewdidloag page: %3.0ld\n",(long)self.pageControl.currentPage);
    _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Test"
                                                   style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:nil];
    
}
//-(void)viewDidAppear:(BOOL)animated {
//    self.scrollView.delegate = nil;
//}
-(void)onPageChange:(id)sender {
    
        
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage*PHOTO_WIDTH, 0);
    
   printf("on p.change page: %3.0ld\n",(long)self.pageControl.currentPage);
    
   
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
 // printf("2-on p.change contentOffset: %3.0f\n",_scrollView.contentOffset.x);
    self.pageControl.currentPage = self.scrollView.contentOffset.x/ PHOTO_WIDTH;
    if (self.scrollView.contentOffset.x>1600+140) {
   
        self.scrollView.contentOffset = CGPointMake(0,  0);
    }
    if (self.scrollView.contentOffset.x<-140) {
        self.scrollView.contentOffset = CGPointMake(5*PHOTO_WIDTH ,  0);
    }
    NSString *myString = [NSString stringWithFormat:@"%1.0ld",(long)self.pageControl.currentPage+1];
    _rightButton.title = myString;
    self.navigationItem.rightBarButtonItem = _rightButton;
   
}
@end