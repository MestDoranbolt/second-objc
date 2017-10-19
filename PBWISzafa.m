//
//  PBWISzafa.m
//  ObjIntro
//
//  Created by Marecki on 19/10/2017.
//  Copyright © 2017 Marecki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBWISzafa.h"

@implementation PBWISzafa

@synthesize wysokosc = _wysokosc;
@synthesize szerokosc = _szerokosc;
@synthesize dlugosc = _dlugosc;

-(id) initWithParams: (int)wys :(int)szer :(int)dl {
    self = [super init];
    if (self) {
        _wysokosc = wys;
        _szerokosc = szer;
        _dlugosc = dl;
    }
    return self;
}
-(NSString *) opisZasobu {
    return [NSString stringWithFormat:@"Szafa o kolorze: %@", self.kolor];
}

@end
