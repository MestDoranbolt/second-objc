//
//  PBWIZasobyWydzialu.m
//  ObjIntro
//
//  Created by Marecki on 16/10/2017.
//  Copyright © 2017 Marecki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBWIZasobyWydzialu.h"
#import <stdlib.h>

@implementation PBWIZasobyWydzialu

-(id) init {
    if (self = [super init]) {
        pokoje = [[NSMutableDictionary alloc] init];
        zasoby = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) dodajPokoj:(PBWIPokoj *)pokoj {
    NSInteger count = arc4random_uniform(100);
    NSString *key = [@(count) stringValue];
    pokoje[key] = pokoj;
}

-(void) dodajZasob:(PBWIZasob *) zasob doPokoju:(PBWIPokoj *)pokoj {
    [zasoby addObject:zasob];
    for (PBWIPokoj *p in [pokoje allValues]) {
        if ([p isEqual:pokoj]) {
            [p dodajZasob:zasob];
        }
    }
}

-(void)przeniesZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *)zrodloPokoj doPokoju:(PBWIPokoj *)celPokoj {
    [zrodloPokoj usunZasob:zasob];
    [celPokoj dodajZasob:zasob];
}

-(void) usunZasob:(PBWIZasob *)zasob zPokoju:(PBWIPokoj *)pokoj {
    for (PBWIPokoj *p in [pokoje allValues]) {
        if ([p isEqual:pokoj]) {
            [p usunZasob:zasob];
        }
    }
}

-(NSArray *)wypiszNumery {
    NSArray *keys = [pokoje allKeys];
    return keys;
}

-(NSArray *)wypiszBiurka {
    NSMutableArray *biurka = [[NSMutableArray alloc] init];
    for(PBWIZasob *zasob in zasoby) {
        if ([[zasob className] isEqualToString:@"PBWIBiurko"]) {
            [biurka addObject:zasob];
        }
    }
    return biurka;
}

-(NSArray *)wypiszKrzesla {
    NSMutableArray *krzesla = [[NSMutableArray alloc] init];
    for(PBWIZasob *zasob in zasoby) {
        if ([[zasob className] isEqualToString:@"PBWIKrzeslo"]) {
            [krzesla addObject:zasob];
        }
    }
    return krzesla;
}

@end
