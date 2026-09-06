.class Lcom/android/quickstep/views/AllAppsEduView$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AllAppsEduView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/AllAppsEduView;->playAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/AllAppsEduView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/AllAppsEduView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$3;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$3;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/quickstep/views/AllAppsEduView;->S(Lcom/android/quickstep/views/AllAppsEduView;Landroid/animation/AnimatorSet;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$3;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->R(Lcom/android/quickstep/views/AllAppsEduView;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView$3;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/AllAppsEduView;->handleClose(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
