.class Lcom/android/quickstep/views/AllAppsEduView$2;
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
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$2;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

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
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$2;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->O(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView$2;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/views/AllAppsEduView;->Q(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
