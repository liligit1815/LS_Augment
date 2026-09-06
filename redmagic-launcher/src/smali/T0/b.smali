.class public final synthetic LT0/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:LT0/p;

.field public final synthetic h:F

.field public final synthetic i:Lcom/android/launcher3/C2;

.field public final synthetic j:F

.field public final synthetic k:F

.field public final synthetic l:F

.field public final synthetic m:F

.field public final synthetic n:F

.field public final synthetic o:F

.field public final synthetic p:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(LT0/p;FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT0/b;->g:LT0/p;

    .line 5
    .line 6
    iput p2, p0, LT0/b;->h:F

    .line 7
    .line 8
    iput-object p3, p0, LT0/b;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iput p4, p0, LT0/b;->j:F

    .line 11
    .line 12
    iput p5, p0, LT0/b;->k:F

    .line 13
    .line 14
    iput p6, p0, LT0/b;->l:F

    .line 15
    .line 16
    iput p7, p0, LT0/b;->m:F

    .line 17
    .line 18
    iput p8, p0, LT0/b;->n:F

    .line 19
    .line 20
    iput p9, p0, LT0/b;->o:F

    .line 21
    .line 22
    iput-object p10, p0, LT0/b;->p:Landroid/view/View;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 11

    .line 1
    iget-object v0, p0, LT0/b;->g:LT0/p;

    .line 2
    .line 3
    iget v1, p0, LT0/b;->h:F

    .line 4
    .line 5
    iget-object v2, p0, LT0/b;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget v3, p0, LT0/b;->j:F

    .line 8
    .line 9
    iget v4, p0, LT0/b;->k:F

    .line 10
    .line 11
    iget v5, p0, LT0/b;->l:F

    .line 12
    .line 13
    iget v6, p0, LT0/b;->m:F

    .line 14
    .line 15
    iget v7, p0, LT0/b;->n:F

    .line 16
    .line 17
    iget v8, p0, LT0/b;->o:F

    .line 18
    .line 19
    iget-object v9, p0, LT0/b;->p:Landroid/view/View;

    .line 20
    .line 21
    move-object v10, p1

    .line 22
    invoke-static/range {v0 .. v10}, LT0/p;->x(LT0/p;FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;Landroid/animation/ValueAnimator;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
