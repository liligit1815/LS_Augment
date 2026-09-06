.class public final Lcom/android/quickstep/util/AlreadyStartedBackAnimState;
.super Ljava/lang/Object;
.source "BackAnimState.kt"

# interfaces
.implements Lcom/android/quickstep/util/BackAnimState;


# instance fields
.field private final onEndCallback:Lcom/android/launcher3/util/Y1;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/util/Y1;)V
    .locals 1

    .line 1
    const-string v0, "onEndCallback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/AlreadyStartedBackAnimState;->onEndCallback:Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addOnAnimCompleteCallback(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "r"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/AlreadyStartedBackAnimState;->onEndCallback:Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public applyToAnimationResult(Lcom/android/launcher3/M2$a;Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "result"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "c"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lcom/android/quickstep/util/e;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Lcom/android/quickstep/util/e;-><init>(Lcom/android/launcher3/M2$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/AlreadyStartedBackAnimState;->addOnAnimCompleteCallback(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    return-void
.end method
