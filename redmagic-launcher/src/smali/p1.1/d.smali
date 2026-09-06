.class public final synthetic Lp1/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lp1/e;

.field public final synthetic h:Landroid/graphics/Rect;

.field public final synthetic i:F


# direct methods
.method public synthetic constructor <init>(Lp1/e;Landroid/graphics/Rect;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp1/d;->g:Lp1/e;

    .line 5
    .line 6
    iput-object p2, p0, Lp1/d;->h:Landroid/graphics/Rect;

    .line 7
    .line 8
    iput p3, p0, Lp1/d;->i:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lp1/d;->g:Lp1/e;

    .line 2
    .line 3
    iget-object v1, p0, Lp1/d;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget p0, p0, Lp1/d;->i:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lp1/e;->a(Lp1/e;Landroid/graphics/Rect;FLandroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
