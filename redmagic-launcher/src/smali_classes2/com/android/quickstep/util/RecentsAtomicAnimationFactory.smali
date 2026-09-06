.class public Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;
.super Lcom/android/launcher3/statemanager/d$d;
.source "RecentsAtomicAnimationFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTAINER:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        "STATE_TYPE:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/launcher3/statemanager/d$d<",
        "TSTATE_TYPE;>;"
    }
.end annotation


# static fields
.field public static final INDEX_RECENTS_ATTACHED_ALPHA_ANIM:I = 0x2

.field public static final INDEX_RECENTS_FADE_ANIM:I = 0x0

.field public static final INDEX_RECENTS_TRANSLATE_X_ANIM:I = 0x1

.field private static final MY_ANIM_COUNT:I = 0x3


# instance fields
.field protected final mContainer:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TCONTAINER;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTAINER;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/statemanager/d$d;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public varargs createStateElementAnimation(I[F)Landroid/animation/Animator;
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    if-eq p1, v1, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/statemanager/d$d;->createStateElementAnimation(I[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 15
    .line 16
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    new-instance v2, Lcom/android/launcher3/anim/f0;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const p0, 0x3b03126f    # 0.002f

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p0}, Lcom/android/launcher3/anim/f0;->p(F)Lcom/android/launcher3/anim/f0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const v2, 0x3f4ccccd    # 0.8f

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/high16 v2, 0x437a0000    # 250.0f

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p2}, Lcom/android/launcher3/anim/f0;->t([F)Lcom/android/launcher3/anim/f0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-ne p1, v1, :cond_1

    .line 56
    .line 57
    sget-object p1, Lcom/android/quickstep/views/RecentsView;->RUNNING_TASK_ATTACH_ALPHA:Landroid/util/FloatProperty;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    sget-object p1, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 61
    .line 62
    :goto_0
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 68
    .line 69
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 70
    .line 71
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 76
    .line 77
    sget-object p1, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 78
    .line 79
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method
