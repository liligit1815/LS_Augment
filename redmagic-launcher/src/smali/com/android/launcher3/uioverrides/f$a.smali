.class final Lcom/android/launcher3/uioverrides/f$a;
.super Landroid/content/ContextWrapper;
.source "QuickstepAppWidgetHostProvider.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/util/p1;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;)V
    .locals 1

    .line 1
    const-string v0, "ctx"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "executor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/f$a;->a:Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()Lcom/android/launcher3/util/p1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/f$a;->a:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getMainExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/f$a;->a()Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMainLooper()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/f$a;->a:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
