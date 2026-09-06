.class public final Lcom/android/launcher3/util/H2;
.super Ljava/lang/Object;
.source "TouchUtil.java"


# direct methods
.method public static a(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x2002

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/MotionEvent;->isFromSource(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getButtonState()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    and-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method
