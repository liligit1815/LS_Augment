.class public Lcom/android/launcher3/popup/d;
.super Lcom/android/launcher3/popup/o;
.source "LauncherPopupLiveUpdateHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/o<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow<",
            "Lcom/android/launcher3/C2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/popup/o;-><init>(Landroid/content/Context;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/o;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getOriginalIcon()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/popup/P;->WIDGETS:Lcom/android/launcher3/popup/P$i;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/popup/o;->g:Landroid/content/Context;

    .line 10
    .line 11
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    invoke-interface {v1, p0, v2, v0}, Lcom/android/launcher3/popup/P$i;->a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 20
    .line 21
    .line 22
    return-void
.end method
