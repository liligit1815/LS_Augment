.class public Lcom/android/quickstep/util/RectFSpringAnim$TaskbarHotseatSpringConfig;
.super Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;
.source "RectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskbarHotseatSpringConfig"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;-><init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/F0;)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 p2, 0x1

    .line 10
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->tracking:I

    .line 11
    .line 12
    const p2, 0x7f070bbc

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessX:F

    .line 20
    .line 21
    const p2, 0x7f070bbe

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->stiffnessY:F

    .line 29
    .line 30
    const p2, 0x7f070bbb

    .line 31
    .line 32
    .line 33
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingX:F

    .line 38
    .line 39
    const p2, 0x7f070bbd

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->dampingY:F

    .line 47
    .line 48
    const p2, 0x7f070bba

    .line 49
    .line 50
    .line 51
    invoke-interface {p1, p2}, Lx2/h;->getFloat(I)F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->rectStiffness:F

    .line 56
    .line 57
    return-void
.end method
