.class public abstract Lv1/a;
.super Lcom/android/launcher3/keyboard/a;
.source "FocusIndicatorHelper.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv1/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/keyboard/a<",
        "Landroid/view/View;",
        ">;",
        "Landroid/view/View$OnFocusChangeListener;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->k1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [I

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const v4, 0x7f0402e2

    .line 23
    .line 24
    .line 25
    invoke-static {v3, v4}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    aput v3, v0, v2

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f0402e1

    .line 36
    .line 37
    .line 38
    invoke-static {v2, v3}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    aput v2, v0, v1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-array v0, v1, [I

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const v3, 0x7f060208

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    aput v1, v0, v2

    .line 59
    .line 60
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/keyboard/a;-><init>(Landroid/view/View;[I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method protected n(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/keyboard/a;->d(Ljava/lang/Object;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
