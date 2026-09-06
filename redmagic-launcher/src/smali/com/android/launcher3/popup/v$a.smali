.class public Lcom/android/launcher3/popup/v$a;
.super LO1/a;
.source "QuickstepSystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LO1/a<",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;)V
    .locals 7

    .line 1
    iget v1, p4, Lcom/android/launcher3/util/y2$b;->a:I

    .line 2
    .line 3
    iget v2, p4, Lcom/android/launcher3/util/y2$b;->b:I

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v5, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v0 .. v6}, LO1/a;-><init>(IILandroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
