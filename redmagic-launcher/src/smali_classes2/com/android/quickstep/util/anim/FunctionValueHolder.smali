.class public final Lcom/android/quickstep/util/anim/FunctionValueHolder;
.super Ljava/lang/Object;
.source "FunctionValueHolder.java"

# interfaces
.implements Lcom/android/quickstep/util/anim/BaseValueHolder;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/quickstep/util/anim/BaseValueHolder<",
        "TT;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field public f14500a:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public volatile f14501b:Ljava/lang/Object;

.field public final f14502c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lu4/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "initializer"

    .line 5
    .line 6
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14500a:Lu4/a;

    .line 10
    .line 11
    sget-object p1, Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14501b:Ljava/lang/Object;

    .line 14
    .line 15
    iput-object p0, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14502c:Ljava/lang/Object;

    .line 16
    .line 17
    return-void
.end method

.method private final writeReplace()Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/anim/ObjectValueHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/anim/FunctionValueHolder;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/anim/ObjectValueHolder;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public final getValue()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14501b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14502c:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v2, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14501b:Ljava/lang/Object;

    .line 12
    .line 13
    if-ne v2, v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14500a:Lu4/a;

    .line 16
    .line 17
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v2, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14501b:Ljava/lang/Object;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-object v1, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14500a:Lu4/a;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    monitor-exit v0

    .line 33
    return-object v2

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/anim/FunctionValueHolder;->f14501b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/FunctionValueHolderLockObject;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/util/anim/FunctionValueHolder;->getValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "Lazy value not initialized yet."

    .line 17
    .line 18
    return-object p0
.end method
