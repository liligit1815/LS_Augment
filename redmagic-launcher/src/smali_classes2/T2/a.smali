.class public final synthetic LT2/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:I

.field public final synthetic i:Landroid/view/ViewGroup;

.field public final synthetic j:F

.field public final synthetic k:F

.field public final synthetic l:I

.field public final synthetic m:I


# direct methods
.method public synthetic constructor <init>(IILandroid/view/ViewGroup;FFII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LT2/a;->g:I

    .line 5
    .line 6
    iput p2, p0, LT2/a;->h:I

    .line 7
    .line 8
    iput-object p3, p0, LT2/a;->i:Landroid/view/ViewGroup;

    .line 9
    .line 10
    iput p4, p0, LT2/a;->j:F

    .line 11
    .line 12
    iput p5, p0, LT2/a;->k:F

    .line 13
    .line 14
    iput p6, p0, LT2/a;->l:I

    .line 15
    .line 16
    iput p7, p0, LT2/a;->m:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    iget v0, p0, LT2/a;->g:I

    .line 2
    .line 3
    iget v1, p0, LT2/a;->h:I

    .line 4
    .line 5
    iget-object v2, p0, LT2/a;->i:Landroid/view/ViewGroup;

    .line 6
    .line 7
    iget v3, p0, LT2/a;->j:F

    .line 8
    .line 9
    iget v4, p0, LT2/a;->k:F

    .line 10
    .line 11
    iget v5, p0, LT2/a;->l:I

    .line 12
    .line 13
    iget v6, p0, LT2/a;->m:I

    .line 14
    .line 15
    move-object v7, p1

    .line 16
    invoke-static/range {v0 .. v7}, LT2/c;->a(IILandroid/view/ViewGroup;FFIILandroid/animation/ValueAnimator;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
