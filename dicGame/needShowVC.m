//
//  needShowVC.m
//  dicGame
//
//  Created by 刘海峰 on 2020/10/15.
//

#import "needShowVC.h"

@interface needShowVC ()

@property (weak, nonatomic) IBOutlet UILabel *typeOne;
@property (weak, nonatomic) IBOutlet UILabel *tepyTwo;
@property (weak, nonatomic) IBOutlet UILabel *typeThree;


@property (weak, nonatomic) IBOutlet UILabel *contentOne;
@property (weak, nonatomic) IBOutlet UILabel *contentTwo;
@property (weak, nonatomic) IBOutlet UILabel *contentThree;

@property (nonatomic,strong) NSMutableArray *typeArray;/**< 类型 */
@property (nonatomic,strong) NSMutableArray *contentArray;

- (void)initializeDataSource;
- (void)initializeUserInterface;

@end

@implementation needShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initializeDataSource];
    [self initializeUserInterface];
}

// 初始化
- (void)initializeDataSource{
    
    //@{@"typeName":@"IT",@"fileName":@"THUOCL_it"},,@{@"typeName":@"地名",@"fileName":@"THUOCL_diming"}
    self.typeArray = [[NSMutableArray alloc] initWithArray:@[@{@"typeName":@"动物",@"fileName":@"THUOCL_animal"},@{@"typeName":@"成语",@"fileName":@"THUOCL_chengyu"},@{@"typeName":@"医学",@"fileName":@"THUOCL_medical"},@{@"typeName":@"食物",@"fileName":@"THUOCL_food"},@{@"typeName":@"敏感",@"fileName":@"ad_mingan"},@{@"typeName":@"色情",@"fileName":@"sex_mingan"}]];
    
    self.contentArray = [[NSMutableArray alloc] init];
    
}

- (void)initializeUserInterface{
    
    // 需要展示个数
    NSInteger needShowNum = self.isEsay?1:3;
    
    // 拿到
    NSMutableArray *tempArr = [[NSMutableArray alloc] initWithArray:[self noRepeatRandomArrayWithNum:self.typeArray.count count:needShowNum]];
    
    
    for (NSInteger i = 0; i < tempArr.count; i ++) {
        
        NSInteger tempIndex = [tempArr[i] integerValue];
        
        switch (i) {
            case 0:{
                
                // 调整一下类型位置
                if (self.isEsay) {
                    self.tepyTwo.text = self.typeArray[tempIndex][@"typeName"];
                }
                else{
                    self.typeOne.text = self.typeArray[tempIndex][@"typeName"];
                }
                
                
                self.contentOne.text = [self getContentWithPath:self.typeArray[tempIndex][@"fileName"]];
                
            }
                break;
            case 1:{
                self.tepyTwo.text = self.typeArray[tempIndex][@"typeName"];
                
                self.contentTwo.text = [self getContentWithPath:self.typeArray[tempIndex][@"fileName"]];
            }
                break;
            case 2:{
                self.typeThree.text = self.typeArray[tempIndex][@"typeName"];
                
                self.contentThree.text = [self getContentWithPath:self.typeArray[tempIndex][@"fileName"]];
            }
                break;

            default:
                break;
        }
        
    }
    
    
}


// 获取对应模块下的参数
- (NSString *)getContentWithPath:(NSString *)pathStr{
    
    NSString *needStr = @"";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:pathStr ofType:@"txt"];
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *tempArr = [content componentsSeparatedByString:@"\n"];
    
    NSInteger tempNum = arc4random() % tempArr.count;
    
    NSString *tempStr = tempArr[tempNum];
    
    NSRange tempRange = [tempStr rangeOfString:@"\\d" options:NSRegularExpressionSearch range:NSMakeRange(0, tempStr.length) locale:nil];

    if (tempRange.location != NSNotFound) {
        needStr = [tempStr substringToIndex:tempRange.location];
        NSLog(@"截取：%@",[tempStr substringToIndex:tempRange.location]);
    }
    else{
        needStr = tempStr;
        NSLog(@"未截取：%@",tempStr);
    }
    
    
    // 遍历此数组下所有参数
//    for (NSString *tempStr in tempArr) {
//
//        NSRange tempRange = [tempStr rangeOfString:@"\\d" options:NSRegularExpressionSearch range:NSMakeRange(0, tempStr.length) locale:nil];
//
//        if (tempRange.location != NSNotFound) {
//
//            NSLog(@"截取：%@",[tempStr substringToIndex:tempRange.location]);
//        }
//        else{
//            NSLog(@"未截取：%@",tempStr);
//        }
//
//    }
    
    return needStr;
}




// 获取不重复随机数
- (NSArray *)noRepeatRandomArrayWithNum:(NSInteger)randomNum count:(NSInteger)count{
    
    NSMutableSet *set = [NSMutableSet setWithCapacity:count];
    while (set.count < count) {
        NSInteger value = arc4random() % randomNum;
        [set addObject:[NSNumber numberWithInteger:value]];
    }
    return set.allObjects;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
