.class public final synthetic LT0/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:LT0/p;

.field public final synthetic h:F

.field public final synthetic i:F

.field public final synthetic j:F

.field public final synthetic k:F

.field public final synthetic l:F

.field public final synthetic m:F


# direct methods
.method public synthetic constructor <init>(LT0/p;FFFFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT0/j;->g:LT0/p;

    .line 5
    .line 6
    iput p2, p0, LT0/j;->h:F

    .line 7
    .line 8
    iput p3, p0, LT0/j;->i:F

    .line 9
    .line 10
    iput p4, p0, LT0/j;->j:F

    .line 11
    .line 12
    iput p5, p0, LT0/j;->k:F

    .line 13
    .line 14
    iput p6, p0, LT0/j;->l:F

    .line 15
    .line 16
    iput p7, p0, LT0/j;->m:F

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    iget-object v0, p0, LT0/j;->g:LT0/p;

    .line 2
    .line 3
    iget v1, p0, LT0/j;->h:F

    .line 4
    .line 5
    iget v2, p0, LT0/j;->i:F

    .line 6
    .line 7
    iget v3, p0, LT0/j;->j:F

    .line 8
    .line 9
    iget v4, p0, LT0/j;->k:F

    .line 10
    .line 11
    iget v5, p0, LT0/j;->l:F

    .line 12
    .line 13
    iget v6, p0, LT0/j;->m:F

    .line 14
    .line 15
    move-object v7, p1

    .line 16
    invoke-static/range {v0 .. v7}, LT0/p;->w(LT0/p;FFFFFFLandroid/animation/ValueAnimator;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
