.class Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "NoButtonQuickSwitchTouchController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/touchcontrollers/v;->a(Landroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/uioverrides/touchcontrollers/v;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/v;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/v;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->j(Lcom/android/launcher3/uioverrides/touchcontrollers/v;Lcom/android/launcher3/V3;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/v$b;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/v;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;->i(Lcom/android/launcher3/uioverrides/touchcontrollers/v;)Lcom/android/quickstep/views/RecentsView;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->startIconFadeInOnGestureComplete()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
