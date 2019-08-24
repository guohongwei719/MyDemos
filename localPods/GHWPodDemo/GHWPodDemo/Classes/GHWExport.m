#import "GHWExport.h"

#import <dlfcn.h>
#import <objc/runtime.h>

#import <mach-o/dyld.h>
#import <mach-o/getsect.h>
#import <mach-o/ldsyms.h>

#ifdef __LP64__
typedef uint64_t GHWExportValue;
typedef struct section_64 GHWExportSection;
#define GHWGetSectByNameFromHeader getsectbynamefromheader_64
#else
typedef uint32_t GHWExportValue;
typedef struct section GHWExportSection;
#define GHWGetSectByNameFromHeader getsectbynamefromheader
#endif

#pragma mark -

void GHWExecuteFunction(char *key) {
    Dl_info info;
    dladdr((const void *)&GHWExecuteFunction, &info);
    
    const GHWExportValue mach_header = (GHWExportValue)info.dli_fbase;
    const GHWExportSection *section = GHWGetSectByNameFromHeader((void *)mach_header, "__GHW", key);
    if (section == NULL) return;

    int addrOffset = sizeof(struct GHW_Function);
    for (GHWExportValue addr = section->offset;
         addr < section->offset + section->size;
         addr += addrOffset) {
        
        struct GHW_Function entry = *(struct GHW_Function *)(mach_header + addr);
        entry.function();
    }
    
    // 也可以使用getsectiondata获取到指定的section
    //    unsigned long size;
    //    struct GHW_Function *ptr = (struct GHW_Function *)getsectiondata(&_mh_execute_header, "__DATA", "__test", &size);
    //    void (*funP)(void);
    //    funP = ptr->functionBlock;
    //    funP();
    //    ptr->functionBlock();
}


@interface GHWExport ()
@end

@implementation GHWExport

+ (instancetype)sharedInstance {
    static GHWExport *singleTon;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleTon = GHWExport.new;
    });
    return singleTon;
}

- (void)executeArrayForKey:(NSString *)key {
    NSString *fKey = [NSString stringWithFormat:@"__%@", key?:@""];
    GHWExecuteFunction((char *)[fKey UTF8String]);
}

- (void)testFail {
    NSArray *array = @[@"1"];
    NSLog(@"test = %@", array[2]);
}

- (void)testSuccess {
    NSLog(@"success");
}

@end
