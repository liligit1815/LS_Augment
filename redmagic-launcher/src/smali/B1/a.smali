.class public final synthetic LB1/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/oneshot/OneShotLayout;

.field public final synthetic h:I

.field public final synthetic i:F

.field public final synthetic j:I

.field public final synthetic k:Landroid/widget/ImageView;

.field public final synthetic l:Z

.field public final synthetic m:Landroid/widget/ImageView;

.field public final synthetic n:I

.field public final synthetic o:I

.field public final synthetic p:F

.field public final synthetic q:I

.field public final synthetic r:Z

.field public final synthetic s:Z

.field public final synthetic t:Lcom/android/launcher3/oneshot/TransparentBorderView;

.field public final synthetic u:Lcom/android/launcher3/oneshot/TransparentBorderView;

.field public final synthetic v:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/oneshot/OneShotLayout;IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LB1/a;->g:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 5
    .line 6
    iput p2, p0, LB1/a;->h:I

    .line 7
    .line 8
    iput p3, p0, LB1/a;->i:F

    .line 9
    .line 10
    iput p4, p0, LB1/a;->j:I

    .line 11
    .line 12
    iput-object p5, p0, LB1/a;->k:Landroid/widget/ImageView;

    .line 13
    .line 14
    iput-boolean p6, p0, LB1/a;->l:Z

    .line 15
    .line 16
    iput-object p7, p0, LB1/a;->m:Landroid/widget/ImageView;

    .line 17
    .line 18
    iput p8, p0, LB1/a;->n:I

    .line 19
    .line 20
    iput p9, p0, LB1/a;->o:I

    .line 21
    .line 22
    iput p10, p0, LB1/a;->p:F

    .line 23
    .line 24
    iput p11, p0, LB1/a;->q:I

    .line 25
    .line 26
    iput-boolean p12, p0, LB1/a;->r:Z

    .line 27
    .line 28
    iput-boolean p13, p0, LB1/a;->s:Z

    .line 29
    .line 30
    iput-object p14, p0, LB1/a;->t:Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 31
    .line 32
    iput-object p15, p0, LB1/a;->u:Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 33
    .line 34
    move-object/from16 p1, p16

    .line 35
    .line 36
    iput-object p1, p0, LB1/a;->v:Landroid/widget/ImageView;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, LB1/a;->g:Lcom/android/launcher3/oneshot/OneShotLayout;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget v1, v0, LB1/a;->h:I

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget v2, v0, LB1/a;->i:F

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget v3, v0, LB1/a;->j:I

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, v0, LB1/a;->k:Landroid/widget/ImageView;

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget-boolean v5, v0, LB1/a;->l:Z

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget-object v6, v0, LB1/a;->m:Landroid/widget/ImageView;

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget v7, v0, LB1/a;->n:I

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget v8, v0, LB1/a;->o:I

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget v9, v0, LB1/a;->p:F

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget v10, v0, LB1/a;->q:I

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget-boolean v11, v0, LB1/a;->r:Z

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget-boolean v12, v0, LB1/a;->s:Z

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget-object v13, v0, LB1/a;->t:Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 43
    .line 44
    move-object v15, v14

    .line 45
    iget-object v14, v0, LB1/a;->u:Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 46
    .line 47
    iget-object v0, v0, LB1/a;->v:Landroid/widget/ImageView;

    .line 48
    .line 49
    move-object/from16 v16, v15

    .line 50
    .line 51
    move-object v15, v0

    .line 52
    move-object/from16 v0, v16

    .line 53
    .line 54
    move-object/from16 v16, p1

    .line 55
    .line 56
    invoke-static/range {v0 .. v16}, Lcom/android/launcher3/oneshot/OneShotLayout;->a(Lcom/android/launcher3/oneshot/OneShotLayout;IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;Landroid/animation/ValueAnimator;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
