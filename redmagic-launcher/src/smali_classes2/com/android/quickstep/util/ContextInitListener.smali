.class public Lcom/android/quickstep/util/ContextInitListener;
.super Ljava/lang/Object;
.source "ContextInitListener.java"

# interfaces
.implements Lcom/android/launcher3/util/H$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTEXT::",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/util/H$b<",
        "TCONTEXT;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActivityInitListener"


# instance fields
.field private final mContextTracker:Lcom/android/launcher3/util/H;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/H<",
            "TCONTEXT;>;"
        }
    .end annotation
.end field

.field private mIsRegistered:Z

.field private mOnInitListener:Ljava/util/function/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/BiPredicate<",
            "TCONTEXT;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/function/BiPredicate;Lcom/android/launcher3/util/H;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BiPredicate<",
            "TCONTEXT;",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/android/launcher3/util/H<",
            "TCONTEXT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/ContextInitListener;->mIsRegistered:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/quickstep/util/ContextInitListener;->mOnInitListener:Ljava/util/function/BiPredicate;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/util/ContextInitListener;->mContextTracker:Lcom/android/launcher3/util/H;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected handleInit(Lcom/android/launcher3/views/k;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTEXT;Z)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextInitListener;->mOnInitListener:Ljava/util/function/BiPredicate;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p0, p1, p2}, Ljava/util/function/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final init(Lcom/android/launcher3/views/k;Z)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTEXT;Z)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/ContextInitListener;->mIsRegistered:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/ContextInitListener;->handleInit(Lcom/android/launcher3/views/k;Z)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public register(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "ActivityInitListener"

    .line 2
    .line 3
    const-string v1, "register"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/util/ContextInitListener;->mIsRegistered:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/ContextInitListener;->mContextTracker:Lcom/android/launcher3/util/H;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/util/H;->registerCallback(Lcom/android/launcher3/util/H$b;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public unregister(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "ActivityInitListener"

    .line 2
    .line 3
    const-string v1, "unregister"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/ContextInitListener;->mContextTracker:Lcom/android/launcher3/util/H;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/util/H;->getCallbacks()Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/android/launcher3/util/H$b;

    .line 34
    .line 35
    instance-of v3, v2, Lcom/android/quickstep/util/ContextInitListener;

    .line 36
    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/android/launcher3/util/H$b;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/android/quickstep/util/ContextInitListener;->mContextTracker:Lcom/android/launcher3/util/H;

    .line 60
    .line 61
    invoke-virtual {v2, v1, p1}, Lcom/android/launcher3/util/H;->unregisterCallback(Lcom/android/launcher3/util/H$b;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const/4 p1, 0x0

    .line 66
    iput-boolean p1, p0, Lcom/android/quickstep/util/ContextInitListener;->mIsRegistered:Z

    .line 67
    .line 68
    const/4 p1, 0x0

    .line 69
    iput-object p1, p0, Lcom/android/quickstep/util/ContextInitListener;->mOnInitListener:Ljava/util/function/BiPredicate;

    .line 70
    .line 71
    return-void
.end method
