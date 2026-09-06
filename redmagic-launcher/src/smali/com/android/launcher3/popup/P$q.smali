.class Lcom/android/launcher3/popup/P$q;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "q"
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
.field g:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;Landroid/content/ComponentName;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Landroid/content/ComponentName;",
            ")V"
        }
    .end annotation

    .line 1
    const v1, 0x7f080d8d

    .line 2
    .line 3
    .line 4
    const v2, 0x7f140464

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
    iput-object p4, v0, Lcom/android/launcher3/popup/P$q;->g:Landroid/content/ComponentName;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/android/launcher3/popup/P$q;->g:Landroid/content/ComponentName;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 11
    .line 12
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/SecondaryDropTarget;->R(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 26
    .line 27
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->k3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 32
    .line 33
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
