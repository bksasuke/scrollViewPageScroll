//
//  TapToZoom.m
//  UIScrollView+ToolBar
//
//  Created by TuanTa on 10/29/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//
#import "TapToZoom.h"
#define ZOOM_STEP 1.5
@interface TapToZoom () <UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,weak) UIImageView *photo;
@property(nonatomic,weak) UILabel *scaleLabel;
@end

@implementation TapToZoom
{
    
    CGFloat cameraItem;
    UIBarButtonItem *rightButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.minimumZoomScale =0.1;
    scrollView.maximumZoomScale =10;
    scrollView.zoomScale = 1.0;
    scrollView.clipsToBounds = YES;
    UIImageView *photo = [[UIImageView alloc]initWithFrame:scrollView.bounds];
    photo.image = [UIImage imageNamed:@"playboy.jpg"];
    photo.contentMode = UIViewContentModeScaleAspectFill;
    
    photo.userInteractionEnabled = YES;
    photo.multipleTouchEnabled = YES;
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(onTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [photo addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate = self;
    [photo addGestureRecognizer:doubleTap];
    
    [scrollView addSubview:photo];
    [self.view addSubview:scrollView];
    [singleTap requireGestureRecognizerToFail:doubleTap];
    //Sau khi scroll view, photo đc gắn vào superView, có con trỏ strong thì chúng ta mới gán vào weak property
    
    self.scrollView = scrollView;
    self.photo =photo;
    rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Test"
                                                   style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:nil];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.photo;
}

-(void)onTap: (UITapGestureRecognizer*) tap {
    
    CGPoint tapPoint = [tap locationInView:self.photo];
    float newScale = self.scrollView.zoomScale *ZOOM_STEP;
        [self zoomRectForScale : newScale
                     withCenter:tapPoint];
   
    }
-(void)onDoubleTap:(UITapGestureRecognizer*) tap {
    
    CGPoint tapPoint = [tap locationInView:self.photo];
    float newScale = self.scrollView.zoomScale /ZOOM_STEP;
    [self zoomRectForScale : newScale
                 withCenter:tapPoint];
    
}
-(void)zoomRectForScale: (float)scale
             withCenter:(CGPoint)center {
    CGRect zoomRect;
    CGSize scrollViewSize = self.scrollView.bounds.size;
    zoomRect.size.width  = scrollViewSize.width /scale;
    zoomRect.size.height = scrollViewSize.height /scale;
// Chọn một điểm bắt đầu rồi từ đó tính ra điểm mới bên phải
    zoomRect.origin.x =center.x -(zoomRect.size.width/2.0);
    zoomRect.origin.y =center.y -(zoomRect.size.height/2.0);
    [self.scrollView zoomToRect:zoomRect animated:YES];

    NSString *myString = [NSString stringWithFormat:@"%1.2f",_scrollView.zoomScale];
    rightButton.title = myString;
    self.navigationItem.rightBarButtonItem = rightButton;

}




@end
