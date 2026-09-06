.class public Lq3/j;
.super Lq3/d;
.source "RoundedCornerTreatment.java"


# instance fields
.field a:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lq3/d;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lq3/j;->a:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lq3/m;FFF)V
    .locals 7

    .line 1
    mul-float p0, p4, p3

    .line 2
    .line 3
    const/high16 v0, 0x43340000    # 180.0f

    .line 4
    .line 5
    sub-float v1, v0, p2

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1, v2, p0, v0, v1}, Lq3/m;->o(FFFF)V

    .line 9
    .line 10
    .line 11
    const/high16 p0, 0x40000000    # 2.0f

    .line 12
    .line 13
    mul-float/2addr p4, p0

    .line 14
    mul-float v3, p4, p3

    .line 15
    .line 16
    const/high16 v5, 0x43340000    # 180.0f

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v4, v3

    .line 20
    move-object v0, p1

    .line 21
    move v6, p2

    .line 22
    invoke-virtual/range {v0 .. v6}, Lq3/m;->a(FFFFFF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
