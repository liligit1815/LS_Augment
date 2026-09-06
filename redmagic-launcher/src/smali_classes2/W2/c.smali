.class public LW2/c;
.super Ljava/lang/Object;
.source "OrigamiValueConverter.java"


# direct methods
.method public static a(D)D
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v2, p0, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    const-wide/high16 v0, 0x4020000000000000L    # 8.0

    .line 9
    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide/high16 v0, 0x4008000000000000L    # 3.0

    .line 12
    .line 13
    mul-double/2addr p0, v0

    .line 14
    const-wide/high16 v0, 0x4039000000000000L    # 25.0

    .line 15
    .line 16
    add-double/2addr p0, v0

    .line 17
    return-wide p0
.end method

.method public static b(D)D
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v2, p0, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    const-wide/high16 v0, 0x403e000000000000L    # 30.0

    .line 9
    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide v0, 0x400cf5c28f5c28f6L    # 3.62

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    mul-double/2addr p0, v0

    .line 17
    const-wide v0, 0x4068400000000000L    # 194.0

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    add-double/2addr p0, v0

    .line 23
    return-wide p0
.end method
