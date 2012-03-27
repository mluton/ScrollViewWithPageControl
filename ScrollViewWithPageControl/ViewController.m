//
//  ViewController.m
//  ScrollViewWithPageControl
//
//  Created by Michael Luton on 3/25/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "ViewController.h"
#import "GlyphView.h"

@implementation ViewController

@synthesize glyphScrollView;
@synthesize pageControl;


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *glyphs = [NSArray arrayWithObjects:@"D", @"Y", @"N", @"A", @"M", @"I", @"C", nil];
    
    // Set properties for the UIScrollView.
    glyphScrollView.pagingEnabled = YES;
    glyphScrollView.contentSize = CGSizeMake(glyphScrollView.frame.size.width * [glyphs count], glyphScrollView.frame.size.height);
    glyphScrollView.showsHorizontalScrollIndicator = NO;
    glyphScrollView.showsVerticalScrollIndicator = NO;
    glyphScrollView.scrollsToTop = NO;
    glyphScrollView.delegate = self;

    // Set properties for UIPageControl.
    pageControl.numberOfPages = [glyphs count];
    pageControl.currentPage = 0;

    // Add the subviews to the UIScrollView.
    for (unsigned i = 0; i < [glyphs count]; i++) {
        GlyphView *aView = [[[NSBundle mainBundle] loadNibNamed:@"GlyphView" owner:self options:nil] objectAtIndex:0];
        aView.glyphLabel.text = [glyphs objectAtIndex:i];
        aView.frame = CGRectMake(glyphScrollView.frame.size.width * i, 0, glyphScrollView.frame.size.width, glyphScrollView.frame.size.height);
        [glyphScrollView addSubview:aView];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (pageControlUsed) {
        return;
    }
	
    CGFloat pageWidth = glyphScrollView.frame.size.width;
    int page = floor((glyphScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender
{
    int page = pageControl.currentPage;
	
    CGRect frame = glyphScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [glyphScrollView scrollRectToVisible:frame animated:YES];
    
    pageControlUsed = YES;
}


- (void)viewDidUnload
{
    [self setGlyphScrollView:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
}


@end
