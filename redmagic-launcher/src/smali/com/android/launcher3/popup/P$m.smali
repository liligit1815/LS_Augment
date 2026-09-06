.class Lcom/android/launcher3/popup/P$m;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "m"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/P<",
        "TT;>;"
    }
.end annotation


# instance fields
.field g:Landroid/os/UserHandle;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;Landroid/os/UserHandle;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation

    .line 1
    const v1, 0x7f080d38

    .line 2
    .line 3
    .line 4
    const v2, 0x7f140215

    .line 5
    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v3, p1

    .line 9
    move-object v4, p2

    .line 10
    move-object v5, p3

    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iput-object p4, v0, Lcom/android/launcher3/popup/P$m;->g:Landroid/os/UserHandle;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/util/f;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Lcom/android/launcher3/popup/P$m;->g:Landroid/os/UserHandle;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    invoke-interface {v1, p1, v0, v2}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 52
    .line 53
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->h3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 58
    .line 59
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
