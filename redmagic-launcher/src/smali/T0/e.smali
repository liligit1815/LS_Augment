.class public final synthetic LT0/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:LT0/p;

.field public final synthetic h:Lcom/android/launcher3/BubbleTextView;

.field public final synthetic i:Landroid/graphics/Paint;

.field public final synthetic j:Z

.field public final synthetic k:I

.field public final synthetic l:[I


# direct methods
.method public synthetic constructor <init>(LT0/p;Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT0/e;->g:LT0/p;

    .line 5
    .line 6
    iput-object p2, p0, LT0/e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    iput-object p3, p0, LT0/e;->i:Landroid/graphics/Paint;

    .line 9
    .line 10
    iput-boolean p4, p0, LT0/e;->j:Z

    .line 11
    .line 12
    iput p5, p0, LT0/e;->k:I

    .line 13
    .line 14
    iput-object p6, p0, LT0/e;->l:[I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    iget-object v0, p0, LT0/e;->g:LT0/p;

    .line 2
    .line 3
    iget-object v1, p0, LT0/e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    iget-object v2, p0, LT0/e;->i:Landroid/graphics/Paint;

    .line 6
    .line 7
    iget-boolean v3, p0, LT0/e;->j:Z

    .line 8
    .line 9
    iget v4, p0, LT0/e;->k:I

    .line 10
    .line 11
    iget-object v5, p0, LT0/e;->l:[I

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    invoke-static/range {v0 .. v6}, LT0/p;->u(LT0/p;Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[ILandroid/animation/ValueAnimator;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
