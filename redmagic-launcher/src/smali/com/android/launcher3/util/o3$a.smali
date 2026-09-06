.class public final Lcom/android/launcher3/util/o3$a;
.super Ljava/lang/Object;
.source "WeakCleanupSet.kt"

# interfaces
.implements LW/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/util/o3;-><init>(LW/d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/util/o3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/o3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/o3$a;->g:Lcom/android/launcher3/util/o3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDestroy(LW/d;)V
    .locals 1

    .line 1
    const-string v0, "owner"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/util/o3$a;->g:Lcom/android/launcher3/util/o3;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p1, v0}, Lcom/android/launcher3/util/o3;->d(Lcom/android/launcher3/util/o3;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/util/o3$a;->g:Lcom/android/launcher3/util/o3;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/util/o3;->c(Lcom/android/launcher3/util/o3;)Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "access$getCallbacks$p(...)"

    .line 19
    .line 20
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/android/launcher3/util/o3$b;

    .line 38
    .line 39
    invoke-interface {p1}, Lcom/android/launcher3/util/o3$b;->onOwnerDestroyed()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method
