.class public Lv/d$d;
.super Lv/d;
.source "ViewTimeCycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lv/d;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i(Landroid/view/View;FJLr/d;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lr/l;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/view/View;Lr/d;FJDD)Z
    .locals 2

    .line 1
    move-wide v0, p4

    .line 2
    move-object p4, p1

    .line 3
    move-object p5, p2

    .line 4
    move p1, p3

    .line 5
    move-wide p2, v0

    .line 6
    invoke-virtual/range {p0 .. p5}, Lv/d;->f(FJLandroid/view/View;Lr/d;)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p8, p9, p6, p7}, Ljava/lang/Math;->atan2(DD)D

    .line 11
    .line 12
    .line 13
    move-result-wide p2

    .line 14
    invoke-static {p2, p3}, Ljava/lang/Math;->toDegrees(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide p2

    .line 18
    double-to-float p2, p2

    .line 19
    add-float/2addr p1, p2

    .line 20
    invoke-virtual {p4, p1}, Landroid/view/View;->setRotation(F)V

    .line 21
    .line 22
    .line 23
    iget-boolean p0, p0, Lr/l;->h:Z

    .line 24
    .line 25
    return p0
.end method
