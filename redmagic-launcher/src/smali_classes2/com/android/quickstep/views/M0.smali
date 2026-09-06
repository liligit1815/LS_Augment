.class public final synthetic Lcom/android/quickstep/views/M0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:Lcom/android/launcher3/anim/V;

.field public final synthetic c:Lcom/android/quickstep/util/SplitAnimationTimings;

.field public final synthetic d:Landroid/view/animation/Interpolator;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/anim/V;Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/M0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/M0;->b:Lcom/android/launcher3/anim/V;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/M0;->c:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/M0;->d:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/M0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/M0;->b:Lcom/android/launcher3/anim/V;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/M0;->c:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/views/M0;->d:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    check-cast v4, Ljava/lang/Integer;

    .line 11
    .line 12
    move-object v5, p2

    .line 13
    check-cast v5, Lcom/android/quickstep/views/TaskView;

    .line 14
    .line 15
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/views/RecentsView;->w0(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/anim/V;Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/view/animation/Interpolator;Ljava/lang/Integer;Lcom/android/quickstep/views/TaskView;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
