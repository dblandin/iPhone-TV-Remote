//
//  DVR.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVR : NSObject

@property NSString *state;
@property int power;
-(NSString*) stop;
-(NSString*) play;
-(NSString*) pause;
-(NSString*) record;
-(NSString*) FF;
-(NSString*) RW;
-(NSString*) powerOn;
-(NSString*) powerOff;


@end
