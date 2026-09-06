.class Lv/d$h;
.super Lv/d;
.source "ViewTimeCycle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "h"
.end annotation


# direct methods
.method constructor <init>()V
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
    .locals 2

    .line 1
    move-wide v0, p3

    .line 2
    move-object p4, p1

    .line 3
    move p1, p2

    .line 4
    move-wide p2, v0

    .line 5
    invoke-virtual/range {p0 .. p5}, Lv/d;->f(FJLandroid/view/View;Lr/d;)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p4, p1}, Landroid/view/View;->setRotationY(F)V

    .line 10
    .line 11
    .line 12
    iget-boolean p0, p0, Lr/l;->h:Z

    .line 13
    .line 14
    return p0
.end method
