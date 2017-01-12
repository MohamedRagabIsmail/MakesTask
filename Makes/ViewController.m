//
//  ViewController.m
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "ViewController.h"
#import "Make.h"
#import "AFNetworking.h"
#import "Masonry.h"
#import "MakesCollectionViewCell.h"
#import "MakeDetailViewController.h"




@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *makes;
@property (nonatomic,strong) NSCache* imagesCache;
@end

@implementation ViewController

- (void)loadMakes
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"url_string_file" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    
    [manager GET:content parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray* dictionariesArray = (NSArray*)responseObject;
        NSLog(@"%@",responseObject);
        
        Make* makeHolder = [[Make alloc]init];
        NSError * parserError;
        NSMutableArray* indexPaths = [NSMutableArray array];
        
        for(int i=0; i<dictionariesArray.count; i++)
        {
            makeHolder = [MTLJSONAdapter modelOfClass:[Make class] fromJSONDictionary:[dictionariesArray objectAtIndex:i] error:&parserError];
            
            if(parserError)
            {
                NSLog(@"%@",parserError);
            }
            
            [self.makes addObject:makeHolder];
            NSLog(@"%@",[(Make*)[self.makes objectAtIndex:i] nameAr]);
            [indexPaths addObject:[NSIndexPath indexPathForItem:self.makes.count-1 inSection:0]];
        }
        
        [self.makesCollectionView insertItemsAtIndexPaths:indexPaths];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.makes = [[NSMutableArray alloc]init];
    self.imagesCache = [[NSCache alloc]init];
    self.title = @"MAKES";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self loadMakes];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.makesCollectionView =[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.makesCollectionView setDataSource:self];
    [self.makesCollectionView setDelegate:self];
    
    [self.makesCollectionView setBackgroundColor:[UIColor lightGrayColor]];
    [self.makesCollectionView registerClass:[MakesCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:self.makesCollectionView];
    
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10 , 10, 10, 10);
    
    [self.makesCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.makes.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MakesCollectionViewCell *cell=(MakesCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[MakesCollectionViewCell alloc] init];
    }
    
    cell.makeImageView.image = nil;
    
    Make* make = [self.makes objectAtIndex:indexPath.item];
    NSString *url = make.imageSmallURL;
 
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               cell.makeImageView.image = [UIImage imageWithData:data];
                           }];
    cell.backgroundColor = [UIColor whiteColor];
    cell.makeName.text = make.nameAr;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeDetailViewController* makeDetailVC = [[MakeDetailViewController alloc]init];
    Make* currentMake = [self.makes objectAtIndex:indexPath.item];
    makeDetailVC.makeNameEnglishString = currentMake.nameEn;
    makeDetailVC.makeNameArabicString = currentMake.nameAr;
    makeDetailVC.makeImageViewLargeURLString = currentMake.imageLargeURL;
    [self.navigationController pushViewController:makeDetailVC animated:YES];
    

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 120);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
