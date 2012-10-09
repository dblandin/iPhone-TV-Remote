//
//  DVR.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "DVR.h"

@implementation DVR

@synthesize state;
@synthesize power;

-(id) init
{
    self = [super init];
    if (self) {
        [self setPower:0];
        [self setState:@"stopped"];
    }
    return self;
}

-(NSString*) play
{
    [self setState:@"playing"];
    return [self state];
}

-(NSString*) stop
{
    [self setState:@"stopped"];
    return [self state];
}

-(NSString*) pause
{
    [self setState:@"paused"];
    return [self state];
}

-(NSString*) record
{
    [self setState:@"recording"];
    return [self state];
}

-(NSString*) FF
{
    [self setState:@"fast forwarding"];
    return [self state];
}

-(NSString*) RW
{
    [self setState:@"rewinding"];
    return [self state];
}
-(NSString*) powerOn
{
    [self setState:@"stopped"];
    [self setPower:1];
    return [self state];
}
-(NSString*) powerOff
{
    [self setState:@"stopped"];
    [self setPower:0];
    return [self state];
}

@end
