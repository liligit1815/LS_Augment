.class public final synthetic Lcom/android/quickstep/util/q1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"


# direct methods
.method public static synthetic a(FFF)I
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-int/lit8 p0, p0, 0x1f

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Float;->hashCode(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    add-int/2addr p0, p1

    .line 12
    mul-int/lit8 p0, p0, 0x1f

    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/Float;->hashCode(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    add-int/2addr p0, p1

    .line 19
    return p0
.end method
