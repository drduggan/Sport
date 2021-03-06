//
//  RootViewController.m
//  Sport
//
//  Created by Desmond Duggan on 1/23/14.
//  Copyright (c) 2014 Desmond Duggan. All rights reserved.
//

#import "RootViewController.h"
#import "HistoryViewController.h"
#import "ProfileViewController.h"
#import "AccoladeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize pageTitles, pageViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Setup the color of the nav bar
    
    
    [super viewDidLoad];
    pageTitles = @[@"Workouts", @"Profile", @"Calculator"];

    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    HistoryViewController *startingViewController = (HistoryViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
 
    
    [self.navigationController.navigationBar.topItem setTitle:self.pageTitles[0]];
    
//    [self.view setBackgroundColor:[UIColor clearColor]];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    if (index == 0) {
        // Create a new view controller and pass suitable data.
        HistoryViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
        pageContentViewController.titleText = self.pageTitles[index];
        pageContentViewController.pageIndex = index;
        return pageContentViewController;
    }
    else if (index == 1){
        ProfileViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentProfileController"];
        pageContentViewController.titleText = self.pageTitles[index];
        pageContentViewController.pageIndex = index;
        return pageContentViewController;
    }
    else {
        AccoladeViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AccoladeContentController"];
        pageContentViewController.titleText = self.pageTitles[index];
        pageContentViewController.pageIndex = index;
        return pageContentViewController;
    }
    
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HistoryViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HistoryViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
