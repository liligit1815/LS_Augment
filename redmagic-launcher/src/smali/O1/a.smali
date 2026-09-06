.class public abstract LO1/a;
.super Lcom/android/launcher3/popup/P;
.source "SplitShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/P<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/util/y2$b;

.field private final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILandroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/util/y2$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IITT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Lcom/android/launcher3/util/y2$b;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "position"

    .line 2
    .line 3
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p3, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iput-object p6, p0, LO1/a;->g:Lcom/android/launcher3/util/y2$b;

    .line 12
    .line 13
    const-string p1, "SplitShortcut"

    .line 14
    .line 15
    iput-object p1, p0, LO1/a;->h:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method protected final J()Lcom/android/launcher3/util/y2$b;
    .locals 0

    .line 1
    iget-object p0, p0, LO1/a;->g:Lcom/android/launcher3/util/y2$b;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final K()Lcom/android/launcher3/util/y2$c;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 10
    .line 11
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 14
    .line 15
    :goto_0
    move-object v5, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 22
    .line 23
    iget-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 24
    .line 25
    iget-object v1, v1, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    iget-object v0, p0, LO1/a;->g:Lcom/android/launcher3/util/y2$b;

    .line 31
    .line 32
    iget v0, v0, Lcom/android/launcher3/util/y2$b;->c:I

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/util/y2;->a(I)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    new-instance v2, Lcom/android/launcher3/util/y2$c;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 41
    .line 42
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    .line 43
    .line 44
    invoke-direct {v4, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 45
    .line 46
    .line 47
    iget-object v6, p0, LO1/a;->g:Lcom/android/launcher3/util/y2$b;

    .line 48
    .line 49
    iget-object v7, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 50
    .line 51
    invoke-direct/range {v2 .. v8}, Lcom/android/launcher3/util/y2$c;-><init>(Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/content/Intent;Lcom/android/launcher3/util/y2$b;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 52
    .line 53
    .line 54
    return-object v2

    .line 55
    :cond_1
    iget-object p0, p0, LO1/a;->h:Ljava/lang/String;

    .line 56
    .line 57
    const-string v0, "unknown item type"

    .line 58
    .line 59
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, LO1/a;->K()Lcom/android/launcher3/util/y2$c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p0, "QuickstepSystemShortcut"

    .line 8
    .line 9
    const-string p1, "no split selection source"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/k;->startSplitSelection(Lcom/android/launcher3/util/y2$c;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
