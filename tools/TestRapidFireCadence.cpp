#include "../android/app/src/main/cpp/tgk_cadence_probe.h"
#include <cassert>
#include <cstdio>
using tgk_cadence::Probe;
int main(){
    Probe p;void* owner=reinterpret_cast<void*>(0x1000);p.arm(137);p.start(owner,1);
    for(int i=0;i<41;i++)p.down(owner,137,1000+i*50);
    assert(!p.passed(4000));p.stop(owner,2,3010);assert(!p.passed(4000));
    p.stop(owner,1,3010);assert(!p.passed(3200));assert(p.passed(3600));
    p.down(owner,137,3500);assert(!p.passed(4100));
    p.arm(137);p.start(owner,1);for(int i=0;i<41;i++)p.down(owner,137,1000+i*100);
    p.stop(owner,1,5010);assert(!p.passed(6000));
    p.arm(138);p.start(owner,2);for(int i=0;i<100;i++)p.down(owner,137,1000+i*50);
    p.stop(owner,2,7000);assert(!p.passed(8000));
    p.arm(138);p.start(owner,2);for(int i=0;i<41;i++)p.down(owner,138,1000+i*50);
    p.stop(owner,2,3010);assert(p.passed(4000));p.arm(-1);assert(!p.passed(5000));
    std::puts("PASS native cadence: both routes, actual frequency, release, quiet period, late events, session reset");
}
