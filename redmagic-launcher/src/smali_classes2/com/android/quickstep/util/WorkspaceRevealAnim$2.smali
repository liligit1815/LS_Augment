.class Lcom/android/quickstep/util/WorkspaceRevealAnim$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "WorkspaceRevealAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/WorkspaceRevealAnim;->addRevealAnimatorsForView(Landroid/view/View;Landroid/util/FloatProperty;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$scaleProperty:Landroid/util/FloatProperty;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/WorkspaceRevealAnim;Landroid/util/FloatProperty;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;->val$scaleProperty:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;->val$v:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;->val$scaleProperty:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;->val$v:Landroid/view/View;

    .line 4
    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p1, v0, v2}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/WorkspaceRevealAnim$2;->val$v:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
