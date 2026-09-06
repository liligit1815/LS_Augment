.class Lcom/android/quickstep/interaction/TutorialFragment$3;
.super Ljava/lang/Object;
.source "TutorialFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/TutorialFragment;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/TutorialFragment;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/TutorialFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialFragment$3;->this$0:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/TutorialFragment$3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/interaction/TutorialFragment$3;->lambda$onGlobalLayout$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onGlobalLayout$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialFragment$3;->this$0:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialFragment;->mTutorialType:Lcom/android/quickstep/interaction/TutorialController$TutorialType;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/interaction/TutorialFragment;->changeController(Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialFragment$3;->this$0:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/interaction/Q;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/interaction/Q;-><init>(Lcom/android/quickstep/interaction/TutorialFragment$3;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/quickstep/interaction/TutorialFragment;->o(Lcom/android/quickstep/interaction/TutorialFragment;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/interaction/TutorialFragment$3;->this$0:Lcom/android/quickstep/interaction/TutorialFragment;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/quickstep/interaction/TutorialFragment;->mRootView:Lcom/android/quickstep/interaction/RootSandboxLayout;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
