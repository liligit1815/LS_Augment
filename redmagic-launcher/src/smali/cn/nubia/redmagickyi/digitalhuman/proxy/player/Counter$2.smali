.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;
.super Ljava/lang/Object;
.source "Counter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->onCounterValueChanged(FZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

.field final synthetic val$isEnd:Z

.field final synthetic val$value:F


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    iput p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->val$value:F

    .line 4
    .line 5
    iput-boolean p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->val$isEnd:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->val$value:F

    .line 8
    .line 9
    iget-boolean p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$2;->val$isEnd:Z

    .line 10
    .line 11
    invoke-interface {v0, v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;->onCounterValueChanged(FZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
