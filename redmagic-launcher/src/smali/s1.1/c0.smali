.class public final synthetic Ls1/c0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:Landroid/graphics/drawable/Drawable;


# direct methods
.method public synthetic constructor <init>(ILandroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ls1/c0;->g:I

    .line 5
    .line 6
    iput-object p2, p0, Ls1/c0;->h:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget v0, p0, Ls1/c0;->g:I

    .line 2
    .line 3
    iget-object p0, p0, Ls1/c0;->h:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ls1/d0;->v(ILandroid/graphics/drawable/Drawable;Landroid/animation/ValueAnimator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
