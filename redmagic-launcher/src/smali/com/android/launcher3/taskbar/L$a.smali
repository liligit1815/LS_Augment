.class Lcom/android/launcher3/taskbar/L$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "KeyboardQuickSwitchViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/L;->k(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/L;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/L;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/L$a;->g:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/L$a;->g:Lcom/android/launcher3/taskbar/L;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/taskbar/L;->h(Lcom/android/launcher3/taskbar/L;)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/16 p1, 0x72

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
