.class Lcom/android/launcher3/anim/P$e;
.super Lcom/android/launcher3/anim/U;
.source "MFVLauncherAppTransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/P;->p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Lcom/android/launcher3/anim/P;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/P;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/P$e;->h:Lcom/android/launcher3/anim/P;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/P$e;->g:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/U;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/anim/P$e;->h:Lcom/android/launcher3/anim/P;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 6
    .line 7
    .line 8
    return-void
.end method
