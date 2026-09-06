.class LJ0/h$a;
.super Ljava/lang/Object;
.source "Interpolators.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ0/h;
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
    .locals 2

    .line 1
    sget-object p0, LJ0/h;->N:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sget-object v0, LJ0/h;->Y:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float p1, v1, p1

    .line 8
    .line 9
    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sub-float/2addr v1, p1

    .line 14
    invoke-interface {p0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method
