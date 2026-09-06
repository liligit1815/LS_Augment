.class public final synthetic Lcom/android/launcher3/anim/e0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/anim/f0;

.field public final synthetic h:Landroid/util/FloatProperty;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/e0;->g:Lcom/android/launcher3/anim/f0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/anim/e0;->h:Landroid/util/FloatProperty;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/anim/e0;->i:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/e0;->g:Lcom/android/launcher3/anim/f0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/anim/e0;->h:Landroid/util/FloatProperty;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/anim/e0;->i:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/anim/f0;->a(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;Landroid/animation/ValueAnimator;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
