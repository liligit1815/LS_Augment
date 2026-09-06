.class public final synthetic LP1/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:LP1/h;

.field public final synthetic h:F

.field public final synthetic i:F


# direct methods
.method public synthetic constructor <init>(LP1/h;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/a;->g:LP1/h;

    .line 5
    .line 6
    iput p2, p0, LP1/a;->h:F

    .line 7
    .line 8
    iput p3, p0, LP1/a;->i:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, LP1/a;->g:LP1/h;

    .line 2
    .line 3
    iget v1, p0, LP1/a;->h:F

    .line 4
    .line 5
    iget p0, p0, LP1/a;->i:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, LP1/h;->d(LP1/h;FFLandroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
