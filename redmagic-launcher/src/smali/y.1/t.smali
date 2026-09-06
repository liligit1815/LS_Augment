.class public Ly/t;
.super Ljava/lang/Object;
.source "OvershootInterpolator.java"

# interfaces
.implements Ly/n;


# instance fields
.field private final a:F


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ly/t;->a:F

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    mul-float v1, p1, p1

    .line 5
    .line 6
    iget p0, p0, Ly/t;->a:F

    .line 7
    .line 8
    add-float v2, p0, v0

    .line 9
    .line 10
    mul-float/2addr v2, p1

    .line 11
    add-float/2addr v2, p0

    .line 12
    mul-float/2addr v1, v2

    .line 13
    add-float/2addr v1, v0

    .line 14
    return v1
.end method
