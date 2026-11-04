/* RedMagic inputflinger. The build validates the device binaries and the runtime
 * validates the mapped function before enabling this optional dispatch path. */
typedef unsigned int u32;
typedef unsigned long word;
typedef unsigned char byte;
typedef struct {u32 type, flags;word offset,vaddr,paddr,filesz,memsz,align;} Phdr;
typedef struct {word base;const char *name;const Phdr *segments;unsigned short count;} Image;
extern int dl_iterate_phdr(int (*visit)(Image*,word,void*),void*);
typedef int (*Hook)(void*,void*,void**);
typedef struct {u32 version;Hook hook;int (*unhook)(void*);} Api;
typedef int (*Publish)(void*,void*,byte*);
typedef struct {float m[9];u32 type;} Matrix;
typedef struct {int uid,width,height;float scale,x,y;} Scene;
static Hook hook;
static Publish original;
static Scene scene={.uid=-1};
static int enabled;
static byte lock;
static u32 stats[4]; /* eligible deliveries, corrected deliveries, multi, peak */
static void acquire(void){while(__atomic_test_and_set(&lock,__ATOMIC_ACQUIRE)){}}
static void release(void){__atomic_clear(&lock,__ATOMIC_RELEASE);}
static int near(float a,float b,float tol){return __builtin_fabsf(a-b)<=tol;}
static int identity(const Matrix *m){
    for(int i=0;i<9;i++)if(!near(m->m[i],i==0||i==4||i==8?1:0,.001f))return 0;
    return 1;
}
static int map(const Scene *s,const Matrix *local,Matrix *out){
    float inv=1/s->scale;
    const float basis[4][4]={{1,0,0,1},{0,-1,1,0},{-1,0,0,-1},{0,1,-1,0}};
    if(!near(local->m[2],0,.001f)||!near(local->m[5],0,.001f)||!near(local->m[8],1,.001f))return 0;
    for(int r=0;r<4;r++){
        const float *b=basis[r];
        if(!near(local->m[0],b[0]*inv,.005f)||!near(local->m[1],b[1]*inv,.005f)||
           !near(local->m[3],b[2]*inv,.005f)||!near(local->m[4],b[3]*inv,.005f))continue;
        *out=*local;
        out->m[6]=-(b[0]*s->x+b[2]*s->y)*inv+(r==2?s->width:r==3?s->height:0);
        out->m[7]=-(b[1]*s->x+b[3]*s->y)*inv+(r==1?s->width:r==2?s->height:0);
        out->type=0x80000000u;
        return 1;
    }
    return 0;
}
static int publish(void *dispatcher,void *connection,byte *entry){
    if(!__atomic_load_n(&enabled,__ATOMIC_ACQUIRE))return original(dispatcher,connection,entry);
    acquire();Scene s=scene;release();
    if(s.uid>=10000 && entry && *(int*)(entry+0x84)==s.uid){
        const byte *event=*(byte**)(entry+8);
        if(event && *(int*)(event+12)==3 && (*(u32*)(event+0x38)&0x1002)==0x1002 &&
           *(int*)(event+0x3c)==0 && !(*(u32*)(entry+0x18)&8) && *(float*)(entry+0x6c)==1.f){
            word start=*(word*)(event+0x78),end=*(word*)(event+0x80);
            word count=end>=start?(end-start)/8:0;
            Matrix raw=*(Matrix*)(entry+0x44),corrected;
            __atomic_fetch_add(&stats[0],1,__ATOMIC_RELAXED);
            if(count>=1 && count<=16 && identity(&raw) && map(&s,(Matrix*)(entry+0x1c),&corrected)){
                /* Only the outbound raw matrix changes. The original call signs the
                 * same data that it sends, including every original pointer ID. */
                *(Matrix*)(entry+0x44)=corrected;
                int rc=original(dispatcher,connection,entry);
                *(Matrix*)(entry+0x44)=raw;
                if(rc==0){
                    __atomic_fetch_add(&stats[1],1,__ATOMIC_RELAXED);
                    if(count>1)__atomic_fetch_add(&stats[2],1,__ATOMIC_RELAXED);
                    u32 old=__atomic_load_n(&stats[3],__ATOMIC_RELAXED);
                    while(old<count && !__atomic_compare_exchange_n(&stats[3],&old,count,0,__ATOMIC_RELAXED,__ATOMIC_RELAXED)){}
                }
                return rc;
            }
        }
    }
    return original(dispatcher,connection,entry);
}
static int visit(Image *img,word size,void *data){
    const char *path="/system/lib64/libinputflinger.so";int i=0;
    if(!img->name)return 0;
    while(path[i] && path[i]==img->name[i])i++;
    if(path[i] || img->name[i])return 0;
    const word rva=0x2296f8;const u32 entry[]={0xd503233f,0xfc1a0fe8,0xa900fbfd,0xf9000ffc};
    const u32 *code=(const u32*)(img->base+rva);
    for(int n=0;n<img->count;n++){
        const Phdr *p=&img->segments[n];
        if(p->type!=1 || !(p->flags&1) || p->vaddr>rva || rva+564>p->vaddr+p->memsz)continue;
        for(int k=0;k<4;k++)if(code[k]!=entry[k])return 0;
        return hook((void*)code,(void*)publish,(void**)&original)==0 && original!=0;
    }
    return 0;
}
#define API __attribute__((visibility("default")))
void step_input_set_hook(Hook value){hook=value;}
API unsigned char Java_ls_augment_com_step_GameInput_installNative(void *env,void *cls){
    return original!=0 || (hook && dl_iterate_phdr(visit,0)!=0);
}
API void Java_ls_augment_com_step_GameInput_configure(void *env,void *cls,int uid,float scale,float x,float y,int width,int height){
    Scene next={scale>0 && scale<1 && width>0 && height>0?uid:-1,width,height,scale,x,y};
    acquire();scene=next;__atomic_store_n(&enabled,next.uid>=10000,__ATOMIC_RELEASE);release();
}
API int Java_ls_augment_com_step_GameInput_counter(void *env,void *cls,int n){
    return n>=0 && n<4?__atomic_load_n(&stats[n],__ATOMIC_RELAXED):0;
}
