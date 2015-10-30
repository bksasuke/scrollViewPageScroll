//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"ScrollView by Code", CLASS: @"ScrollView"},
                                    @{TITLE: @"Scale With Slider", CLASS: @"ScaleWithSlider"},
                                    @{TITLE: @"ContentSize Basic", CLASS: @"ContentSizeBasic"},
                                    @{TITLE: @"Tap to Zoom", CLASS: @"TapToZoom"},
                                    @{TITLE: @"Simple Page Scroll", CLASS: @"SimpleScroll"},
//                                    @{TITLE: @"Pan Velocity", CLASS: @"PanVelocity"},
//                                    @{TITLE: @"Random Bird", CLASS: @"RandomBird"}
                          ]};
    
    mainScreen.menu = @[basic];
    mainScreen.title = @"UIScrollView";
    mainScreen.about = @"Written by cuong@techmaster.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end	
