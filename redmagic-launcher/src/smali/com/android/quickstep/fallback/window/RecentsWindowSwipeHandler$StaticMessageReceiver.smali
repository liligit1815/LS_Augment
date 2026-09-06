.class Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;
.super Ljava/lang/Object;
.source "RecentsWindowSwipeHandler.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StaticMessageReceiver"
.end annotation


# instance fields
.field private mCurrentCallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/util/function/Consumer<",
            "Landroid/os/Message;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCurrentUID:Landroid/os/ParcelUuid;

.field private final mMessenger:Landroid/os/Messenger;


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Landroid/os/Handler;

    .line 4
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mMessenger:Landroid/os/Messenger;

    .line 5
    new-instance v0, Landroid/os/ParcelUuid;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/ParcelUuid;-><init>(Ljava/util/UUID;)V

    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentUID:Landroid/os/ParcelUuid;

    .line 6
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentCallback:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/fallback/window/w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentUID:Landroid/os/ParcelUuid;

    .line 2
    .line 3
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/ParcelUuid;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentCallback:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/function/Consumer;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public newCallback(Ljava/util/function/Consumer;)Landroid/os/Message;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/os/Message;",
            ">;)",
            "Landroid/os/Message;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/os/ParcelUuid;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/ParcelUuid;-><init>(Ljava/util/UUID;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentUID:Landroid/os/ParcelUuid;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentCallback:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mMessenger:Landroid/os/Messenger;

    .line 24
    .line 25
    iput-object v0, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowSwipeHandler$StaticMessageReceiver;->mCurrentUID:Landroid/os/ParcelUuid;

    .line 28
    .line 29
    iput-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 30
    .line 31
    return-object p1
.end method
