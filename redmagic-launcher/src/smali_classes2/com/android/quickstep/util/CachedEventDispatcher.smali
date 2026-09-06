.class public Lcom/android/quickstep/util/CachedEventDispatcher;
.super Ljava/lang/Object;
.source "CachedEventDispatcher.java"


# instance fields
.field private mCache:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mConsumer:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mLastEvent:Landroid/view/MotionEvent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public clearConsumer()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mConsumer:Ljava/util/function/Consumer;

    .line 3
    .line 4
    return-void
.end method

.method public dispatchEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mConsumer:Ljava/util/function/Consumer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mLastEvent:Landroid/view/MotionEvent;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/android/systemui/shared/system/InputChannelCompat;->mergeMotionEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    return-void

    .line 21
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 31
    .line 32
    :cond_3
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mLastEvent:Landroid/view/MotionEvent;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public hasConsumer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mConsumer:Ljava/util/function/Consumer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public setConsumer(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mConsumer:Ljava/util/function/Consumer;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    move p1, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    :goto_0
    if-ge v0, p1, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/view/MotionEvent;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mConsumer:Ljava/util/function/Consumer;

    .line 28
    .line 29
    invoke-interface {v2, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mCache:Ljava/util/ArrayList;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/android/quickstep/util/CachedEventDispatcher;->mLastEvent:Landroid/view/MotionEvent;

    .line 42
    .line 43
    return-void
.end method
