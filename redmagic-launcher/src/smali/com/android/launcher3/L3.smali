.class public final synthetic Lcom/android/launcher3/L3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToIntFunction;


# instance fields
.field public final synthetic a:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/L3;->a:Landroid/util/Pair;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final applyAsInt(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/L3;->a:Landroid/util/Pair;

    .line 2
    .line 3
    check-cast p1, Lz1/k2;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/LauncherProvider;->d(Landroid/util/Pair;Lz1/k2;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
