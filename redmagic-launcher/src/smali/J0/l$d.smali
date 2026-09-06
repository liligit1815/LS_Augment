.class LJ0/l$d;
.super Ljava/lang/Object;
.source "InterpolatorsAndroidX.java"

# interfaces
.implements Ly/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ0/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 1

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p1, p0

    .line 4
    mul-float v0, p1, p1

    .line 5
    .line 6
    mul-float/2addr v0, p1

    .line 7
    add-float/2addr v0, p0

    .line 8
    return v0
.end method
