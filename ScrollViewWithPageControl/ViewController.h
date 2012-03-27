//
//  ViewController.h
//  ScrollViewWithPageControl
//
//  Created by Michael Luton on 3/25/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    BOOL pageControlUsed;
}

@property (weak, nonatomic) IBOutlet UIScrollView *glyphScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;

@end
