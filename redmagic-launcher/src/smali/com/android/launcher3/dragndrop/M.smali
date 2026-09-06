.class public Lcom/android/launcher3/dragndrop/M;
.super LD1/i;
.source "PinShortcutRequestActivityInfo.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation


# instance fields
.field private final j:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Landroid/content/pm/LauncherApps$PinItemRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Landroid/content/pm/ShortcutInfo;

.field private final l:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    move-result-object v0

    new-instance v1, Lcom/android/launcher3/dragndrop/L;

    invoke-direct {v1, p1}, Lcom/android/launcher3/dragndrop/L;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;)V

    invoke-direct {p0, v0, v1, p2}, Lcom/android/launcher3/dragndrop/M;-><init>(Landroid/content/pm/ShortcutInfo;Ljava/util/function/Supplier;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Ljava/util/function/Supplier;Landroid/content/Context;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/ShortcutInfo;",
            "Ljava/util/function/Supplier<",
            "Landroid/content/pm/LauncherApps$PinItemRequest;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 2
    new-instance v0, Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "pinned-shortcut"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v1

    .line 4
    invoke-direct {p0, v0, v1, p3}, LD1/i;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)V

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/M;->j:Ljava/util/function/Supplier;

    .line 6
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/M;->k:Landroid/content/pm/ShortcutInfo;

    .line 7
    iput-object p3, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    return-void
.end method

.method public static synthetic k(Landroid/content/pm/LauncherApps$PinItemRequest;)Landroid/content/pm/LauncherApps$PinItemRequest;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public c()Lcom/android/launcher3/model/data/I;
    .locals 4

    .line 1
    sget-object v0, Lf1/a;->b:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-long v0, v0

    .line 26
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const v3, 0x7f0c002f

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-int/lit16 v2, v2, 0x1f4

    .line 40
    .line 41
    int-to-long v2, v2

    .line 42
    add-long/2addr v2, v0

    .line 43
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/M;->j:Ljava/util/function/Supplier;

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 52
    .line 53
    invoke-static {v0, p0, v2, v3}, LD1/h;->c(Landroid/content/Context;Landroid/content/pm/LauncherApps$PinItemRequest;J)Lcom/android/launcher3/model/data/I;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/M;->k:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Lt1/f;)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/M;->k:Landroid/content/pm/ShortcutInfo;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget v2, v2, Lcom/android/launcher3/F1;->O0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/LauncherApps;->getShortcutIconDrawable(Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/M;->l:Landroid/content/Context;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    return-object v0
.end method

.method public j(Landroid/app/Activity;I)Z
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/A2;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/util/A2;-><init>(Landroid/app/Activity;I)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/M;->j:Ljava/util/function/Supplier;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/os/Parcelable;

    .line 18
    .line 19
    const-string v1, "android.content.pm.extra.PIN_ITEM_REQUEST"

    .line 20
    .line 21
    invoke-virtual {p2, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p2, -0x1

    .line 26
    invoke-virtual {v0, p1, p2, p0}, Lcom/android/launcher3/util/A2;->a(Landroid/content/Context;ILandroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0
.end method
