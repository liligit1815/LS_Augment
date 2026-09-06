.class final Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;
.super Ljava/lang/Object;
.source "LsNativeStack.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/LsNativeStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MemoryRefresh"
.end annotation


# instance fields
.field private final recents:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 377
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 378
    iput-object p1, p0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;->recents:Lcom/android/quickstep/views/RecentsView;

    .line 379
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 383
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;->recents:Lcom/android/quickstep/views/RecentsView;

    if-eq v0, v1, :cond_0

    .line 384
    return-void

    .line 386
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->access$302(Z)Z

    .line 387
    invoke-static {}, Lcom/android/quickstep/views/LsNativeStack;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 388
    iget-object v0, p0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;->recents:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;->recents:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 391
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/views/LsNativeStack$MemoryRefresh;->recents:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v0}, Lcom/android/quickstep/views/LsNativeStack;->access$400(Lcom/android/quickstep/views/RecentsView;)V

    .line 392
    return-void

    .line 389
    :cond_2
    :goto_0
    return-void
.end method
