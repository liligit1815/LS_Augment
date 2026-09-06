.class public final synthetic Lcom/android/launcher3/P3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/LauncherProvider;

.field public final synthetic b:Ljava/util/function/ToIntFunction;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/LauncherProvider;Ljava/util/function/ToIntFunction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/P3;->a:Lcom/android/launcher3/LauncherProvider;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/P3;->b:Ljava/util/function/ToIntFunction;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/P3;->a:Lcom/android/launcher3/LauncherProvider;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/P3;->b:Ljava/util/function/ToIntFunction;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/LauncherProvider;->e(Lcom/android/launcher3/LauncherProvider;Ljava/util/function/ToIntFunction;)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
