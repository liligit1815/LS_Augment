.class Lcom/android/launcher3/q5$m;
.super Landroid/animation/AnimatorListenerAdapter;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->U([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;FZ)Lcom/android/quickstep/util/BackAnimState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$m;->g:Lcom/android/launcher3/q5;

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
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/q5$m;->g:Lcom/android/launcher3/q5;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    const-string p1, "TAPL_WALLPAPER_OPEN_ANIMATION_FINISHED"

    .line 9
    .line 10
    invoke-static {p0, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendTestProtocolEventToTest(Landroid/content/Context;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
