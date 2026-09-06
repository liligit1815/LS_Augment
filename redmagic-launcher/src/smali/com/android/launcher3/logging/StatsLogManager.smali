.class public Lcom/android/launcher3/logging/StatsLogManager;
.super Ljava/lang/Object;
.source "StatsLogManager.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logging/StatsLogManager$e;,
        Lcom/android/launcher3/logging/StatsLogManager$i;,
        Lcom/android/launcher3/logging/StatsLogManager$h;,
        Lcom/android/launcher3/logging/StatsLogManager$g;,
        Lcom/android/launcher3/logging/StatsLogManager$f;,
        Lcom/android/launcher3/logging/StatsLogManager$d;
    }
.end annotation


# static fields
.field public static final LAUNCHER_STATE_ALLAPPS:I = 0x4

.field public static final LAUNCHER_STATE_BACKGROUND:I = 0x1

.field public static final LAUNCHER_STATE_HOME:I = 0x2

.field public static final LAUNCHER_STATE_MENU_OVERVIEW:I = 0x6

.field public static final LAUNCHER_STATE_OVERVIEW:I = 0x3

.field public static final LAUNCHER_STATE_SEARCH:I = 0x7

.field public static final LAUNCHER_STATE_UNCHANGED:I = 0x5

.field public static final LAUNCHER_STATE_UNSPECIFIED:I


# instance fields
.field protected final mActivityContext:Lcom/android/launcher3/views/k;

.field protected final mContext:Landroid/content/Context;

.field private mInstanceId:Lcom/android/launcher3/logging/d;

.field private mKeyboardStateManager:Lcom/android/launcher3/logging/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/logging/StatsLogManager;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/views/k;->Q(Landroid/content/Context;)Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/logging/StatsLogManager;->mActivityContext:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    return-void
.end method

.method public static getLauncherAtomEvent(IILcom/android/launcher3/logging/StatsLogManager$d;)Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->w0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->m0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const/4 v0, 0x4

    .line 18
    if-eq p0, v0, :cond_2

    .line 19
    .line 20
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->j0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_2
    if-ne p0, v0, :cond_3

    .line 26
    .line 27
    if-eq p1, v0, :cond_3

    .line 28
    .line 29
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->k0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_3
    return-object p2
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    const v1, 0x7f14040a

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/logging/StatsLogManager;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method protected createImpressionLogger()Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$c;-><init>(Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected createLatencyLogger()Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$b;-><init>(Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected createLogger()Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$a;-><init>(Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public impressionLogger()Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->createImpressionLogger()Lcom/android/launcher3/logging/StatsLogManager$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$g;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$g;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public keyboardStateManager()Lcom/android/launcher3/logging/g;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mKeyboardStateManager:Lcom/android/launcher3/logging/g;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/logging/g;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/logging/StatsLogManager;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const v2, 0x7f070271

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    invoke-direct {v0, v1}, Lcom/android/launcher3/logging/g;-><init>(I)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mKeyboardStateManager:Lcom/android/launcher3/logging/g;

    .line 28
    .line 29
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mKeyboardStateManager:Lcom/android/launcher3/logging/g;

    .line 30
    .line 31
    return-object p0
.end method

.method public latencyLogger()Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->createLatencyLogger()Lcom/android/launcher3/logging/StatsLogManager$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$h;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$h;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public logger()Lcom/android/launcher3/logging/StatsLogManager$i;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->createLogger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/logging/StatsLogManager;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public withDefaultInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/logging/StatsLogManager;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object p0
.end method
