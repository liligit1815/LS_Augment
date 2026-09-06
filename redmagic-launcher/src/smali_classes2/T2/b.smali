.class public final synthetic LT2/b;
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

.field public final synthetic n:LT2/c$b;

.field public final synthetic o:LT2/c$c;


# direct methods
.method public synthetic constructor <init>(IILandroid/view/ViewGroup;FFIILT2/c$b;LT2/c$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LT2/b;->g:I

    .line 5
    .line 6
    iput p2, p0, LT2/b;->h:I

    .line 7
    .line 8
    iput-object p3, p0, LT2/b;->i:Landroid/view/ViewGroup;

    .line 9
    .line 10
    iput p4, p0, LT2/b;->j:F

    .line 11
    .line 12
    iput p5, p0, LT2/b;->k:F

    .line 13
    .line 14
    iput p6, p0, LT2/b;->l:I

    .line 15
    .line 16
    iput p7, p0, LT2/b;->m:I

    .line 17
    .line 18
    iput-object p8, p0, LT2/b;->n:LT2/c$b;

    .line 19
    .line 20
    iput-object p9, p0, LT2/b;->o:LT2/c$c;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 10

    .line 1
    iget v0, p0, LT2/b;->g:I

    .line 2
    .line 3
    iget v1, p0, LT2/b;->h:I

    .line 4
    .line 5
    iget-object v2, p0, LT2/b;->i:Landroid/view/ViewGroup;

    .line 6
    .line 7
    iget v3, p0, LT2/b;->j:F

    .line 8
    .line 9
    iget v4, p0, LT2/b;->k:F

    .line 10
    .line 11
    iget v5, p0, LT2/b;->l:I

    .line 12
    .line 13
    iget v6, p0, LT2/b;->m:I

    .line 14
    .line 15
    iget-object v7, p0, LT2/b;->n:LT2/c$b;

    .line 16
    .line 17
    iget-object v8, p0, LT2/b;->o:LT2/c$c;

    .line 18
    .line 19
    move-object v9, p1

    .line 20
    invoke-static/range {v0 .. v9}, LT2/c;->b(IILandroid/view/ViewGroup;FFIILT2/c$b;LT2/c$c;Landroid/animation/ValueAnimator;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
