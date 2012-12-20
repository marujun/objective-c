//
//  pfview.h
//  learn-IOS
//
//  Created by mrj on 12-12-19.
//  Copyright (c) 2012年 mrj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pfview : UIView{
    CGPDFDocumentRef pdf;
    CGPDFPageRef page;
}
@property int pageIndex;

- (id)initWithFrame:(CGRect)frame index:(NSInteger)pageIndex filename:(NSString *)filename;

-(NSInteger) getNumberOfPages;

@end
