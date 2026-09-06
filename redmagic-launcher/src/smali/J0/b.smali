.class public final synthetic LJ0/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public final synthetic a:Landroid/view/animation/Interpolator;

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Landroid/view/animation/Interpolator;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ0/b;->a:Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    iput p2, p0, LJ0/b;->b:F

    .line 7
    .line 8
    iput p3, p0, LJ0/b;->c:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .locals 2

    .line 1
    iget-object v0, p0, LJ0/b;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    iget v1, p0, LJ0/b;->b:F

    .line 4
    .line 5
    iget p0, p0, LJ0/b;->c:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, LJ0/h;->f(Landroid/view/animation/Interpolator;FFF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
