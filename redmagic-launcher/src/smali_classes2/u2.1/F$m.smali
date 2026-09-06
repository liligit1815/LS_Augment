.class public final Lu2/F$m;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/F;->r(Lu2/F$c;Lu2/F$k;Lu2/F$k;Landroid/graphics/drawable/GradientDrawable;Landroid/view/View;Landroid/view/ViewGroupOverlay;Landroid/view/View;Landroid/view/ViewOverlay;ZZZ)Lu2/F$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lu2/F;

.field final synthetic h:Lu2/F$c;

.field final synthetic i:Z

.field final synthetic j:Landroid/graphics/drawable/GradientDrawable;

.field final synthetic k:Landroid/view/ViewGroupOverlay;

.field final synthetic l:Landroid/view/ViewOverlay;

.field final synthetic m:Z


# direct methods
.method constructor <init>(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu2/F$m;->g:Lu2/F;

    .line 2
    .line 3
    iput-object p2, p0, Lu2/F$m;->h:Lu2/F$c;

    .line 4
    .line 5
    iput-boolean p3, p0, Lu2/F$m;->i:Z

    .line 6
    .line 7
    iput-object p4, p0, Lu2/F$m;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    iput-object p5, p0, Lu2/F$m;->k:Landroid/view/ViewGroupOverlay;

    .line 10
    .line 11
    iput-object p6, p0, Lu2/F$m;->l:Landroid/view/ViewOverlay;

    .line 12
    .line 13
    iput-boolean p7, p0, Lu2/F$m;->m:Z

    .line 14
    .line 15
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 8

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lu2/F$m;->g:Lu2/F;

    .line 7
    .line 8
    iget-object v2, p0, Lu2/F$m;->h:Lu2/F$c;

    .line 9
    .line 10
    iget-boolean v3, p0, Lu2/F$m;->i:Z

    .line 11
    .line 12
    iget-object v4, p0, Lu2/F$m;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    iget-object v5, p0, Lu2/F$m;->k:Landroid/view/ViewGroupOverlay;

    .line 15
    .line 16
    iget-object v6, p0, Lu2/F$m;->l:Landroid/view/ViewOverlay;

    .line 17
    .line 18
    iget-boolean v7, p0, Lu2/F$m;->m:Z

    .line 19
    .line 20
    invoke-static/range {v1 .. v7}, Lu2/F;->m(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 6

    .line 1
    const-string p2, "animation"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lu2/F$m;->g:Lu2/F;

    .line 7
    .line 8
    iget-object v1, p0, Lu2/F$m;->h:Lu2/F$c;

    .line 9
    .line 10
    iget-boolean v2, p0, Lu2/F$m;->i:Z

    .line 11
    .line 12
    iget-object v3, p0, Lu2/F$m;->j:Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    iget-object v4, p0, Lu2/F$m;->k:Landroid/view/ViewGroupOverlay;

    .line 15
    .line 16
    iget-object v5, p0, Lu2/F$m;->l:Landroid/view/ViewOverlay;

    .line 17
    .line 18
    invoke-static/range {v0 .. v5}, Lu2/F;->n(Lu2/F;Lu2/F$c;ZLandroid/graphics/drawable/GradientDrawable;Landroid/view/ViewGroupOverlay;Landroid/view/ViewOverlay;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
