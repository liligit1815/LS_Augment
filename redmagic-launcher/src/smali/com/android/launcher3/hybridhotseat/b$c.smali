.class Lcom/android/launcher3/hybridhotseat/b$c;
.super Lcom/android/launcher3/popup/P;
.source "HotseatPredictionController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/hybridhotseat/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/hybridhotseat/b;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 6

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$c;->g:Lcom/android/launcher3/hybridhotseat/b;

    const v1, 0x7f080d58

    const v2, 0x7f1402fd

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 3
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lq1/m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/hybridhotseat/b$c;-><init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$c;->g:Lcom/android/launcher3/hybridhotseat/b;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/hybridhotseat/b;->G(Lcom/android/launcher3/model/data/y;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
