.class public final synthetic LJ0/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public final synthetic a:Landroid/view/animation/Interpolator;


# direct methods
.method public synthetic constructor <init>(Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ0/d;->a:Landroid/view/animation/Interpolator;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .locals 0

    .line 1
    iget-object p0, p0, LJ0/d;->a:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-static {p0, p1}, LJ0/h;->c(Landroid/view/animation/Interpolator;F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
