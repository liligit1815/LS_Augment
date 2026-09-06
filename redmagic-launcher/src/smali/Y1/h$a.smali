.class public final LY1/h$a;
.super Ljava/lang/Object;
.source "TaskbarFeatureEvaluator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LY1/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LY1/h$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/taskbar/I1;)LY1/h;
    .locals 2

    .line 1
    const-string v0, "taskbarActivityContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    invoke-static {}, LY1/h;->a()LY1/h;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, LY1/h;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, p1, v1}, LY1/h;-><init>(Lcom/android/launcher3/taskbar/I1;Lkotlin/jvm/internal/j;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, LY1/h;->b(LY1/h;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    invoke-static {}, LY1/h;->a()LY1/h;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-object p1

    .line 34
    :goto_1
    monitor-exit p0

    .line 35
    throw p1
.end method
