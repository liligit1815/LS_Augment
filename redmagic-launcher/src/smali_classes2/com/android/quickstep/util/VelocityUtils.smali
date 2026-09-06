.class public Lcom/android/quickstep/util/VelocityUtils;
.super Ljava/lang/Object;
.source "VelocityUtils.java"


# static fields
.field public static final PX_PER_MS:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static limitVelocity(FF)F
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    cmpg-float v0, v0, p1

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p1, p0}, Ljava/lang/Math;->copySign(FF)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method
