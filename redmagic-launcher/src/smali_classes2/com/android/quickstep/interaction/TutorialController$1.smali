.class Lcom/android/quickstep/interaction/TutorialController$1;
.super Landroid/view/ViewOutlineProvider;
.source "TutorialController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/interaction/TutorialController;-><init>(Lcom/android/quickstep/interaction/TutorialFragment;Lcom/android/quickstep/interaction/TutorialController$TutorialType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/interaction/TutorialController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/interaction/TutorialController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/TutorialController$1;->this$0:Lcom/android/quickstep/interaction/TutorialController;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/interaction/TutorialController$1;->this$0:Lcom/android/quickstep/interaction/TutorialController;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/interaction/TutorialController;->j(Lcom/android/quickstep/interaction/TutorialController;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/interaction/TutorialController$1;->this$0:Lcom/android/quickstep/interaction/TutorialController;

    .line 8
    .line 9
    iget p0, p0, Lcom/android/quickstep/interaction/TutorialController;->mExitingAppRadius:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
