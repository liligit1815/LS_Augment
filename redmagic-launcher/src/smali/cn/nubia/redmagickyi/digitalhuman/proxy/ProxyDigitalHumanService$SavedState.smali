.class Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;
.super Ljava/lang/Object;
.source "ProxyDigitalHumanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SavedState"
.end annotation


# instance fields
.field private backgroundColor:Ljava/lang/Integer;

.field private bindedView:Landroid/view/ViewGroup;

.field private callback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

.field private hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private isHidden:Ljava/lang/Boolean;

.field private isZOrderOnTop:Ljava/lang/Boolean;

.field private scene:Ljava/lang/Integer;

.field private supportedTouchEvent:Ljava/lang/Boolean;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;


# direct methods
.method private constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method synthetic constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$1;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)V

    return-void
.end method

.method static synthetic access$1000(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->clearState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$1100(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->saveState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$1200(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->restoreState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->backgroundColor:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isHidden:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->supportedTouchEvent:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isZOrderOnTop:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$800(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->bindedView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$900(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->scene:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method private clearState()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->callback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 9
    .line 10
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->supportedTouchEvent:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->bindedView:Landroid/view/ViewGroup;

    .line 13
    .line 14
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->scene:Ljava/lang/Integer;

    .line 15
    .line 16
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isZOrderOnTop:Ljava/lang/Boolean;

    .line 17
    .line 18
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->backgroundColor:Ljava/lang/Integer;

    .line 19
    .line 20
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 21
    .line 22
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 29
    .line 30
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$1;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$1;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$1300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private restoreState()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 17
    .line 18
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 25
    .line 26
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$2;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState$2;-><init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$1300(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->callback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->bindedView:Landroid/view/ViewGroup;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 53
    .line 54
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->scene:Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v1, v0, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->bindView(Landroid/view/ViewGroup;Ljava/lang/Integer;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->supportedTouchEvent:Ljava/lang/Boolean;

    .line 60
    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {v1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->supportedTouchEvent(Z)V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isZOrderOnTop:Ljava/lang/Boolean;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {v1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->setZOrderOnTop(Z)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->backgroundColor:Ljava/lang/Integer;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->setBackgroundColor(I)V

    .line 96
    .line 97
    .line 98
    :cond_6
    :goto_0
    return-void
.end method

.method private saveState()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->hasSavedStore:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
    .locals 1

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->access$1400(Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;)Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$ProxyDigitalHumanClientCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->callback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 11
    .line 12
    return-object p1
.end method

.method public setBackgroundColor(I)I
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->backgroundColor:Ljava/lang/Integer;

    .line 6
    .line 7
    return p1
.end method

.method public setBindedView(Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->bindedView:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p1
.end method

.method public setHidden(Z)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isHidden:Ljava/lang/Boolean;

    .line 6
    .line 7
    return p1
.end method

.method public setScene(I)I
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->scene:Ljava/lang/Integer;

    .line 6
    .line 7
    return p1
.end method

.method public setSupportedTouchEvent(Ljava/lang/Boolean;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->supportedTouchEvent:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setZOrderOnTop(Z)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->isZOrderOnTop:Ljava/lang/Boolean;

    .line 6
    .line 7
    return p1
.end method

.method public unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService$SavedState;->callback:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 3
    .line 4
    return-object p1
.end method
