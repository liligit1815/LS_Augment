#pragma once
#include <cstdint>

namespace tgk_cadence {
// Read-only observations of the OEM producer. No events are injected by this probe.
struct Probe {
    int key=-1, mask=0, count=0;
    void* owner=nullptr;
    int64_t first=0,last=0,released=0,maxGap=0;
    bool active=false,late=false,invalid=false;
    void arm(int value){*this=Probe{};key=value;}
    void start(void* source,int bits){
        if(key<1||bits<1||(bits&(bits-1))!=0)return;
        if(active&&owner==source&&mask==bits)return;
        int expected=key;*this=Probe{};key=expected;owner=source;mask=bits;active=true;
    }
    void down(void* source,int code,int64_t now){
        if(source!=owner||code!=key||now<=0)return;
        if(released>0){if(now>released+100)late=true;return;}
        if(!active)return;
        if(count>0){if(now<=last)invalid=true;if(now-last>maxGap)maxGap=now-last;}
        else first=now;
        last=now;++count;
    }
    void stop(void* source,int bits,int64_t now){
        if(source==owner&&active&&(bits&mask)==mask){released=now;active=false;}
    }
    double cps()const{return last>first?(count-1)*1000.0/(last-first):0;}
    bool passed(int64_t now)const{return !invalid&&!late&&count>=30&&last-first>=1800
        &&released>=last&&now>=released+500&&maxGap<=150&&cps()>=17&&cps()<=23;}
};
}
