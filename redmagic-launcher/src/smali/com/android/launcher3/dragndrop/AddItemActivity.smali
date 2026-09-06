.class public Lcom/android/launcher3/dragndrop/AddItemActivity;
.super Lcom/android/launcher3/v;
.source "AddItemActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/launcher3/views/f$e;
.implements Lcom/android/launcher3/widget/WidgetCell$c;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation


# static fields
.field private static final u:[Ljava/lang/String;

.field private static final v:[Ljava/lang/String;

.field private static final w:[Ljava/lang/String;


# instance fields
.field private final g:Landroid/graphics/PointF;

.field private h:Landroid/content/pm/LauncherApps$PinItemRequest;

.field private i:Lcom/android/launcher3/P2;

.field private j:Lcom/android/launcher3/F1;

.field private k:Lcom/android/launcher3/views/BaseDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "Lcom/android/launcher3/dragndrop/AddItemActivity;",
            ">;"
        }
    .end annotation
.end field

.field private l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

.field private m:Landroid/view/accessibility/AccessibilityManager;

.field private n:Lcom/android/launcher3/widget/WidgetCell;

.field private o:Lcom/android/launcher3/widget/l0;

.field private p:Lcom/android/launcher3/widget/Y0;

.field private q:I

.field private r:Landroid/os/Bundle;

.field private s:Z

.field t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const-string v8, "cn.nubia.gamelauncher"

    .line 2
    .line 3
    const-string v9, "com.zte.cloud"

    .line 4
    .line 5
    const-string v0, "com.zte.nebulatranslation"

    .line 6
    .line 7
    const-string v1, "com.zte.aiassistant"

    .line 8
    .line 9
    const-string v2, "cn.nubia.redmagickyi"

    .line 10
    .line 11
    const-string v3, "zte.com.cn.filer"

    .line 12
    .line 13
    const-string v4, "com.zte.personalagent"

    .line 14
    .line 15
    const-string v5, "com.zte.aimemory"

    .line 16
    .line 17
    const-string v6, "com.zte.heartyservice"

    .line 18
    .line 19
    const-string v7, "cn.nubia.inspiredwallpaper"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/launcher3/dragndrop/AddItemActivity;->u:[Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "com.jiutian.yidonglingxi"

    .line 28
    .line 29
    filled-new-array {v0}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/android/launcher3/dragndrop/AddItemActivity;->v:[Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "com.zte.personalagent"

    .line 36
    .line 37
    filled-new-array {v0}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/android/launcher3/dragndrop/AddItemActivity;->w:[Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/v;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->s:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->t:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/dragndrop/AddItemActivity;Lcom/android/launcher3/dragndrop/M;)Lz1/Z4;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->n0(Lcom/android/launcher3/dragndrop/M;)Lz1/Z4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c0(Lcom/android/launcher3/dragndrop/AddItemActivity;Ljava/util/function/Supplier;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->m0(Ljava/util/function/Supplier;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d0(Lcom/android/launcher3/dragndrop/AddItemActivity;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->l0(Lz1/Z4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/android/launcher3/dragndrop/AddItemActivity;Lcom/android/launcher3/widget/U;)Lz1/Z4;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->o0(Lcom/android/launcher3/widget/U;)Lz1/Z4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private f0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "AddItemActivity"

    .line 10
    .line 11
    const-string p1, "Request invalid"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lz1/t1;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1, p1}, Lz1/t1;->x(Landroid/appwidget/AppWidgetProviderInfo;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 35
    .line 36
    const-string v1, "appWidgetId"

    .line 37
    .line 38
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept(Landroid/os/Bundle;)Z

    .line 46
    .line 47
    .line 48
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->X0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "com.zte.mifavor.splitscreengroup"

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    const-string p0, "AddItemActivity"

    .line 37
    .line 38
    const-string v0, "Request invalid"

    .line 39
    .line 40
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v1, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lz1/t1;

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {v1, v0, v2}, Lz1/t1;->y(Landroid/content/pm/ShortcutInfo;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept()Z

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method private h0(Ljava/util/function/Supplier;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Lz1/Z4;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/dragndrop/c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/dragndrop/c;-><init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Ljava/util/function/Supplier;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    const v1, 0x7f0b068a

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 13
    .line 14
    const v1, 0x7f0b0686

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/widget/TextView;

    .line 22
    .line 23
    const/high16 v1, -0x1000000

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private j0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->u:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    sget-object p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->v:[Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return v0

    .line 35
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method private k0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->w:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private synthetic l0(Lz1/Z4;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->g(Lz1/Z4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m0(Ljava/util/function/Supplier;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lz1/Z4;

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v1, Lcom/android/launcher3/dragndrop/e;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/dragndrop/e;-><init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Lz1/Z4;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic n0(Lcom/android/launcher3/dragndrop/M;)Lz1/Z4;
    .locals 1

    .line 1
    new-instance v0, Lz1/Z4;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->i:Lcom/android/launcher3/P2;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p1, p0}, Lz1/Z4;-><init>(LD1/i;Ls1/P;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method private synthetic o0(Lcom/android/launcher3/widget/U;)Lz1/Z4;
    .locals 3

    .line 1
    new-instance v0, Lz1/Z4;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->j:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->i:Lcom/android/launcher3/P2;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->i:Lcom/android/launcher3/P2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p1, v1, v2, p0}, Lz1/Z4;-><init>(Lcom/android/launcher3/widget/U;Lcom/android/launcher3/F1;Ls1/P;Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method private p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private q0(Lcom/android/launcher3/model/data/B;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->k0(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->p:Lcom/android/launcher3/widget/Y0;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "needAutoAddWidget: auto add widget request, pkg = "

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "AddItemActivity"

    .line 58
    .line 59
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/widget/l0;->r()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->p:Lcom/android/launcher3/widget/Y0;

    .line 77
    .line 78
    iget v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 79
    .line 80
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 81
    .line 82
    invoke-virtual {v0, v1, p1, v2}, Lcom/android/launcher3/widget/Y0;->c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    iget-object p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 89
    .line 90
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->s0(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p1, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lz1/t1;

    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 108
    .line 109
    invoke-virtual {p1, v0, v1}, Lz1/t1;->x(Landroid/appwidget/AppWidgetProviderInfo;I)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 113
    .line 114
    const-string v0, "appWidgetId"

    .line 115
    .line 116
    iget v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 117
    .line 118
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 124
    .line 125
    invoke-virtual {p1, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept(Landroid/os/Bundle;)Z

    .line 126
    .line 127
    .line 128
    const/4 p0, 0x1

    .line 129
    return p0

    .line 130
    :cond_0
    const/4 p0, 0x0

    .line 131
    return p0
.end method

.method private r0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->u:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private s0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->m:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x4000

    .line 10
    .line 11
    invoke-static {v0}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const v2, 0x7f140051

    .line 24
    .line 25
    .line 26
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v1, v2, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->m:Landroid/view/accessibility/AccessibilityManager;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private u0()Lcom/android/launcher3/model/data/B;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/M;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/dragndrop/M;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Lcom/android/launcher3/widget/y0;

    .line 15
    .line 16
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/y0;-><init>(LD1/i;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/android/launcher3/dragndrop/b;

    .line 33
    .line 34
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/dragndrop/b;-><init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Lcom/android/launcher3/dragndrop/M;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, v1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->h0(Ljava/util/function/Supplier;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method private v0()Lcom/android/launcher3/model/data/B;
    .locals 4

    .line 1
    const v0, 0x7f0b068d

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/WidgetImageView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, -0x2

    .line 15
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f060028

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const v3, 0x7f0704a8

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget v1, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 73
    .line 74
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->j:Lcom/android/launcher3/F1;

    .line 75
    .line 76
    iget v3, v2, Lcom/android/launcher3/F1;->H0:I

    .line 77
    .line 78
    if-gt v1, v3, :cond_1

    .line 79
    .line 80
    iget v1, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 81
    .line 82
    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    .line 83
    .line 84
    if-le v1, v2, :cond_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 88
    .line 89
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 90
    .line 91
    invoke-static {v2}, Lcom/android/launcher3/dragndrop/K;->l(Landroid/content/pm/LauncherApps$PinItemRequest;)Landroid/widget/RemoteViews;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v1, v2}, Lcom/android/launcher3/widget/WidgetCell;->setRemoteViewsPreview(Landroid/widget/RemoteViews;)V

    .line 96
    .line 97
    .line 98
    new-instance v1, Lcom/android/launcher3/widget/Y0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->p:Lcom/android/launcher3/widget/Y0;

    .line 104
    .line 105
    invoke-static {p0}, Lcom/android/launcher3/widget/l0;->L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 110
    .line 111
    new-instance v1, Lcom/android/launcher3/widget/z0;

    .line 112
    .line 113
    const/16 v2, -0x71

    .line 114
    .line 115
    invoke-direct {v1, v0, v2}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->j:Lcom/android/launcher3/F1;

    .line 119
    .line 120
    iget v2, v2, Lcom/android/launcher3/F1;->H0:I

    .line 121
    .line 122
    iget v3, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 123
    .line 124
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iput v2, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 129
    .line 130
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->j:Lcom/android/launcher3/F1;

    .line 131
    .line 132
    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    .line 133
    .line 134
    iget v3, v0, Lcom/android/launcher3/widget/U;->h:I

    .line 135
    .line 136
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iput v2, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 141
    .line 142
    invoke-virtual {v1, p0}, Lcom/android/launcher3/widget/z0;->P(Landroid/content/Context;)Landroid/os/Bundle;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iput-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 147
    .line 148
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 149
    .line 150
    invoke-virtual {v2}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    new-instance v1, Lcom/android/launcher3/dragndrop/a;

    .line 158
    .line 159
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/dragndrop/a;-><init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Lcom/android/launcher3/widget/U;)V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0, v1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->h0(Ljava/util/function/Supplier;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->e()Landroid/os/UserHandle;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-static {p0, v1, v0}, Lz1/u5;->r(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/B;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 179
    return-object p0
.end method


# virtual methods
.method public M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->k:Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForeColor()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_2

    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    const-string p1, "appWidgetId"

    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 9
    .line 10
    invoke-virtual {p3, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 16
    .line 17
    :goto_0
    const/4 p3, -0x1

    .line 18
    if-ne p2, p3, :cond_1

    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->f0(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 27
    .line 28
    .line 29
    iput p3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/v;->onActivityResult(IILandroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->W0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onCancelClick(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->V0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "AddItemActivity"

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p1, "disable add shortcut and widget in concise mode!"

    .line 17
    .line 18
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, LD1/h;->d(Landroid/content/Intent;)Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v2, 0x0

    .line 46
    const/4 v3, 0x1

    .line 47
    const/4 v4, 0x0

    .line 48
    if-ne v0, v3, :cond_4

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    move-object v5, v2

    .line 72
    :goto_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-nez v6, :cond_4

    .line 77
    .line 78
    invoke-direct {p0, v5}, Lcom/android/launcher3/dragndrop/AddItemActivity;->j0(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_4

    .line 83
    .line 84
    new-instance p1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v2, "onCreate: auto add shortcut request, pkg = "

    .line 90
    .line 91
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    sget-object p1, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Lz1/t1;

    .line 111
    .line 112
    invoke-virtual {p1, v0, v4}, Lz1/t1;->y(Landroid/content/pm/ShortcutInfo;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept()Z

    .line 118
    .line 119
    .line 120
    invoke-direct {p0, v5}, Lcom/android/launcher3/dragndrop/AddItemActivity;->r0(Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const v0, 0x7f1400b3

    .line 131
    .line 132
    .line 133
    invoke-static {p1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 138
    .line 139
    .line 140
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->g0()V

    .line 145
    .line 146
    .line 147
    const-string v0, ""

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 153
    .line 154
    const/4 v1, 0x2

    .line 155
    if-eqz v0, :cond_5

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-ne v0, v1, :cond_5

    .line 162
    .line 163
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 164
    .line 165
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v0, v5}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    if-eqz v0, :cond_5

    .line 174
    .line 175
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v0, v5}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 186
    .line 187
    if-eqz v0, :cond_5

    .line 188
    .line 189
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 190
    .line 191
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    invoke-virtual {v0, v5}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 200
    .line 201
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    const-string v5, "com.zte.feature.notification.widget.NotifWidgetProvider"

    .line 206
    .line 207
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_5

    .line 212
    .line 213
    iput-boolean v3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->t:Z

    .line 214
    .line 215
    :cond_5
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->i:Lcom/android/launcher3/P2;

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->j:Lcom/android/launcher3/F1;

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-virtual {v0, v5}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    iput-object v0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 236
    .line 237
    const v0, 0x7f0e003b

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(I)V

    .line 241
    .line 242
    .line 243
    const v0, 0x7f0b0684

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 251
    .line 252
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 253
    .line 254
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/WidgetCell;->e(Lcom/android/launcher3/widget/WidgetCell$c;)V

    .line 255
    .line 256
    .line 257
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->i0()V

    .line 258
    .line 259
    .line 260
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->t:Z

    .line 261
    .line 262
    if-eqz v0, :cond_6

    .line 263
    .line 264
    const v0, 0x7f0b0570

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    const/16 v5, 0x8

    .line 272
    .line 273
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 274
    .line 275
    .line 276
    const v0, 0x7f0b042f

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 284
    .line 285
    .line 286
    :cond_6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    const/16 v5, 0x200

    .line 291
    .line 292
    invoke-virtual {v0, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 293
    .line 294
    .line 295
    const v0, 0x7f0b0071

    .line 296
    .line 297
    .line 298
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer;

    .line 303
    .line 304
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->k:Lcom/android/launcher3/views/BaseDragLayer;

    .line 305
    .line 306
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->recreateControllers()V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    const-class v5, Landroid/view/accessibility/AccessibilityManager;

    .line 314
    .line 315
    invoke-virtual {v0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 320
    .line 321
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->m:Landroid/view/accessibility/AccessibilityManager;

    .line 322
    .line 323
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 324
    .line 325
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-eq v0, v3, :cond_8

    .line 330
    .line 331
    if-eq v0, v1, :cond_7

    .line 332
    .line 333
    move-object v0, v2

    .line 334
    goto :goto_1

    .line 335
    :cond_7
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->v0()Lcom/android/launcher3/model/data/B;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    goto :goto_1

    .line 340
    :cond_8
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->u0()Lcom/android/launcher3/model/data/B;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    :goto_1
    if-nez v0, :cond_9

    .line 345
    .line 346
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    :cond_9
    new-instance v1, Lcom/android/launcher3/util/k;

    .line 351
    .line 352
    iget-object v3, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 353
    .line 354
    iget-object v5, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 355
    .line 356
    invoke-direct {v1, p0, v3, v5}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->h()Landroid/content/pm/ApplicationInfo;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    if-nez v1, :cond_a

    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 366
    .line 367
    .line 368
    return-void

    .line 369
    :cond_a
    invoke-direct {p0, v0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->q0(Lcom/android/launcher3/model/data/B;)Z

    .line 370
    .line 371
    .line 372
    move-result v3

    .line 373
    if-eqz v3, :cond_b

    .line 374
    .line 375
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 376
    .line 377
    .line 378
    return-void

    .line 379
    :cond_b
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 380
    .line 381
    const v5, 0x7f0b068e

    .line 382
    .line 383
    .line 384
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 385
    .line 386
    .line 387
    move-result-object v3

    .line 388
    check-cast v3, Lcom/android/launcher3/widget/WidgetCellPreview;

    .line 389
    .line 390
    invoke-virtual {v3, p0}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {v3, p0}, Landroid/widget/FrameLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 394
    .line 395
    .line 396
    if-nez p1, :cond_c

    .line 397
    .line 398
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->U0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 399
    .line 400
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 401
    .line 402
    .line 403
    :cond_c
    const p1, 0x7f0b0681

    .line 404
    .line 405
    .line 406
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object p1

    .line 410
    check-cast p1, Landroid/widget/TextView;

    .line 411
    .line 412
    iget v3, v0, Lcom/android/launcher3/model/data/B;->l:I

    .line 413
    .line 414
    const/4 v5, -0x1

    .line 415
    if-ne v3, v5, :cond_d

    .line 416
    .line 417
    goto :goto_2

    .line 418
    :cond_d
    invoke-static {p0}, Lcom/android/launcher3/widget/Z0;->a(Landroid/content/Context;)Landroid/util/SparseArray;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    iget v0, v0, Lcom/android/launcher3/model/data/B;->l:I

    .line 423
    .line 424
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    move-object v2, v0

    .line 429
    check-cast v2, Lcom/android/launcher3/widget/Z0$a;

    .line 430
    .line 431
    :goto_2
    if-nez v2, :cond_e

    .line 432
    .line 433
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v1, v0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    goto :goto_3

    .line 442
    :cond_e
    iget v0, v2, Lcom/android/launcher3/widget/Z0$a;->b:I

    .line 443
    .line 444
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    :goto_3
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 449
    .line 450
    .line 451
    const p1, 0x7f0b006f

    .line 452
    .line 453
    .line 454
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    check-cast p1, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 459
    .line 460
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 461
    .line 462
    invoke-virtual {p1, p0}, Lcom/android/launcher3/views/f;->R(Lcom/android/launcher3/views/f$e;)V

    .line 463
    .line 464
    .line 465
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 466
    .line 467
    invoke-virtual {p1}, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;->show()V

    .line 468
    .line 469
    .line 470
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->t0()V

    .line 471
    .line 472
    .line 473
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 474
    .line 475
    .line 476
    move-result p1

    .line 477
    if-eqz p1, :cond_f

    .line 478
    .line 479
    const p1, 0x7f0b069c

    .line 480
    .line 481
    .line 482
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 491
    .line 492
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 493
    .line 494
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 499
    .line 500
    .line 501
    move-result-object v3

    .line 502
    const v5, 0x7f0707f9

    .line 503
    .line 504
    .line 505
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 506
    .line 507
    .line 508
    move-result v3

    .line 509
    invoke-static {v2, v3}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 514
    .line 515
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 516
    .line 517
    .line 518
    move-result-object v5

    .line 519
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 520
    .line 521
    .line 522
    move-result-object v6

    .line 523
    const v7, 0x7f0707c8

    .line 524
    .line 525
    .line 526
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 527
    .line 528
    .line 529
    move-result v6

    .line 530
    invoke-static {v5, v6}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 531
    .line 532
    .line 533
    move-result v5

    .line 534
    invoke-virtual {v0, v1, v2, v3, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 535
    .line 536
    .line 537
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 538
    .line 539
    .line 540
    const p1, 0x7f0b068a

    .line 541
    .line 542
    .line 543
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 544
    .line 545
    .line 546
    move-result-object p1

    .line 547
    check-cast p1, Landroid/widget/TextView;

    .line 548
    .line 549
    const v0, 0x7f0b0686

    .line 550
    .line 551
    .line 552
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    check-cast v0, Landroid/widget/TextView;

    .line 557
    .line 558
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 559
    .line 560
    .line 561
    move-result-object v1

    .line 562
    const v2, 0x7f0707df

    .line 563
    .line 564
    .line 565
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 566
    .line 567
    .line 568
    move-result v1

    .line 569
    int-to-float v1, v1

    .line 570
    invoke-virtual {p1, v4, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 571
    .line 572
    .line 573
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 574
    .line 575
    .line 576
    move-result-object p1

    .line 577
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 578
    .line 579
    .line 580
    move-result p1

    .line 581
    int-to-float p1, p1

    .line 582
    invoke-virtual {v0, v4, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 583
    .line 584
    .line 585
    const p1, 0x7f01002c

    .line 586
    .line 587
    .line 588
    const v0, 0x7f01002e

    .line 589
    .line 590
    .line 591
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 592
    .line 593
    .line 594
    :cond_f
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->y()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 11

    .line 1
    const-string v0, "onLongClick"

    .line 2
    .line 3
    const-string v1, "AddItemActivity"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v4, 0x0

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    return v4

    .line 30
    :cond_0
    if-eqz v2, :cond_1

    .line 31
    .line 32
    new-instance v7, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-interface {v2, v7}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewScale()F

    .line 43
    .line 44
    .line 45
    move-result v10

    .line 46
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getLeft()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 51
    .line 52
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 53
    .line 54
    mul-float/2addr v3, v10

    .line 55
    float-to-int v3, v3

    .line 56
    sub-int/2addr v0, v3

    .line 57
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getTop()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    iget-object v5, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 62
    .line 63
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 64
    .line 65
    mul-float/2addr v5, v10

    .line 66
    float-to-int v5, v5

    .line 67
    sub-int/2addr v3, v5

    .line 68
    invoke-virtual {v7, v0, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 69
    .line 70
    .line 71
    new-instance v5, Lcom/android/launcher3/dragndrop/K;

    .line 72
    .line 73
    iget-object v6, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    invoke-direct/range {v5 .. v10}, Lcom/android/launcher3/dragndrop/K;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/graphics/Rect;IIF)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getBitmapBounds()Landroid/graphics/Rect;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    iget-object v5, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 96
    .line 97
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 98
    .line 99
    float-to-int v5, v5

    .line 100
    sub-int/2addr v3, v5

    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    iget-object v6, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 106
    .line 107
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 108
    .line 109
    float-to-int v6, v6

    .line 110
    sub-int/2addr v5, v6

    .line 111
    invoke-virtual {v2, v3, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 112
    .line 113
    .line 114
    new-instance v5, Lcom/android/launcher3/dragndrop/K;

    .line 115
    .line 116
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-direct {v5, v3, v2, v6, v0}, Lcom/android/launcher3/dragndrop/K;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/graphics/Rect;II)V

    .line 131
    .line 132
    .line 133
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->t:Z

    .line 134
    .line 135
    const/4 v2, 0x1

    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    iput-boolean v2, v5, Lcom/android/launcher3/dragndrop/K;->q:Z

    .line 139
    .line 140
    :cond_2
    new-instance v0, Landroid/content/ClipDescription;

    .line 141
    .line 142
    invoke-virtual {v5}, Lcom/android/launcher3/dragndrop/h;->f()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    filled-new-array {v3}, [Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    const-string v6, ""

    .line 151
    .line 152
    invoke-direct {v0, v6, v3}, Landroid/content/ClipDescription;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    new-instance v3, Landroid/content/ClipData;

    .line 156
    .line 157
    new-instance v7, Landroid/content/ClipData$Item;

    .line 158
    .line 159
    invoke-direct {v7, v6}, Landroid/content/ClipData$Item;-><init>(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    invoke-direct {v3, v0, v7}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 163
    .line 164
    .line 165
    new-instance v0, Lcom/android/launcher3/dragndrop/AddItemActivity$a;

    .line 166
    .line 167
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity$a;-><init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Landroid/view/View;)V

    .line 168
    .line 169
    .line 170
    const/4 v6, 0x0

    .line 171
    const/16 v7, 0x100

    .line 172
    .line 173
    invoke-virtual {p1, v3, v0, v6, v7}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    .line 174
    .line 175
    .line 176
    new-instance p1, Landroid/content/Intent;

    .line 177
    .line 178
    const-string v0, "android.intent.action.MAIN"

    .line 179
    .line 180
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    const-string v0, "android.intent.category.HOME"

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    const/high16 v0, 0x10000000

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 204
    .line 205
    const-string v3, "AddItemActivity.onLongClick"

    .line 206
    .line 207
    invoke-virtual {v0, v5, v3}, Lcom/android/launcher3/util/H;->registerCallback(Lcom/android/launcher3/util/H$b;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    const-string v3, "onLongClick "

    .line 216
    .line 217
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    new-instance v3, Ljava/lang/Throwable;

    .line 221
    .line 222
    const-string v5, "start home activity"

    .line 223
    .line 224
    invoke-direct {v3, v5}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    const v1, 0x7f010010

    .line 246
    .line 247
    .line 248
    invoke-static {v0, v4, v1}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 257
    .line 258
    .line 259
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->Y0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 260
    .line 261
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 262
    .line 263
    .line 264
    iput-boolean v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->s:Z

    .line 265
    .line 266
    return v4
.end method

.method protected onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->s:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/AddItemActivity;->finish()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onPlaceAutomaticallyClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    const-string p0, "AddItemActivity"

    .line 19
    .line 20
    const-string p1, "Request invalid"

    .line 21
    .line 22
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v1, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lz1/t1;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v1, p1, v2}, Lz1/t1;->y(Landroid/content/pm/ShortcutInfo;Z)V

    .line 42
    .line 43
    .line 44
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->X0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 45
    .line 46
    invoke-direct {p0, v1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->p0(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/content/pm/LauncherApps$PinItemRequest;->accept()Z

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getLongLabel()Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    :cond_1
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->s0(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->l:Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/widget/l0;->r()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->p:Lcom/android/launcher3/widget/Y0;

    .line 96
    .line 97
    iget v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 98
    .line 99
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->r:Landroid/os/Bundle;

    .line 100
    .line 101
    invoke-virtual {v1, v2, p1, v3}, Lcom/android/launcher3/widget/Y0;->c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_3

    .line 106
    .line 107
    iget-object p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 108
    .line 109
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->s0(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 113
    .line 114
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/AddItemActivity;->f0(I)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->o:Lcom/android/launcher3/widget/l0;

    .line 119
    .line 120
    iget v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 121
    .line 122
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->h:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 123
    .line 124
    invoke-virtual {v2, p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {p1, p0, v1, v2, v0}, Lcom/android/launcher3/widget/l0;->X(Lcom/android/launcher3/v;ILandroid/appwidget/AppWidgetProviderInfo;I)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "state.widget.id"

    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 13
    .line 14
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const v1, 0x7f060027

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "state.widget.id"

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->q:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->g:Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetCell;->getPreviewContentHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/WidgetCell;->setParentAlignedPreviewHeight(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/AddItemActivity;->n:Lcom/android/launcher3/widget/WidgetCell;

    .line 11
    .line 12
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/dragndrop/d;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/launcher3/dragndrop/d;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected t0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    .line 14
    .line 15
    and-int/lit8 v0, v0, 0x30

    .line 16
    .line 17
    const/16 v1, 0x20

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    move v0, v3

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v2

    .line 26
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    :cond_1
    invoke-virtual {p0, v2, v3}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
