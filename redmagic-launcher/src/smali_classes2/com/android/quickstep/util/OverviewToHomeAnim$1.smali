.class Lcom/android/quickstep/util/OverviewToHomeAnim$1;
.super Lcom/android/launcher3/anim/g;
.source "OverviewToHomeAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/OverviewToHomeAnim;->animateWithVelocity(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/OverviewToHomeAnim;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/OverviewToHomeAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim$1;->this$0:Lcom/android/quickstep/util/OverviewToHomeAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/OverviewToHomeAnim$1;->this$0:Lcom/android/quickstep/util/OverviewToHomeAnim;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/android/quickstep/util/OverviewToHomeAnim;->a(Lcom/android/quickstep/util/OverviewToHomeAnim;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/OverviewToHomeAnim$1;->this$0:Lcom/android/quickstep/util/OverviewToHomeAnim;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/quickstep/util/OverviewToHomeAnim;->c(Lcom/android/quickstep/util/OverviewToHomeAnim;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
