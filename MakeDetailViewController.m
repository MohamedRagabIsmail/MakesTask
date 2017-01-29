//
//  MakeDetailViewController.m
//  Makes
//
//  Created by Mohamed Ragab on 1/10/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakeDetailViewController.h"
#import "Masonry.h"

static NSString * const MakeNameDisplayTableViewName = @"MakeNameDisplayTableViewName";
@interface MakeDetailViewController ()
@property (nonatomic) UITableView* makeNameDisplayTableView;
@end

@implementation MakeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tires"]];
    [backgroundImage setFrame:self.view.frame];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    backgroundImage.contentMode = UIViewContentModeScaleToFill;
    
    self.makeImageViewLargeURLString = [[NSString alloc]initWithString:self.make.imageLargeURL];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.makeImageViewLarge = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.makeImageViewLarge.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.makeImageViewLarge];
    
    self.makeImageViewLarge.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.makeImageViewLargeURLString]]];
    
    
    [self.makeImageViewLarge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.top.equalTo(self.view.mas_top).with.offset(10);
    }];
    
    self.makeNameDisplayTableView = [[UITableView alloc]init];
    
    self.makeNameDisplayTableView.delegate = self;
    self.makeNameDisplayTableView.dataSource = self;
    
    self.makeNameDisplayTableView.backgroundColor = [UIColor clearColor];
    self.makeNameDisplayTableView.scrollEnabled = NO;
    self.makeNameDisplayTableView.allowsSelection = NO;
    
    [self.view addSubview:self.makeNameDisplayTableView];

    [self.makeNameDisplayTableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
    make.leading.equalTo(self.view.mas_leading).with.offset(10);
    make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
    make.height.equalTo(@(180));
}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [self.makeNameDisplayTableView dequeueReusableCellWithIdentifier:MakeNameDisplayTableViewName];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MakeNameDisplayTableViewName];
    }
    
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    if(indexPath.row == 0)
    {
        cell.textLabel.text = self.make.nameAr;
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = self.make.nameEn;
    }

    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:25]];
    
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    
    return cell;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 90;
}

@end
