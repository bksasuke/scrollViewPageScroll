//
//  ScaleWithSlider.m
//  UIScrollView
//
//  Created by TuanTa on 10/28/15.
//  Copyright © 2015 Cuong Trinh. All rights reserved.
//

#import "ScaleWithSlider.h"

@interface ScaleWithSlider () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ScaleWithSlider
{
    UIImageView *photo;
    CGFloat cameraItem;
    UIBarButtonItem *rightButton,*barButton;
    UIToolbar *toolbar;
    UISlider *slider;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    printf("Size of app:%3.0f-%3.0f\n",self.view.bounds.size.width,self.view.bounds.size.height);
    toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    slider = [[UISlider alloc]initWithFrame:CGRectMake(8, 0, self.view.bounds.size.width-18, 40) ];
    
    slider.minimumValue =0.2;
    slider.maximumValue =5.0;
    slider.value =1;
    [slider addTarget:self
               action:@selector(onSliderChange:)
     forControlEvents:UIControlEventValueChanged];
    
    barButton = [[UIBarButtonItem alloc]initWithCustomView:slider];
    toolbar.items = @[barButton];
    toolbar.frame = CGRectMake(0,toolbar.bounds.size.height+20, toolbar.bounds.size.width, toolbar.bounds.size.height); //self.view.bounds.size.height- toolbar.bounds.size.height
    [self.view addSubview:toolbar];
   
    CGRect scrollRect = CGRectMake(0,toolbar.bounds.size.height*2+20, self.view.bounds.size.width, self.view.bounds.size.height -toolbar.bounds.size.height);
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:scrollRect];
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"people.jpg"]];
    
    [self.scrollView addSubview:photo];
    self.scrollView.delegate =self;
    self.scrollView.minimumZoomScale = slider.minimumValue;
    self.scrollView.maximumZoomScale = slider.maximumValue;
    self.scrollView.zoomScale =slider.value;
   [self.view addSubview:self.scrollView];
    printf("Vi tri toolbar:%3.0f-%3.0f\n",toolbar.frame.origin.x,toolbar.frame.origin.y);
    printf("Vi tri scroolview:%3.0f-%3.0f\n",self.scrollView.frame.origin.x, self.scrollView.frame.origin.y);
    printf("Kich thuoc scroolview:%3.0f-%3.0f\n",self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Test"
                                                   style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:nil];
    
    CGRect blockRect = [slider.superview convertRect: slider.frame
                                             toView: self.view];
    printf("Vi tri slider trong he toa do chinh:%3.0f-%3.0f\n",blockRect.origin.x,blockRect.origin.y);
    
}
-(void) onSliderChange: (UISlider *)sender {
   [self.scrollView setZoomScale:sender.value
                        animated:true];
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
   
    return photo;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    slider.value = self.scrollView.zoomScale;
    
    NSString *myString = [NSString stringWithFormat:@"%1.2f",_scrollView.zoomScale];
    rightButton.title = myString;
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

@end
